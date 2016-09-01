From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 0/9] PCI: rockchip: Cleanups against v10
Date: Thu, 01 Sep 2016 11:43:52 -0500
Message-ID: <20160901163758.14195.15725.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: devicetree@vger.kernel.org, Wenrui Li <wenrui.li@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci@vger.kernel.org, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

These are cleanups against 2098142ae87d, the current pci/host-rockchip
head in my tree.  This is basically the v10 driver posting (it's not
identical because I had already tweaked a few things and squashed in
Brian's bug fix).

These haven't been compiled so I'm sure the 0-day builder will find some
errors.  After fixing those, I intend to squash everything into one commit,
since this driver hasn't been merged yet.  I'm just posting these split out
patches in case anybody wants to review them.

These address most of Guenter's review comments.  I didn't change anything
related to -EPROBE_DEFER because it wasn't obvious to me what to do.

I also made several other changes -- mostly renaming functions and
variables so they're more consistent with other PCI host drivers.

These are in git as pci/host-rockchip-wip.

---

Bjorn Helgaas (9):
      Remove unused symbols, unnecessary parens, other minor comments from
      Rename pcie_read() and pcie_write() to rockchip_pcie_read() and
      Always use "rockchip" as the pointer to per-device struct.
      Rename struct rockchip_pcie_port to struct rockchip_pcie.
      Use a local "dev" to avoid repetition of "rockchip->dev".
      Add comment about why 32-bit read/modify/write isn't safe.
      Simplify the confusing HIWORD_UPDATE scheme.
      Simplify testing of link status and speed testing.
      Move msleeps to address Guenter's comments.


 drivers/pci/host/pcie-rockchip.c |  680 +++++++++++++++++---------------------
 1 file changed, 307 insertions(+), 373 deletions(-)
