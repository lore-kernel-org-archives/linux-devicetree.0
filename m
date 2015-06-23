From: Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Add DMA tx and rx channels in UART
 interfaces for RK3288 SoCs
Date: Tue, 23 Jun 2015 14:11:36 -0700
Message-ID: <CAPz6YkUPm+r5BmfxYokJF22yS71VXcsutwKR9y7FiET_3eLpeg@mail.gmail.com>
References: <1434475166-30338-1-git-send-email-romain.perier@gmail.com>
 <CABgxDo+8MafT8hOzpG=gjju=S7bVtNBOKxmi_JPHv1bDZSGeCQ@mail.gmail.com> <1475991.JRcDMpQrFc@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475991.JRcDMpQrFc@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 23, 2015 at 4:09 AM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Hi Romain,
>
> Am Dienstag, 23. Juni 2015, 08:53:17 schrieb Romain Perier:
>> ping :)
>
> I haven't forgotten this patch :-)
>
> I just haven't fully made up my mind concerning the bug in the pl330
> implementation on Rockchip SoCs - aka if we'll make it worse by also =
enabling
> dma on the uarts.
>
> So far the problem reports I read only mentioned degraded functionali=
ty like
> popping sounds in audio, not full system failures or freezes. So I te=
nd to
> include the patch and see what happens ;-)

You should look out for corrupted data -- like zeros or repeated data
in the serial input or output.  That was what was causing the pops --
a sudden sample of zeros, or buzzing from repeated samples.

It may not happen at low speeds, but might happen if you tried doing
something like PPP over the UART.

>
>
> Heiko
>
>
>
>> 2015-06-16 19:19 GMT+02:00 Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> > This enable DMA capability for the corresponding UART interfaces, =
also it
>> > removes warning "ttyS%d - Failed to request dma" from kernel logs.
>> >
>> > Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >
>> > Changes since v1 ("[PATCH] ARM: dts: rockchip: Add dmac_bus rx and=
 tx for
> uart2"):
>> >         - Add DMA tx and rx channels for all UART interfaces
>> >         - Rename commit summary
>> >
>> >  arch/arm/boot/dts/rk3288.dtsi | 10 ++++++++++
>> >  1 file changed, 10 insertions(+)
>> >
>> > diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3=
288.dtsi
>> > index 22316d0..1996452 100644
>> > --- a/arch/arm/boot/dts/rk3288.dtsi
>> > +++ b/arch/arm/boot/dts/rk3288.dtsi
>> > @@ -359,6 +359,8 @@
>> >
>> >                 clock-names =3D "baudclk", "apb_pclk";
>> >                 pinctrl-names =3D "default";
>> >                 pinctrl-0 =3D <&uart0_xfer>;
>> >
>> > +               dmas =3D <&dmac_peri 1>, <&dmac_peri 2>;
>> > +               dma-names =3D "tx", "rx";
>> >
>> >                 status =3D "disabled";
>> >
>> >         };
>> >
>> > @@ -372,6 +374,8 @@
>> >
>> >                 clock-names =3D "baudclk", "apb_pclk";
>> >                 pinctrl-names =3D "default";
>> >                 pinctrl-0 =3D <&uart1_xfer>;
>> >
>> > +               dmas =3D <&dmac_peri 3>, <&dmac_peri 4>;
>> > +               dma-names =3D "tx", "rx";
>> >
>> >                 status =3D "disabled";
>> >
>> >         };
>> >
>> > @@ -385,6 +389,8 @@
>> >
>> >                 clock-names =3D "baudclk", "apb_pclk";
>> >                 pinctrl-names =3D "default";
>> >                 pinctrl-0 =3D <&uart2_xfer>;
>> >
>> > +               dmas =3D <&dmac_bus_s 4>, <&dmac_bus_s 5>;
>> > +               dma-names =3D "tx", "rx";
>> >
>> >                 status =3D "disabled";
>> >
>> >         };
>> >
>> > @@ -398,6 +404,8 @@
>> >
>> >                 clock-names =3D "baudclk", "apb_pclk";
>> >                 pinctrl-names =3D "default";
>> >                 pinctrl-0 =3D <&uart3_xfer>;
>> >
>> > +               dmas =3D <&dmac_peri 7>, <&dmac_peri 8>;
>> > +               dma-names =3D "tx", "rx";
>> >
>> >                 status =3D "disabled";
>> >
>> >         };
>> >
>> > @@ -411,6 +419,8 @@
>> >
>> >                 clock-names =3D "baudclk", "apb_pclk";
>> >                 pinctrl-names =3D "default";
>> >                 pinctrl-0 =3D <&uart4_xfer>;
>> >
>> > +               dmas =3D <&dmac_peri 9>, <&dmac_peri 10>;
>> > +               dma-names =3D "tx", "rx";
>> >
>> >                 status =3D "disabled";
>> >
>> >         };
>> >
>> > --
>> > 1.9.1
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
