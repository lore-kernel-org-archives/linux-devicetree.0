From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] phy: sun4i-usb: support PHY0 on H3
 in MUSB mode
Date: Sun, 22 Jan 2017 17:39:05 +0800
Message-ID: <9112691485077945@web29h.yandex.ru>
References: <20170116191449.50397-1-icenowy@aosc.xyz>
	 <20170116191449.50397-2-icenowy@aosc.xyz>
	 <20170117080611.tn7s7ddj2csqr27m@lukather>
	 <3866431484672228@web20j.yandex.ru>
	 <20170117200658.gcrcxeanthdtwg26@lukather>
	 <CAGb2v67kYtrTdw9YMS7wvRa=2MWYJ=BEc9SmUOds7hNYZKOz9g@mail.gmail.com>
	 <20170119143445.dmckuqjxmfhwr3h5@lukather> <1682741484838608@web2j.yandex.ru>
	 <20170119202709.GA1853@excalibur.cnev.de> <93a01892-47b5-5445-d802-f56bdac8371f@redhat.com>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBPH3SHCAKGQE4KLKCVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <93a01892-47b5-5445-d802-f56bdac8371f-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



20.01.2017, 16:04, "Hans de Goede" <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
> HI,
>
> On 19-01-17 21:27, Karsten Merker wrote:
>> =C2=A0On Thu, Jan 19, 2017 at 11:10:08PM +0800, Icenowy Zheng wrote:
>>> =C2=A019.01.2017, 22:34, "Maxime Ripard" <maxime.ripard@free-electrons.=
com>:
>>>> =C2=A0On Wed, Jan 18, 2017 at 04:09:32AM +0800, Chen-Yu Tsai wrote:
>>>>> =C2=A0=C2=A0On Wed, Jan 18, 2017 at 4:06 AM, Maxime Ripard
>>>>> =C2=A0=C2=A0<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>>>> =C2=A0=C2=A0> On Wed, Jan 18, 2017 at 12:57:08AM +0800, Icenowy Zheng=
 wrote:
>>>>> =C2=A0=C2=A0>> 17.01.2017, 16:06, "Maxime Ripard" <maxime.ripard@free=
-electrons.com>:
>>>>> =C2=A0=C2=A0>> > On Tue, Jan 17, 2017 at 03:14:46AM +0800, Icenowy Zh=
eng wrote:
>>>>> =C2=A0=C2=A0>> >> The PHY0 on H3 can be wired either to MUSB controll=
er or OHCI/EHCI
>>>>> =C2=A0=C2=A0>> >> controller.
>>>>> =C2=A0=C2=A0>> >>
>>>>> =C2=A0=C2=A0>> >> The original driver wired it to OHCI/EHCI controlle=
r; however, as the
>>>>> =C2=A0=C2=A0>> >> code to use PHY0 as OHCI/EHCI is missing, it makes =
the PHY fully
>>>>> =C2=A0=C2=A0>> >> unusable.
>>>>> =C2=A0=C2=A0>> >>
>>>>> =C2=A0=C2=A0>> >> Rename the register (according to its function and =
the name in BSP
>>>>> =C2=A0=C2=A0>> >> driver), and remove the code which wires the PHY0 t=
o OHCI/EHCI, as MUSB
>>>>> =C2=A0=C2=A0>> >> can support both peripheral and host mode (although=
 the host mode of
>>>>> =C2=A0=C2=A0>> >> MUSB is buggy).
>>>>> =C2=A0=C2=A0>> >
>>>>> =C2=A0=C2=A0>> > Can you elaborate on that? What's wrong with it?
>>>>> =C2=A0=C2=A0>>
>>>>> =C2=A0=C2=A0>> The configuration is at bit 0 of register 0x20 in PHY.
>>>>> =C2=A0=C2=A0>>
>>>>> =C2=A0=C2=A0>> When the PHY is reseted, it defaults as MUSB mode.
>>>>> =C2=A0=C2=A0>>
>>>>> =C2=A0=C2=A0>> However, the original author of the H3 PHY code seems =
to be lack of
>>>>> =C2=A0=C2=A0>> this knowledge (He named it PHY_UNK_H3), and changed t=
he PHY to HCI
>>>>> =C2=A0=C2=A0>> mode.
>>>>> =C2=A0=C2=A0>>
>>>>> =C2=A0=C2=A0>> I just removed the code that wires it to HCI mode, thu=
s it will work
>>>>> =C2=A0=C2=A0>> in MUSB mode, with my sun8i-h3-musb patch.
>>>>> =C2=A0=C2=A0>
>>>>> =C2=A0=C2=A0> I have no idea what you mean by MUSB mode.
>>>>> =C2=A0=C2=A0>
>>>>> =C2=A0=C2=A0> Do you mean that the previous code was only working in =
host mode, and
>>>>> =C2=A0=C2=A0> now it only works in peripheral?
>>>>>
>>>>> =C2=A0=C2=A0From what I understand, with the H3, Allwinner has put a =
mux
>>>>> =C2=A0=C2=A0in front of the MUSB controller. The mux can send the USB=
 data
>>>>> =C2=A0=C2=A0to/from the MUSB controller, or a standard EHCI/OHCI pair=
.
>>>>> =C2=A0=C2=A0This register controls said mux.
>>>>>
>>>>> =C2=A0=C2=A0This means we can use a proper USB host for host mode,
>>>>> =C2=A0=C2=A0instead of the limited support in MUSB.
>>>>
>>>> =C2=A0But musb can still operate as a host, right?
>>>
>>> =C2=A0Yes!
>>
>> =C2=A0Hello,
>>
>> =C2=A0I don't know how the MUSB implementation in the H3 behaves as I
>> =C2=A0don't have any H3-based systems, but if it should happen to be
>> =C2=A0similar to the one in the A31s, it probably isn't a full-fledged
>> =C2=A0alternative to using an OHCI/EHCI controller.
>
> You right it isn't which is why I suggested that the phy-sun4i-usb
> code should set the mux to the OCHI/EHCI pair when the id pin
> is pulled low (host-mode).
>
>> =C2=A0From my practical experiments with the MUSB in the A31s in host
>> =C2=A0mode I can report that I hadn't been able to get multiple HIDs
>> =C2=A0(in my case keyboard and mouse) working at the same time. The
>> =C2=A0keyboard alone worked without problems, the mouse alone worked
>> =C2=A0without problems, but when both were connected, only one of them
>> =C2=A0worked.
>>
>> =C2=A0I had at that time talked to Hans de Goede about the problem and
>> =C2=A0if I remenber correctly, he had mentioned that the MUSB has
>> =C2=A0problems servicing more than one device that does interrupt
>> =C2=A0transfers (as HIDs do).
>>
>> =C2=A0Hans, can you perhaps shed some light on this?
>
> Everything you've said is correct, the MUSB can emulate a
> host-controller, but it is not really one and when possible
> should not be used as such.

But implement proper EHCI/OHCI pair and MUSB coexistence needs
a lot of code, and MUSB can still work.

We can now just enable MUSB, then after the coexistence is done,
switch to use MUSB for peripheral and {E,O}HCI for host.

Seems that SoCs after sun8iw7 (H3) all have this feature. (At least
I verified it on H3, V3s, A64, H5)

P.S. The implementation on FreeBSD of A64 PHY uses a dedicated
PHY number for the HCI pair, which seems to break the DT compatibility
between Linux and FreeBSD.

>
> Hans

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
