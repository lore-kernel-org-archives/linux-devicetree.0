From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 1/4] phy: sun4i-usb: support PHY0 on H3 in
 MUSB mode
Date: Thu, 19 Jan 2017 23:10:08 +0800
Message-ID: <1682741484838608@web2j.yandex.ru>
References: <20170116191449.50397-1-icenowy@aosc.xyz>
	 <20170116191449.50397-2-icenowy@aosc.xyz>
	 <20170117080611.tn7s7ddj2csqr27m@lukather>
	 <3866431484672228@web20j.yandex.ru>
	 <20170117200658.gcrcxeanthdtwg26@lukather>
	 <CAGb2v67kYtrTdw9YMS7wvRa=2MWYJ=BEc9SmUOds7hNYZKOz9g@mail.gmail.com> <20170119143445.dmckuqjxmfhwr3h5@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBVFNQPCAKGQEHEW5GAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170119143445.dmckuqjxmfhwr3h5@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



19.01.2017, 22:34, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Wed, Jan 18, 2017 at 04:09:32AM +0800, Chen-Yu Tsai wrote:
>> =C2=A0Hi,
>>
>> =C2=A0On Wed, Jan 18, 2017 at 4:06 AM, Maxime Ripard
>> =C2=A0<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> =C2=A0> On Wed, Jan 18, 2017 at 12:57:08AM +0800, Icenowy Zheng wrote:
>> =C2=A0>>
>> =C2=A0>>
>> =C2=A0>> 17.01.2017, 16:06, "Maxime Ripard" <maxime.ripard@free-electron=
s.com>:
>> =C2=A0>> > On Tue, Jan 17, 2017 at 03:14:46AM +0800, Icenowy Zheng wrote=
:
>> =C2=A0>> >> The PHY0 on H3 can be wired either to MUSB controller or OHC=
I/EHCI
>> =C2=A0>> >> controller.
>> =C2=A0>> >>
>> =C2=A0>> >> The original driver wired it to OHCI/EHCI controller; howeve=
r, as the
>> =C2=A0>> >> code to use PHY0 as OHCI/EHCI is missing, it makes the PHY f=
ully
>> =C2=A0>> >> unusable.
>> =C2=A0>> >>
>> =C2=A0>> >> Rename the register (according to its function and the name =
in BSP
>> =C2=A0>> >> driver), and remove the code which wires the PHY0 to OHCI/EH=
CI, as MUSB
>> =C2=A0>> >> can support both peripheral and host mode (although the host=
 mode of
>> =C2=A0>> >> MUSB is buggy).
>> =C2=A0>> >
>> =C2=A0>> > Can you elaborate on that? What's wrong with it?
>> =C2=A0>>
>> =C2=A0>> The configuration is at bit 0 of register 0x20 in PHY.
>> =C2=A0>>
>> =C2=A0>> When the PHY is reseted, it defaults as MUSB mode.
>> =C2=A0>>
>> =C2=A0>> However, the original author of the H3 PHY code seems to be lac=
k of
>> =C2=A0>> this knowledge (He named it PHY_UNK_H3), and changed the PHY to=
 HCI
>> =C2=A0>> mode.
>> =C2=A0>>
>> =C2=A0>> I just removed the code that wires it to HCI mode, thus it will=
 work
>> =C2=A0>> in MUSB mode, with my sun8i-h3-musb patch.
>> =C2=A0>
>> =C2=A0> I have no idea what you mean by MUSB mode.
>> =C2=A0>
>> =C2=A0> Do you mean that the previous code was only working in host mode=
, and
>> =C2=A0> now it only works in peripheral?
>>
>> =C2=A0From what I understand, with the H3, Allwinner has put a mux
>> =C2=A0in front of the MUSB controller. The mux can send the USB data
>> =C2=A0to/from the MUSB controller, or a standard EHCI/OHCI pair.
>> =C2=A0This register controls said mux.
>>
>> =C2=A0This means we can use a proper USB host for host mode,
>> =C2=A0instead of the limited support in MUSB.
>
> But musb can still operate as a host, right?

Yes!

>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
