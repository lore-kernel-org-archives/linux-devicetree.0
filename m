From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH v2 14/16] arm: dts: sun8i: h3: enable H3
 sid controller
Date: Fri, 20 Apr 2018 11:35:48 +0200
Message-ID: <0ab29bf0-b069-338e-f312-e533656fa0b6@gmail.com>
References: <20180128232919.12639-1-embed3d@gmail.com>
 <20180128232919.12639-15-embed3d@gmail.com>
 <20180129095200.attg7cgvpifpchtn@flea.lan>
 <470ec61e-8b08-5193-ede1-01d02b2c865e@gmail.com>
 <CACNAnaGVSbk7czb+mcGTx1C=YwCWe1qqHQDQe9+PNifwEXovMw@mail.gmail.com>
 <F1D7126A-B6ED-4A83-A941-5F39CED472CE@aosc.io>
 <CACNAnaFMKDmvAUXJngKHWkeGLfjsgn5hhJszNk7Sg4BU98Oafw@mail.gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD257DPK24NRB6HI43LAKGQE5AN2KSA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CACNAnaFMKDmvAUXJngKHWkeGLfjsgn5hhJszNk7Sg4BU98Oafw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, icenowy-h8G6r0blFSE@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kyle,

I'm already working on a Version 3 of this patch series. Right now this=20
slowed down since I'm very busy and the ToDo-List is still very long.

My plan is to send out a version during this release cycle.

If you need it right now feel free to submit patches!

Philipp

On 19.04.2018 17:19, Kyle Evans wrote:
> On Thu, Apr 19, 2018 at 10:13 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>>
>>
>> =E4=BA=8E 2018=E5=B9=B44=E6=9C=8819=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=8811:11:22, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> =E5=86=99=E5=88=B0:
>>> On Mon, Jan 29, 2018 at 6:03 AM, Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> wrote:
>>>>
>>>>
>>>> On 29.01.2018 10:52, Maxime Ripard wrote:
>>>>>
>>>>> On Mon, Jan 29, 2018 at 12:29:17AM +0100, Philipp Rossak wrote:
>>>>>>
>>>>>> This patch enables the the sid controller in the H3. It can be used
>>>>>> for thermal calibration data.
>>>>>>
>>>>>> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>> ---
>>>>>>    arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++
>>>>>>    1 file changed, 7 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi
>>>>>> b/arch/arm/boot/dts/sun8i-h3.dtsi
>>>>>> index 3f83f6a27c74..9bb5cc29fec5 100644
>>>>>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
>>>>>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
>>>>>> @@ -72,6 +72,13 @@
>>>>>>                  };
>>>>>>          };
>>>>>>    +     soc {
>>>>>> +               sid: eeprom@1c14000 {
>>>>>> +                       compatible =3D "allwinner,sun8i-h3-sid";
>>>>>> +                       reg =3D <0x01c14000 0x400>;
>>>>>> +               };
>>>>>> +       };
>>>>>> +
>>>>>
>>>>>
>>>>> Shouldn't you also use a nvmem-cells property to the THS node?
>>>>>
>>>>> Maxime
>>>>>
>>>>
>>>> Oh seems like I forgot that.
>>>> As related to the wiki [1] this should be 64 bit wide at the address
>>> 0x34. I
>>>> will add that in the next version.
>>>>
>>>>
>>>> [1]: http://linux-sunxi.org/SID_Register_Guide#eFUSE
>>>>
>>>> Thanks,
>>>> Philipp
>>>>
>>>
>>> Hi,
>>>
>>> Any chance this will see a v3 soon? I'm kind of interested in sid node
>>> for h3. =3D)
>>
>> This patch is independent and can be easily sent out
>> by its own.
>>
>=20
> Right- I had considered doing so, but wanted to make sure I wasn't
> going to collide with this series if a v3 is imminent.
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
