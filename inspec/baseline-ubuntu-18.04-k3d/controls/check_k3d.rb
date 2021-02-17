# copyright: 2021, Urs Voegele

title "check k3d"

# check k3d command
control "k3d-1.0" do                        # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title "check if k3d command exists"       # A human-readable title
  desc "check k3d command"
  describe command('k3d --version') do
    its('exit_status') { should eq 0 }
  end
end
