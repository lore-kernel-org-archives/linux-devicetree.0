From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH 01/14] ARM: dts: sun8i: Add SID node
Date: Sat, 25 Jun 2016 09:09:31 +0800
Message-ID: <CAGb2v65MD1EMs5MNahMDnkt4-EQjUGSTxTXkGZz1i9xaEXs+Gw@mail.gmail.com>
References: <20160623192104.18720-1-megous@megous.com> <20160623192104.18720-2-megous@megous.com>
 <CAGb2v677+abNOEg3iEoiH25Ji9tq0JXkrGUVvLPAbXAPD3Su_g@mail.gmail.com> <416577ad-f8d0-d12a-a092-9b22ad2f31f1@megous.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZNTW65QKGQE4TYCPNI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <416577ad-f8d0-d12a-a092-9b22ad2f31f1-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Jun 25, 2016 at 3:58 AM, Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wro=
te:
> Hello,
>
> thank you for the review.
>
> On 24.6.2016 04:41, Chen-Yu Tsai wrote:
>> On Fri, Jun 24, 2016 at 3:20 AM,  <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
>>> From: Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>
>>>
>>> Add a node describing the Security ID memory to the Allwinner H3 .dtsi =
file.
>>>
>>> Signed-off-by: Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-=
h3.dtsi
>>> index 4a4926b..172576d 100644
>>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
>>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>>> @@ -389,6 +389,13 @@
>>>                         #size-cells =3D <0>;
>>>                 };
>>>
>>> +               sid: eeprom@01c14000 {
>>> +                       compatible =3D "allwinner,sun4i-a10-sid";
>>
>> This has been discussed before. The hardware is not compatible.
>> The write control registers are at different offsets.
>
> I'm not sure what you mean by write control registers. Code in
> sunxi_sid.c implements only read access to the nvram. Can you pelase
> elaborate?

See http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/388=
022.html

Also, different compatibles are used for different hardware, regardless
of how close the drivers may be. The driver might only be compatible when
implementing a subset of the possible features. If one were to fully
implement it, they would become incompatible.

To put it another way, the compatible string designates the hardware,
and the driver implements support for that compatible string.

ChenYu

>   Ondrej
>
>>
>> ChenYu
>>
>>> +                       reg =3D <0x01c14000 0x400>;
>>> +                       #address-cells =3D <1>;
>>> +                       #size-cells =3D <1>;
>>> +               };
>>> +
>>>                 usbphy: phy@01c19400 {
>>>                         compatible =3D "allwinner,sun8i-h3-usb-phy";
>>>                         reg =3D <0x01c19400 0x2c>,
>>> --
>>> 2.9.0
>>>
>
> --
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
