From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3 2/2] phy: add a driver for the Rockchip SoC internal
 PCIe PHY
Date: Mon, 27 Jun 2016 16:23:01 -0700
Message-ID: <20160627232301.GA101555@google.com>
References: <1466040179-30973-1-git-send-email-shawn.lin@rock-chips.com>
 <5763F665.6070403@ti.com>
 <c88eb16f-e976-ad52-02fb-5ec7b6e261b9@rock-chips.com>
 <57678ED2.9000707@ti.com>
 <428a1393-c6b4-163c-ceec-9b79fdd8ad4a@rock-chips.com>
 <20160623233737.GB21157@google.com>
 <180dc842-3daf-a8b2-b333-fb51e4bc4f2a@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <180dc842-3daf-a8b2-b333-fb51e4bc4f2a@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Wenrui Li <wenrui.li@rock-chips.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Fri, Jun 24, 2016 at 09:37:41AM +0800, Shawn Lin wrote:
> =E5=9C=A8 2016/6/24 7:37, Brian Norris =E5=86=99=E9=81=93:
> >On Thu, Jun 23, 2016 at 10:30:17AM +0800, Shawn Lin wrote:
> >>=E5=9C=A8 2016/6/20 14:36, Kishon Vijay Abraham I =E5=86=99=E9=81=93=
:
> >>>On Monday 20 June 2016 06:28 AM, Shawn Lin wrote:
> >>>>On 2016/6/17 21:08, Kishon Vijay Abraham I wrote:
> >>>>>On Thursday 16 June 2016 06:52 AM, Shawn Lin wrote:

> >>>>>>+void rockchip_pcie_phy_laneoff(struct phy *phy)
> >>>>>>+{
> >>>>>>+    u32 status;
> >>>>>>+    struct rockchip_pcie_phy *rk_phy =3D phy_get_drvdata(phy);
> >>>>>>+    int i;
> >>>>>>+
> >>>>>>+    for (i =3D 0; i < PHY_MAX_LANE_NUM; i++) {
> >>>>>>+        status =3D phy_rd_cfg(rk_phy, PHY_LANE_A_STATUS + i);
> >>>>>>+        if (!((status >> PHY_LANE_RX_DET_SHIFT) &
> >>>>>>+               PHY_LANE_RX_DET_TH))
> >>>>>>+            pr_debug("lane %d is used\n", i);
> >>>>>>+        else
> >>>>>>+            regmap_write(rk_phy->reg_base,
> >>>>>>+                     rk_phy->phy_data->pcie_laneoff,
> >>>>>>+                     HIWORD_UPDATE(PHY_LANE_IDLE_OFF,
> >>>>>>+                           PHY_LANE_IDLE_MASK,
> >>>>>>+                           PHY_LANE_IDLE_A_SHIFT + i));
> >>>>>>+    }
> >>>>>>+}
> >>>>>>+EXPORT_SYMBOL_GPL(rockchip_pcie_phy_laneoff);
> >
> >Shawn, I can't find an example of how you planned to use this (thoug=
h I
> >can make educated guesses). As such, it's possible there's some
> >misunderstanding. Maybe you can include a sample patch for the PCIe
> >controller driver?
>=20
> It will be called after rockchip_pcie_init_port for phy to disable
> the unused lanes.

A real, working patch would be nice. FWIW, when I try the following
diff, my PCIe WiFi dies gloriously:


diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-r=
ockchip.c
index 661d6e04af71..fbb3dd8da0c7 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -373,6 +373,8 @@ static struct pci_ops rockchip_pcie_ops =3D {
 	.write =3D rockchip_pcie_wr_conf,
 };
=20
+extern void rockchip_pcie_phy_laneoff(struct phy *phy);
+
 /**
  * rockchip_pcie_init_port - Initialize hardware
  * @port: PCIe port information
@@ -533,6 +535,8 @@ static int rockchip_pcie_init_port(struct rockchip_=
pcie_port *port)
 	pcie_write(port, 0x0,
 		   PCIE_CORE_AXI_CONF_BASE + PCIE_CORE_OB_REGION_DESC1);
=20
+	rockchip_pcie_phy_laneoff(port->phy);
+
 	return 0;
 }
=20

> >Related: it might make sense to have the PCIe controller and PHY
> >drivers/bindings all in the same patch series (with proper threading=
,
> >which we already talked about off-list).
> >
> >>>>>Er.. don't use export symbols from phy driver. I think it would =
be nice if you
> >>>>>can model the driver in such a way that the PCIe driver can cont=
rol individual
> >>>>>phy's.
> >>>>>
> >>>>
> >>>>Yes, I was trying to look for a way not to export symbols from
> >>>>phy... But I failed to find it as there at least need three
> >>>>interaction between controller and phy which made me believe we
> >>>>at least need to export one symbol without adding new API for phy=
=2E
> >
> >My interpretation of the above is that Shawn means we might turn off=
 up
> >to 3 different lanes (i.e., 3 of 4 supported lanes might be unused).
>=20
> yes, pcie drivers support up to 4 lanes. But the device may only
> support x2. This is beyound the awareness of PCIe controller, so pcie
> controller can't tell which one(s) should be turned off.

Are you sure the PCIe controller can't know? I'm pretty sure it has kno=
w
how many lanes are in use. And your controller even has this coded in
it:

	status =3D pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
	status =3D  0x1 << ((status >> PCIE_CORE_PL_CONF_LANE_SHIFT) &
			   PCIE_CORE_PL_CONF_LANE_MASK);
	dev_dbg(port->dev, "current link width is x%d\n", status);

So, doesn't that mean that out of lanes {0, 1, 2, 3}, that every lane
other than 0 <=3D lane < width is unused? So you can just disable those=
,
and have the same effect as the rockchip_pcie_phy_laneoff() function?

> >>>That can be managed by implementing a small state machine within t=
he PHY driver.
> >>
> >>I don't understand your point of implementing a small state machine
> >>within the PHY driver.
> >
> >I'm not 100% sure I understand, but I think I have a reasonable
> >interpretation below.
> >
> >>Do you mean I need to call vaarious of power_on/off and count the
> >>on/off times to decide the state machine?
> >>
> >>I would appreciate it If you could elaborate this a bit more or
> >>show me a example. :)
> >
> >My interpretation: rather than associating a single PCIe controller
> >device with a single struct phy that controls up to 4 lanes, Kishon =
is
> >suggesting you should have this driver implement 4 phy objects, one =
for
> >each lane. You'd need to add #phy-cells =3D <1> to the DT binding, a=
nd
> >implement an ->of_xlate() hook so we can associate/address them
> >properly. Then the PCIe controller would call phy_power_off() on eac=
h
> >lane that's not used.
>=20
> As I say above, even we have 4 phy objects, PCIe controller still
> doesn't know which one(s) to be turned off, so you have to call 4 tim=
es
> phy_power_off if I understand it correctly. This doesn't look
> okay to me.

Brian
