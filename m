From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 09/18] arm64: dts: ulcb-kf: enable USB2 PHY of channel 0
Date: Mon, 9 Oct 2017 09:17:37 +0200
Message-ID: <20171009071737.GI17360@verge.net.au>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737377-23191-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdX1FZ3_iKCMRkDozsn7QzEmmvuUzkjq5Hn9+L42F=X7sQ@mail.gmail.com>
 <806c5e8e-af85-e73b-a7a4-44ebf82dee7e@cogentembedded.com>
 <CAMuHMdXL1P5vhoBU9W+S1qX8maXLRmyg88cjgbYpCGZSQ1FBtQ@mail.gmail.com>
 <1c5fc090-af98-0041-be8b-b06dc81d4670@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1c5fc090-af98-0041-be8b-b06dc81d4670-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 06, 2017 at 08:28:52PM +0300, Vladimir Barinov wrote:
> Hi Geert,
> 
> On 06.10.2017 10:15, Geert Uytterhoeven wrote:
> >Hi Vladimir,
> >
> >CC Shimoda-san
> >
> >On Fri, Oct 6, 2017 at 4:38 AM, Vladimir Barinov
> ><vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> >>On 20.09.2017 15:59, Geert Uytterhoeven wrote:
> >>>On Thu, Sep 7, 2017 at 12:36 AM, Vladimir Barinov
> >>><vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> >>>>This supports USB2 PHY channel #0 on ULCB Kingfisher board
> >>>>
> >>>>Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> >>>Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >>>
> >>>>index ca8de1a..0854600 100644
> >>>>--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> >>>>+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> >>>>@@ -60,6 +60,11 @@
> >>>>                  groups = "scif1_data_b";
> >>>>                  function = "scif1";
> >>>>          };
> >>>>+
> >>>>+       usb0_pins: usb0 {
> >>>>+               groups = "usb0";
> >>>>+               function = "usb0";
> >>>>+       };
> >>>>   };
> >>>>
> >>>>   &scif1 {
> >>>>@@ -68,3 +73,10 @@
> >>>>
> >>>>          status = "okay";
> >>>>   };
> >>>>+
> >>>>+&usb2_phy0 {
> >>>>+       pinctrl-0 = <&usb0_pins>;
> >>>>+       pinctrl-names = "default";
> >>>>+
> >>>Don't you need
> >>>
> >>>      vbus-supply = <&vbus0_usb2>;
> >>>
> >>>with vbus0_usb2 a fixed regulator controlled by GPIO P11 (OTG_EXTLPn) from
> >>>GPIO expander U11 (TCA9539)?
> >>>May be optional, though. salvator-common.dtsi has it.
> >>Yes, I need this gpio.
> >>I need both OTG_EXTLPn and OTG_OFFVBUSn from the same gpio expander.
> >>
> >>I've been considering to use either vbus-supply + gpio hog or use gpio hog
> >>for both of them for consistency.
> >>What do you think about this?
> >For OTG_EXTLPn you don't really need a hog, as it will be controlled by the
> >USB driver/subsystem, like on Salvator-X(S), right?
> Agreed.
> >
> >For OTG_OFFVBUSn, which is (optionally) driven from USB0_PWEN on
> >Salvator-X(S) I don't know if you need a GPIO hog or not. I have to defer your
> >question to Shimoda-san.
> This pin should be tied permanently low to disable internal MAX3355 internal
> VBUS charge pump.
> Hence probably gpio hog is enough for OTG_OFFVBUSn.
> 
> KF has dedicated VBUS power supply controlled by USB0_PWEN.

Hi,

I am expecting an updated version of this patch.

Please post it in a fresh thread.

I have gone through the entire patch-set and applied everything that I
though was appropriate. If I have missed any then please repost them as
well, in a fresh patch-set.

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
