From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: Add DT support for Olimex SAM9-L9260 board.
Date: Thu, 19 May 2016 07:50:20 -0500
Message-ID: <CAL_JsqLXaq7KKPKnSTcRBswnvdZiUS=1wb35oo+JrjY3_tPRJQ@mail.gmail.com>
References: <1463574766-15568-1-git-send-email-raashidmuhammed@zilogic.com>
 <20160518232925.GA6545@rob-hp-laptop> <573DB180.9030200@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <573DB180.9030200-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Raashid Muhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, vijaykumar-NDm7FNP0skFg9hUCZPvPmw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 19, 2016 at 7:28 AM, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org=
> wrote:
> Le 19/05/2016 01:29, Rob Herring a =C3=A9crit :
>> On Wed, May 18, 2016 at 06:02:46PM +0530, Raashid Muhammed wrote:
>>> From: Raashid Muhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
>>>
>>> sam9-l9260 is a low cost board designed by Olimex.
>>>
>>> More infomation is available at:
>>> https://www.olimex.com/Products/ARM/Atmel/SAM9-L9260/
>>>
>>> Signed-off-by: Raashid Muhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
>>> Reviewed-by: Vijay Kumar B. <vijaykumar-NDm7FNP0skFg9hUCZPvPmw@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/arm/olimex-at91.txt        |   6 ++
>>>  arch/arm/boot/dts/Makefile                         |   1 +
>>>  arch/arm/boot/dts/sam9-l9260.dts                   | 108 +++++++++=
++++++++++++
>
> For AT91-based boards, please use this prefix: "at91-" as stated in t=
he
> Atmel README file:
> http://lxr.free-electrons.com/source/Documentation/arm/Atmel/README#L=
127
>
> So I would recommend this name instead:
> at91-sam9-l9260.dts
>
>
>>>  3 files changed, 115 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/arm/olimex-at=
91.txt
>>>  create mode 100644 arch/arm/boot/dts/sam9-l9260.dts
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/olimex-at91.txt =
b/Documentation/devicetree/bindings/arm/olimex-at91.txt
>>> new file mode 100644
>>> index 0000000..0587d63
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/olimex-at91.txt
>>> @@ -0,0 +1,6 @@
>>> +Olimex AT91 Device Tree Bindings
>>> +--------------------------------
>>
>> There's not an existing at91 or olimex file this would fit into? We
>> don't need 1 file per board.
>>
>>> +
>>> +SAM9-L9260 Board
>>> +Required root node properties:
>>> +    - compatible =3D "olimex,sam9-l9260", "atmel,at91sam9260";
>
> I don't think this file is needed at all actually. We have a lot of
> board files and none of them have a dedicated or particular entry for=
 them.

Well, they should have one.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
