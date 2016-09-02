From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 00/15] PCI: rockchip: Cleanups against v10
Date: Fri, 02 Sep 2016 10:53:50 -0500
Message-ID: <20160902154501.8650.99790.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These are cleanups against 2098142ae87d, the current pci/host-rockchip
head in my tree.

Changes from v1:

  - Rework HIWORD_UPDATE
  - Remove duplicate CSR definitions
  - Move CSR block offset from read/write caller to CSR definition
  - Organize CSRs into logical blocks
  - Fix some inconsistent CSR names
  - Add names for registers at the base of CSR blocks

I was disappointed to find how disorganized the v10 CSR definitions were.
It was quite a hodgepodge.  I should have noticed that earlier, but as
penance, I tried to clean it up myself.

These are in git as pci/host-rockchip-wip.  Again, I intend to squash these
all into the single commit that adds the driver when I finally merge it.

---

Bjorn Helgaas (15):
      Remove unused symbols, unnecessary parens, other minor comments from
      Rename pcie_read() and pcie_write() to rockchip_pcie_read() and
      Always use "rockchip" as the pointer to per-device struct.
      Rename struct rockchip_pcie_port to struct rockchip_pcie.
      Use a local "dev" to avoid repetition of "rockchip->dev".
      Add comment about why 32-bit read/modify/write isn't safe.
      Simplify the confusing HIWORD_UPDATE scheme.
      Remove duplicate CSR definition.
      Move CSR bases into definition.
      Group related CSR definitions together.
      Rename PCIE_CORE_RC_CONF_SCC_SHIFT to match similar definitions.
      Rename ROCKCHIP_PCIE_RPIFR1_INTR_MASK and ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT
      The register at PCIE_CLIENT_BASE presumably has a name of its own.  Add a
      Simplify testing of link status and speed testing.
      Move msleeps to address Guenter's comments.


 drivers/pci/host/pcie-rockchip.c |  842 ++++++++++++++++++--------------------
 1 file changed, 391 insertions(+), 451 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
