From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v6 2/2] mfd: atmel-flexcom: add a driver for Atmel Flexible
 Serial Communication Unit
Date: Thu, 23 Jul 2015 18:42:07 +0200
Message-ID: <55B1195F.4000104@atmel.com>
References: <cover.1437558598.git.cyrille.pitchen@atmel.com>	<7639e02fc2b16dc20b19fbe3bbbb986b0f3b9887.1437558598.git.cyrille.pitchen@atmel.com>	<20150723073217.GT3061@x1>	<20150723100101.7290242b@bbrezillon>	<20150723091311.GX3061@x1> <20150723145007.099d01c2@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150723145007.099d01c2@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Lee Jones <lee.jones@linaro.org>
Cc: nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,

Le 23/07/2015 14:50, Boris Brezillon a =E9crit :
> On Thu, 23 Jul 2015 10:13:11 +0100
> Lee Jones <lee.jones@linaro.org> wrote:
>=20
>> On Thu, 23 Jul 2015, Boris Brezillon wrote:
>>
>>> Hi Lee,
>>>
>>> On Thu, 23 Jul 2015 08:32:17 +0100
>>> Lee Jones <lee.jones@linaro.org> wrote:
>>>
>>>> On Wed, 22 Jul 2015, Cyrille Pitchen wrote:
>>>>> +	for_each_child_of_node(np, child) {
>>>>> +		const char *compatible;
>>>>> +		int cplen;
>>>>> +
>>>>> +		if (!of_device_is_available(child))
>>>>> +			continue;
>>>>> +
>>>>> +		compatible =3D of_get_property(child, "compatible", &cplen);
>>>>> +		if (!compatible || strlen(compatible) > cplen)
>>>>> +			continue;
>>>>> +
>>>>> +		if (strstr(compatible, "-usart")) {
>>>>> +			opmode =3D FLEX_MR_OPMODE_USART;
>>>>> +			break;
>>>>> +		}
>>>>> +
>>>>> +		if (strstr(compatible, "-spi")) {
>>>>> +			opmode =3D FLEX_MR_OPMODE_SPI;
>>>>> +			break;
>>>>> +		}
>>>>> +
>>>>> +		if (strstr(compatible, "-i2c")) {
>>>>> +			opmode =3D FLEX_MR_OPMODE_TWI;
>>>>> +			break;
>>>>> +		}
>>>>> +	}
>>>>
>>>> From what I understand Flexcom is a wrapper which can sit above an=
y
>>>> number of SPI, I2C and/or UART devices.  Devices which you don't
>>>> really have any control over (source code wise).  So wouldn't it b=
e
>>>> better to match on the details you do have control over i.e. the n=
ode
>>>> name, rather than the compatible string?
>>>>
>>>> I would personally match on of_find_node_by_name() to future-proof
>>>> your implementation.
>>>
>>> Actually, I think using compatible strings is more future-proof tha=
n
>>> using the node names, because nothing in the DT bindings doc enforc=
e the
>>> node name, and usually what we use to attach a node to a specific
>>> driver is the compatible string (this one is specified in the bindi=
ngs
>>> doc).
>>
>> I know what you're saying, but what if someone uses the Flexcom driv=
er
>> to wrap a different type of SPI driver where (for instance) the
>> compatible string used is "<name>-<newtype>".  Then we'd have to kee=
p
>> adding more lines here to accommodate.
>>
>> Whereas if we used the child node name which only pertains to _this_
>> driver, we would then have full control and know that (unless it
>> Flexcom is used for a completely different type of serial controller=
)
>> we wouldn't have to keep expanding the code to accommodate.
>=20
> You're right about the complexity implied by the compat string
> maintenance, but I still think using node names to detect the mode is
> a bad idea.
>=20
> Let's take another example making both solution unsuitable: what if
> the flexcom-v2 exposes 2 devices of the same type, they will both hav=
e
> the same name and the same compatible string, and we'll have no way t=
o
> detect the appropriate mode. That's why I think none of our suggestio=
n
> is future-proof.
>=20
>>
>>> Regarding the implementation itself, I would match the child node w=
ith
>>> an of_device_id table rather than trying to find a specific substri=
ng
>>> in the compatible string, but I think that's only a matter of taste=
=2E
>>
>> You mean duplicate each of the supported device's compatible strings
>> in this driver, then fetch the attributed of_match_device()->data
>> value?
>>
>=20
> Yes, and that's definitely not a good idea, but I think Cyrille has
> found a better approach (I'll let him explain).

Indeed, what about taking advantage of the "ranges" property?

=46or the Flexcom:
#address-cells =3D <2>;
#size-cells =3D <1>;
ranges =3D <1 0 0xf8034200 0x200    /* opmode 1: USART */
          2 0 0xf8034400 0x200    /* opmode 2: SPI */
          3 0 0xf8034600 0x200>;  /* opmode 3: I2C */

Then for the single available child (for instance the SPI controller):
reg =3D <2 0 0x200>;

So the Operating Mode to be set into the Flexcom Mode Register is read =
from
the very first u32 of the "reg" property of the child.

No need to introduce any new DT property and the mapping remains easy t=
o
maintain to follow hardware upgrades.

More details in v7 series.

>=20
> Best Regards,
>=20
> Boris
>=20

Best Regards,

Cyrille
