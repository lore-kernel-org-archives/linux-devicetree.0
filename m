From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM64: ZynqMP: DT: Fix GIC's 'reg' property
Date: Wed, 16 Dec 2015 09:07:03 +0000
Message-ID: <567129B7.2070104@arm.com>
References: <1450110700-14152-1-git-send-email-soren.brinkmann@xilinx.com> <20151214164613.GH21356@leverpostej> <566EF5CC.4070000@arm.com> <20151215091450.GI3358@xsjsorenbubuntu> <56702B44.5080201@xilinx.com> <20151216090101.GW3358@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151216090101.GW3358@xsjsorenbubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alistair Francis <alistair.francis-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 16/12/15 09:01, S=C3=B6ren Brinkmann wrote:
> On Tue, 2015-12-15 at 04:01PM +0100, Michal Simek wrote:
>> Hi,
>>
>> On 15.12.2015 10:14, S=C3=B6ren Brinkmann wrote:
>>> On Mon, 2015-12-14 at 05:01PM +0000, Marc Zyngier wrote:
>>>> Mark,
>>>>
>>>> On 14/12/15 16:46, Mark Rutland wrote:
>>>>> On Mon, Dec 14, 2015 at 08:31:40AM -0800, Soren Brinkmann wrote:
>>>>>> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 6 +++---
>>>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64=
/boot/dts/xilinx/zynqmp.dtsi
>>>>>> index 857eda5c7217..b5d1facadf16 100644
>>>>>> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
>>>>>> @@ -80,10 +80,10 @@
>>>>>>  		gic: interrupt-controller@f9010000 {
>>>>>>  			compatible =3D "arm,gic-400", "arm,cortex-a15-gic";
>>>>>>  			#interrupt-cells =3D <3>;
>>>>>> -			reg =3D <0x0 0xf9010000 0x10000>,
>>>>>> -			      <0x0 0xf902f000 0x2000>,
>>>>>> +			reg =3D <0x0 0xf9010000 0x1000>,
>>>>>> +			      <0x0 0xf9020000 0x20000>,
>>>>>>  			      <0x0 0xf9040000 0x20000>,
>>>>>> -			      <0x0 0xf906f000 0x2000>;
>>>>>> +			      <0x0 0xf9060000 0x20000>;
>>>>>
>>>>> I'm confused. These sizes don't look right for GIC-400. Is this a=
 custom
>>>>> GIC?
>>>>
>>>> Probably an implementation that obey the SBSA requirement of alias=
ing
>>>> the first 4kB of the CPU interface on a 64kB page, and the second =
one on
>>>> the following 64kB page. See the APM system for an example of such=
 a
>>>> thing. I'm more concerned about the GICH region (3rd one), which h=
as no
>>>> reason to be bigger than 4kB.
>>>
>>> Xilinx didn't publish the memory map yet (at least I didn't see it =
in the
>>> public docs), so, let me give some excerpts:
>>>
>>> GICD:
>>> GICD_CTLR 	0xF9010000 	32 	rw 	0x00000000 	Distributor Control Regi=
ster
>>> ...
>>> GICD_CIDR3 	0xF9010FFC 	32 	ro 	0x000000B1 	Component ID3 Register
>>>
>>> GICC:
>>> GICC_CTLR 	0xF9020000 	32 	rw 	0x00000000 	CPU Interface Control Re=
gister
>>> ...
>>> GICC_DIR 	0xF9030000 	32 	wo 	x 	Deactivate Interrupt Register
>>>
>>> GICH:
>>> GICH_HCR 	0xF9040000 	32 	rw 	0x00000000 	Hypervisor Control Regist=
er
>>> ...
>>> GICH_LR3_Alias7 	0xF9050F0C 	32 	rw 	0x00000000 	List Register 3
>>>
>>> GICV:
>>> GICV_CTLR 	0xF9060000 	32 	rw 	0x00000000 	Virtual Machine Control =
Register
>>> ...
>>> GICV_DIR 	0xF9070000 	32 	wo 	x 	VM Deactivate Interrupt Register
>>>
>>>
>>> Regarding the GICH area, it looks like it starts at 0xF9040000 and =
the
>>> alias blocks to access the other processor interfaces start at
>>> 0xF9050000.
>>>
>>>>
>>>>> Did this ever work wit hteh old offsets and sizes?
>>>>
>>>> It probably dies when trying to use EOImode=3D=3D1.
>>>
>>> Without knowing what parts we really exercise, yes, the system come=
s up
>>> fine so far, but I recently found Linux boot hanging on QEMU and it
>>> seemed to be related to time not progressing (fast enough).
>>> I found a different DT using the values proposed here and that fixe=
d the
>>> hang for me.
>>
>> We have discussed this here before with Rob
>> https://lkml.org/lkml/2015/2/24/371
>>
>> Not sure if there is any fix. It is probably just broken QEMU not DT=
S
>> description in mainline.
>=20
> Do I understand this correctly?: The GIC IP has more configurable
> addresses than the DT binding/driver allow. Thus far people have work=
ed
> around this by specifying some funky address in DT relying on the IP
> aliasing some addresses?

No. The *platform* messes with the GIC addressing, resulting in funky
decoding that everybody else has to deal with.

	M.
--=20
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
