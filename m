From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: boot: mxs: Add On-Chip RAM
Date: Fri, 21 Oct 2016 23:03:36 +0800
Message-ID: <20161021150336.GJ30578@tiger>
References: <1473789066-8955-1-git-send-email-stefan.wahren@i2se.com>
 <20161021135343.GI30578@tiger>
 <9bf7c925-bdc2-d0b8-9886-70d46383d1e0@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9bf7c925-bdc2-d0b8-9886-70d46383d1e0-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?iso-8859-1?Q?J=F6rg?= Krause <joerg.krause-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar =?iso-8859-1?Q?Wa=DFmann?= <lw-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 04:05:59PM +0200, Stefan Wahren wrote:
> Am 21.10.2016 um 15:53 schrieb Shawn Guo:
> > On Tue, Sep 13, 2016 at 05:51:02PM +0000, Stefan Wahren wrote:
> >> The i.MX23 / i.MX28 have a small amount of On-Chip RAM which is also necessary
> >> for suspend to RAM and standby mode. But before we need to remove the fake reg
> >> properties of all internal bus nodes as discussed in this thread [1].
> >>
> >> This patch series requires Fabio Estevam's recent series "ARM: dts: imx23:
> >> Remove skeleton.dtsi inclusion" [2].
> >>
> >> [1] - https://marc.info/?l=devicetree&m=146139948426520&w=2
> > The page cannot be reached.  I would like to understand the
> > background for this change.
> 
> Strange, because i don't have any problems while clicking on the URL.
> 
> It's an older discussion on the devicetree / kernel newbie mailing list
> with subject "strange dtc errors after adding sram node". Arnd suggested
> in the discussion to remove the reg property from the ahb node.
> 
> Please try this one: http://www.spinics.net/lists/newbies/msg57652.html

If you go through 'Table 4-1. Address Map for i.MX28' of MCIMX28RM, you
should be able to find there are 3 AHB buses: ahb@0, ahb@80080000 and
ahb@c0000000.  The ocram goes to ahb@0.  The following change should be
the right one for ocram addition.

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 0ad893bf5f43..8e5718df06b2 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -47,6 +47,19 @@
                };
        };
 
+       ahb@0 {
+               compatible = "simple-bus";
+               #address-cells = <1>;
+               #size-cells = <1>;
+               reg = <0x0 0x80000000>;
+               ranges;
+
+               ocram: sram@0 {
+                       compatible = "mmio-sram";
+                       reg = <0x0 0x20000>;
+               };
+       };
+
        apb@80000000 {
                compatible = "simple-bus";
                #address-cells = <1>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
