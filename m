From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] memory: ti-aemif: add bindings for AEMIF driver
Date: Fri, 29 Nov 2013 17:00:10 +0200
Message-ID: <5298ABFA.8070804@ti.com>
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com> <1384962416-14862-3-git-send-email-ivan.khoronzhuk@ti.com> <20131120182102.GK14627@ns203013.ovh.net> <528D076A.8070806@ti.com> <C0B815B0-E394-494C-88A2-78A0DBFA23DA@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C0B815B0-E394-494C-88A2-78A0DBFA23DA-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kumar Gala,

On 11/22/2013 11:06 PM, Kumar Gala wrote:
>=20
> On Nov 20, 2013, at 1:03 PM, ivan.khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>=
 wrote:
>=20
>> On 11/20/2013 08:21 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>>>> +				the chip select signal.
>>>> +				Minimum value is 1 (0 treated as 1).
>>>> +
>>>> +- ti,cs-wsetup:		write setup width, ns
>>>> +				Time between the beginning of a memory cycle
>>>> +				and the activation of write strobe.
>>>> +				Minimum value is 1 (0 treated as 1).
>>>> +
>>>> +- ti,cs-wstrobe:	write strobe width, ns
>>>> +				Time between the activation and deactivation of
>>>> +				the write strobe.
>>>> +				Minimum value is 1 (0 treated as 1).
>>>> +
>>>> +- ti,cs-whold:		write hold width, ns
>>>> +				Time between the deactivation of the write
>>>> +				strobe and the end of the cycle (which may be
>>>> +				either an address change or the deactivation of
>>>> +				the chip select signal.
>>>> +				Minimum value is 1 (0 treated as 1).
>>>> +
>>>> +If any of the above parameters are absent, current parameter valu=
e will be taken
>>>> +from the corresponding HW reg.
>>>> +
>>>> +The name for cs node must be in format csN, where N is the cs num=
ber.
>>>
>>> this is wired we should use reg instead to represent the cs as done=
 for SPI
>>> or a an other property
>>>
>>> Best Regards,
>>> J.
>>>
>>
>> Ok, I will add new property cs-chipselect like following :
>>
>> ti,cs-chipselect:	number of chipselect. Indicates on the
>> 			aemif driver which chipselect is used
>> 			for accessing the memory.
>> 			For compatibles "ti,davinci-aemif" and
>> 			"ti,keystone-aemif" it can be in range [0-3].
>> 			For compatible "ti,omap-L138-aemif" range is [2-5].
>>
>> Is it OK?
>=20
> Why do you need this? As it was mentioned just use reg:
>=20
> So you=92d have something like:
>=20
> memory-controller@21000A00 {
> 	=85
> 	nand:cs2@2 {
> 		reg =3D <2 0 0>;
> 		ranges;
> 		...
>=20
> 	}:
> };

I'd prefer to continue with "ti,cs-chipselect" (this is more human frie=
ndly definition, as for me),
but if you insist - it can be changed as:
memory-controller@21000A00 {
	compatible =3D "ti,keystone-aemif";
=2E..

	cs2 {
		compatible =3D "ti,aemif-cs";
		reg =3D <2>;
=2E..
	}

	cs0 {
		compatible =3D "ti,aemif-cs";
		reg =3D <0>;
=2E..
	}

>=20
> However, I=92m confused by the example in which you have:
>=20
> +		nand@0,0x8000000 {
> +			compatible =3D "ti,davinci-nand";
> +			reg =3D <0 0x8000000 0x4000000
> +			       1 0x0000000 0x0000100>;
> +
> +			.. see davinci-nand.txt
> +		};
>=20
> What chipselects is this on 0 & 1?

As I described in https://lkml.org/lkml/2013/11/26/282 we are not encod=
ing CS number in reg
 - it's memory partition number.

Also, I'd like to note that we *DO NOT introduce* NAND device bindings =
here.
The Davinci NAND bindings was introduced and accepted more then one yea=
r ago, and
we've just updated its a bit (keeping full compatibility) and reused
(see https://lkml.org/lkml/2013/11/21/182).=20
And the CS number is encoded for Davinci NAND node using standalone pro=
perty
"ti,davinci-chipselect" and we need to provide (2) two memory ranges to=
 it,
as result we can't encode CS number in "reg" for AEMIF child devices (N=
AND/NOR/etc),
as it will break bindings compatibility.

In this document, NAND node is used just as an example of child node.

Regards,
- grygorii

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
