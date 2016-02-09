From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun7i: Enable USB DRC on Itead Ibox
Date: Tue, 9 Feb 2016 20:54:52 +0100
Message-ID: <56BA440C.5030903@redhat.com>
References: <1455010156-27754-1-git-send-email-codekipper@gmail.com>
 <20160209183420.GW31506@lukather>
 <CAEKpxBncN5-WYTNTw+8jfZypiMNfJt=55qEx2zTPfvZmjr9XdQ@mail.gmail.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDRZXY4CYYORBE4I5G2QKGQELBN6F5I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAEKpxBncN5-WYTNTw+8jfZypiMNfJt=55qEx2zTPfvZmjr9XdQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/09/2016 08:10 PM, Code Kipper wrote:
>
>
> On 9 February 2016 at 19:34, Maxime Ripard <maxime.ripard@free-electrons.=
com <mailto:maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>> wrote:
>  > Hi,
>  >
>  > On Tue, Feb 09, 2016 at 10:29:16AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <mailto=
:codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>  >> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <mailto:codekipper-Re5JQEeQqe8@public.gmane.org=
m>>
>  >>
>  >> Enable the otg/drc usb controller on the Itead Ibox device.
>  >>
>  >> Note this board has the otg-vbus connected directly to the 5v-dcc of
>  >> the board, so there is no vbus0 regulator, nor vbus0-det.
>  >>
>  >> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <mailto:codekipper=
@gmail.com>>
>  >> ---
>  >> Changes since v1:
>  >> - Added comment concerning vbus0 regulator and detection to commit me=
ssage
>  >>
>  >> ---
>  >>  arch/arm/boot/dts/sun7i-a20-itead-ibox.dts     | 14 ++++++++++++++
>  >>  arch/arm/boot/dts/sunxi-itead-core-common.dtsi |  9 +++++++++
>  >>  2 files changed, 23 insertions(+)
>  >>
>  >> diff --git a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts b/arch/arm/bo=
ot/dts/sun7i-a20-itead-ibox.dts
>  >> index 661c21d..a512581 100644
>  >> --- a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>  >> +++ b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
>  >> @@ -118,8 +118,22 @@
>  >>               allwinner,drive =3D <SUN4I_PINCTRL_20_MA>;
>  >>               allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>  >>       };
>  >> +
>  >> +     usb0_id_detect_pin: usb0_id_detect_pin@0 {
>  >> +             allwinner,pins =3D "PH4";
>  >> +             allwinner,function =3D "gpio_in";
>  >> +             allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
>  >> +             allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
>  >> +     };
>  >>  };
>  >>
>  >>  &reg_ahci_5v {
>  >>       status =3D "okay";
>  >>  };
>  >> +
>  >> +&usbphy {
>  >> +     pinctrl-names =3D "default";
>  >> +     pinctrl-0 =3D <&usb0_id_detect_pin>;
>  >> +     usb0_id_det-gpio =3D <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
>  >> +     status =3D "okay";
>  >> +};
>  >> diff --git a/arch/arm/boot/dts/sunxi-itead-core-common.dtsi b/arch/ar=
m/boot/dts/sunxi-itead-core-common.dtsi
>  >> index 2565d51..d22eea3 100644
>  >> --- a/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
>  >> +++ b/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
>  >> @@ -88,6 +88,10 @@
>  >>       status =3D "okay";
>  >>  };
>  >>
>  >> +&otg_sram {
>  >> +     status =3D "okay";
>  >> +};
>  >> +
>  >>  #include "axp209.dtsi"
>  >>
>  >>  &reg_dcdc2 {
>  >> @@ -129,6 +133,11 @@
>  >>       status =3D "okay";
>  >>  };
>  >>
>  >> +&usb_otg {
>  >> +     dr_mode =3D "otg";
>  >
>  > If VBUS is tied to 5V, without anyway to disable it, then it cannot do
>  > OTG.
>  >
>  > The mode it can do is host.
> This is the same patch as what was applied to cubieboard2 https://git.ker=
nel.org/cgit/linux/kernel/git/next/linux-next.git/commit/arch/arm/boot/dts/=
sun7i-a20-cubieboard2.dts?id=3Db8962f7ee700580a148e05eceb2302bcfc59ffbc whi=
ch it looks like this hardware copies. I can power the Ibox using this USB =
socket and when I plug in a usb2ethernet device then it is detected.

Right, the otg port on the cubieboard can work in otg mode just fine, as lo=
ng as either the
otg is the only power supply, or the 5v supplied to the power barrel comes =
from the same
source as the otg 5v. Note that only allowing host mode does not take away =
this limitation
as the 2 5v pins are hardwired together, so we might just as well offer otg=
 support.

Regards,

Hans

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
