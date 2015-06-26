From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] MIPS: BMIPS: bcm7346: add nodes for NAND
Date: Fri, 26 Jun 2015 09:32:37 -0700
Message-ID: <558D7EA5.9030202@gmail.com>
References: <cover.1435124524.git.jaedon.shin@gmail.com> <1544bf6110b43fbaa8dbb3b06a18e08ae87b386d.1435124524.git.jaedon.shin@gmail.com> <558B05B7.8010401@gmail.com> <EFAFA0BE-CC2F-4342-9C89-DED8EC6CF377@gmail.com> <558CC050.6040101@gmail.com> <D85A0C84-46BA-4F77-9A90-DE21EBED1887@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D85A0C84-46BA-4F77-9A90-DE21EBED1887-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/06/15 06:54, Jaedon Shin wrote:
>=20
>> On Jun 26, 2015, at 12:00 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>>
>> Le 06/25/15 01:52, Jaedon Shin a =C3=A9crit :
>>>
>>>> On Jun 25, 2015, at 4:32 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8@public.gmane.org=
m> wrote:
>>>>
>>>> +Brian,
>>>>
>>>> On 23/06/15 23:08, Jaedon Shin wrote:
>>>>> Add NAND device nodes to BMIPS based BCM7346 platform.
>>>>>
>>>>> Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>> ---
>>>>
>>>> [snip]
>>>>
>>>>> +
>>>>> +&nand0 {
>>>>> +	status =3D "okay";
>>>>> +
>>>>> +	nandcs@1 {
>>>>> +		compatible =3D "brcm,nandcs";
>>>>> +		reg =3D <1>;
>>>>> +		nand-ecc-step-size =3D <512>;
>>>>> +		nand-ecc-strength =3D <8>;
>>>>> +		nand-on-flash-bbt;
>>>>> +
>>>>> +		#size-cells =3D <2>;
>>>>> +		#address-cells =3D <2>;
>>>>> +
>>>>> +		flash1.rootfs0@0 {
>>>>> +			reg =3D <0x0 0x0 0x0 0x80000000>;
>>>>> +		};
>>>>> +
>>>>> +		flash1.rootfs1@80000000 {
>>>>> +			reg =3D <0x0 0x80000000 0x0 0x80000000>;
>>>>> +		};
>>>>> +	};
>>>>> +};
>>>>
>>>> Should we create something like brcmnand-cs1-512-8 to reduce the a=
mount
>>>> of duplication between DTS files?
>>>> --=20
>>>> Florian
>>>
>>> I Think that is not duplication.
>>>
>>> I have no reference boards, but this node is maybe explaining for h=
ardware
>>> description of the BCM97346DBSMB reference board. The nodes are cha=
nged by
>>> EBI CS and ECC capabilities of NAND flash. I used brcmnand-cs2-512-=
4 and
>>> brcmnand-cs1-512-4 for others.
>>
>=20
> The *others* means BCM7346 based set-top box of manufacturer. they ar=
e not
> bcm973XX{dbsmb,svmb} boards.

Understood.

>=20
>> Then I am confused, your 4 patches add identical NAND flash chip
>> properties for 7346, 7358, 7360 and 7362: CS#1, 512 bytes of ECC ste=
p
>> size and 8 bits of ECC strength, am I missing something?
>> --=20
>> Florian
>=20
> The mips based reference boards have postfix of DBSMB, SVMB, SFF and =
others.
> they have different properties of DDR, #CS, SPI-NOR, NOR, NAND. if we=
 write
> the DT of bcm97346sff.dts, therefore it has different fields.
>=20
> Then I expected that mips 40nm based SVMB type reference boards have =
the same
> properties. but, I don't have confidence. AISE I have no reference bo=
ards
> unfortunately. if you can contact with people who have reference boar=
d, would
> tell me information of #CS and NAND.

I agree with you that outside of reference boards, these flash settings
will vary, however, Broadcom reference boards tend to follow the same
design from one chip/board to another, so instead of replicating 4 time=
s
the same DT snippet in Device Tree, we could come up with differerent
sets of include files which abstract commonly found NAND flash types an=
d
properties. Code might talk better, so I will try to submit something
that illustrates what I have in mind.

Thanks!
--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
