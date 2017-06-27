From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: Re: [PATCH v3 2/3] dt-bindings: input: Add R_LRADC
 support for A83T
Date: Tue, 27 Jun 2017 23:29:10 +0800
Message-ID: <24845446a80e3542d90a1111a6141415@aosc.io>
References: <20170624024515.4669-1-techping.chan@gmail.com>
 <20170624024515.4669-3-techping.chan@gmail.com>
 <20170626171524.cqfyasetpsfr6xfg@flea.lan>
 <CAAST=9x+fS41tznuJ9hQ-cQxecKN751=61YkhEt31DvpeqeEcA@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBSPTZHFAKGQEBTLYZYI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAAST=9x+fS41tznuJ9hQ-cQxecKN751=61YkhEt31DvpeqeEcA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-06-27 23:18=EF=BC=8CZiping Chen =E5=86=99=E9=81=93=EF=BC=9A
> 2017-06-27 1:15 GMT+08:00 Maxime Ripard=20
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
>> Hi,
>>=20
>> On Sat, Jun 24, 2017 at 10:45:14AM +0800, Ziping Chen wrote:
>>> From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>=20
>>> Allwinner A83T SoC has a low res adc like the one
>>> in Allwinner A10 SoC.
>>>=20
>>> Add binding for it.
>>>=20
>>> Signed-off-by: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt | 6=20
>>> ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git=20
>>> a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt=20
>>> b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
>>> index 4357e498ef04..525d85e3043f 100644
>>> --- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
>>> +++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
>>> @@ -2,12 +2,14 @@ Allwinner sun4i low res adc attached tablet keys
>>>  ------------------------------------------------
>>>=20
>>>  Required properties:
>>> - - compatible: "allwinner,sun4i-a10-lradc-keys"
>>> + - compatible: should be one of the following string:
>>> +             "allwinner,sun4i-a10-lradc-keys"
>>> +             "allwinner,sun8i-a83t-r-lradc-keys"
>>=20
>> This doesn't really have anything related to keys, and can be used
>> purely as an ADC.
>>=20
>> I know this is the compatible that was used for the A10, but I'd
>> rather drop the keys for the the new compatible.
>>=20
>=20
> Hi,
> LRADC is named KEYADC in some other SoCs' User Manual(such as R40 User
> Manual V1.0), thus LRADC is related to keys.
>=20
> Without keys there is another driver named sun4i-gpadc-iio which is
> located at driver/iio/adc/sun4i-gpadc-iio.c

Nope. The general purpose LRADC driver still doesn't land in mainline,
and this driver is for the GPADC related to thermal and resistive
touch screen.

However, the LRADC is possible to be used in general purpose, and
more and more boards are wiring the LRADC pin as a pin on the pinout
(e.g. Pine64 and Lichee Pi Zero) and it may be useful.

And the hardware is not bound to keys -- it's only the Allwinner
reference design which bind the LRADC to keys. Device vendors can
change it if needed.

So it's suggested to have a binding without "-keys".

Maxime, here's another problem: if we have already a GP LRADC driver,
how can we tell the kernel to use it as IIO ADC rather than keys?
Should we introduce a new property for this once ready?

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
