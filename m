From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] arm64: defconfig: Add Renesas R-Car USB 3.0 driver
 support
Date: Thu, 21 Apr 2016 03:41:14 +0000
Message-ID: <SG2PR06MB0919C567798F775F2685811ED86E0@SG2PR06MB0919.apcprd06.prod.outlook.com>
References: <1461142034-5008-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20160421031514.GB11116@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160421031514.GB11116@verge.net.au>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon-san,

> From: Simon Horman
> Sent: Thursday, April 21, 2016 12:15 PM
> 
> Hi Shimoda-san,
> 
> On Wed, Apr 20, 2016 at 05:47:14PM +0900, Yoshihiro Shimoda wrote:
> > If we doesn't enable this configuration and runs on R-Car Gen3,
> > xhci host driver will cause timeout in xhci_reset() because
> > the R-Car Gen3 xHCI controller needs specific initialization.
> >
> > [    1.565605] xhci-hcd ee000000.usb: xHCI Host Controller
> > [    1.570636] xhci-hcd ee000000.usb: new USB bus registered, assigned bus number 5
> > [   22.270160] xhci-hcd ee000000.usb: can't setup: -110
> > [   22.274931] xhci-hcd ee000000.usb: USB bus 5 deregistered
> > [   22.280158] xhci-hcd: probe of ee000000.usb failed with error -110

I'm afraid but this issue can be fixed if we apply the following patch into xhci-rcar.h.
So, I will submit such a patch to USB ML later.

==============================================================================
diff --git a/drivers/usb/host/xhci-rcar.h b/drivers/usb/host/xhci-rcar.h
index 2941a25..0681235 100644
--- a/drivers/usb/host/xhci-rcar.h
+++ b/drivers/usb/host/xhci-rcar.h
@@ -24,7 +24,7 @@ static inline void xhci_rcar_start(struct usb_hcd *hcd)
 
 static inline int xhci_rcar_init_quirk(struct usb_hcd *hcd)
 {
-	return 0;
+	return -ENODEV;
 }
 #endif
 #endif /* _XHCI_RCAR_H */
==============================================================================

Also I will remove this commit log from in this patch.

> > Remarks:
> > The timestamp doesn't work correctly on R-Car H3 ES1.0. It should be
> > 10 seconds.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  arch/arm64/configs/defconfig | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index a44ef99..a95751d 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1,7 +1,6 @@
> >  # CONFIG_LOCALVERSION_AUTO is not set
> >  CONFIG_SYSVIPC=y
> >  CONFIG_POSIX_MQUEUE=y
> > -CONFIG_FHANDLE=y
> >  CONFIG_AUDIT=y
> >  CONFIG_NO_HZ_IDLE=y
> >  CONFIG_HIGH_RES_TIMERS=y
> 
> Is the hunk above intended?
> It does not seem to match my reading of the changelog.

Perhaps I should make a patch for this change because
if I did the following commands, this change appeared.

on renesas-devel-20160420-v4.6-rc4
$ make defconfig
$ cp defconfig arch/arm64/config
$ git diff

Best regards,
Yoshihiro Shimoda

> > @@ -192,7 +191,7 @@ CONFIG_SND_SOC_AK4613=y
> >  CONFIG_USB=y
> >  CONFIG_USB_OTG=y
> >  CONFIG_USB_XHCI_HCD=y
> > -CONFIG_USB_XHCI_PLATFORM=y
> > +CONFIG_USB_XHCI_RCAR=y
> >  CONFIG_USB_EHCI_HCD=y
> >  CONFIG_USB_EHCI_MSM=y
> >  CONFIG_USB_EHCI_HCD_PLATFORM=y
> > --
> > 1.9.1
