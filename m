From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/6] ARM: DTS: da850: Use the new DT bindings for the
 eDMA3
Date: Tue, 15 Dec 2015 13:44:28 +0200
Message-ID: <566FFD1C.4080000@ti.com>
References: <1449237210-16381-1-git-send-email-peter.ujfalusi@ti.com>
 <1449237210-16381-3-git-send-email-peter.ujfalusi@ti.com>
 <566FDF93.7050005@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <566FDF93.7050005@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@deeprootsystems.com
List-Id: devicetree@vger.kernel.org

On 12/15/2015 11:38 AM, Sekhar Nori wrote:
> Hi Peter,
>=20
> On Friday 04 December 2015 07:23 PM, Peter Ujfalusi wrote:
>> Switch to use the ti,edma3-tpcc and ti,edma3-tptc binding for the eD=
MA3.
>> With the new bindings boards can customize and tweak the DMA channel
>> priority to match their needs. With the new binding the memcpy is sa=
fe
>> to be used since with the old binding it was not possible for a driv=
er
>> to know which channel is allowed to be used as non HW triggered chan=
nel.
>> Using the new binding will allow us to reserve PaRAM slots to be use=
d by
>> the DSP which was not possible before and prevented the da850 boards=
 to be
>> moved to DT only.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> ---
>>  arch/arm/boot/dts/da850-enbw-cmc.dts |  5 +++++
>>  arch/arm/boot/dts/da850-evm.dts      |  5 +++++
>>  arch/arm/boot/dts/da850.dtsi         | 27 ++++++++++++++++++++++---=
--
>>  3 files changed, 32 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/da850-enbw-cmc.dts b/arch/arm/boot/dt=
s/da850-enbw-cmc.dts
>> index e750ab9086d5..ca9117624cf9 100644
>> --- a/arch/arm/boot/dts/da850-enbw-cmc.dts
>> +++ b/arch/arm/boot/dts/da850-enbw-cmc.dts
>> @@ -28,3 +28,8 @@
>>  		};
>>  	};
>>  };
>> +
>> +&edma0 {
>> +	ti,edma-reserved-slot-ranges =3D /bits/ 16 <32 50>;
>> +	ti,edma-memcpy-channels =3D /bits/ 16 <20 21>;
>> +};
>> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da8=
50-evm.dts
>> index d807285a61cd..33467feb272a 100644
>> --- a/arch/arm/boot/dts/da850-evm.dts
>> +++ b/arch/arm/boot/dts/da850-evm.dts
>> @@ -243,3 +243,8 @@
>>  	tx-num-evt =3D <32>;
>>  	rx-num-evt =3D <32>;
>>  };
>> +
>> +&edma0 {
>> +	ti,edma-reserved-slot-ranges =3D /bits/ 16 <32 50>;
>> +	ti,edma-memcpy-channels =3D /bits/ 16 <20 21>;
>=20
> These correspond to PRU events. It is true that most likely they will
> never be used for peripheral DMA and can be dedicated as memcpy
> channels. However, since this is being encoded in DT, we need to be s=
ure
> that they will never be used for peripheral DMA on this board.
>=20
> So, I would prefer if you do not reserve any channels for memcpy unti=
l
> there is a real need/usecase for them. I know the board file has thes=
e
> reserved but board file could be updated as you liked. With DT we nee=
d
> to maintain backward compatibility. So I would rather do it when ther=
e
> is an actual need for it.

If we do not reserve channels for memcpy then you will have no support =
for
memcpy on these boards. Not sure if we use memcpy in any of our drivers=
 in
daVinci, so it might be just fine to not have DMA memcpy support at all=
=2E
But how about using edma1's reserved channels as memcpy (19-23, 30-31)?=
 I
don't know which channels the DSP would use on these boards, so it is n=
ever
going to be safe from that point.

> In future, if/when we gain QDMA support, the QDMA channels could be u=
sed
> for memcopy.

Well, in short there is no way to get the qDMA working in a different w=
ay
either. qDMA channel is in essence using 'normal' eDMA channel. This me=
ans
that we still need to reserve the eDMA channel to be used for memcpy, b=
ut
instead of SW triggering it (as we do it right now), we would need to u=
se the
channel as qDMA and set things up accordingly. I don't really see the b=
enefit
for qDMA mode to be honest.
>=20
>> +};
>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.=
dtsi
>> index e73f5efb3aa3..9e46eb51a8da 100644
>> --- a/arch/arm/boot/dts/da850.dtsi
>> +++ b/arch/arm/boot/dts/da850.dtsi
>> @@ -151,11 +151,28 @@
>> =20
>>  		};
>>  		edma0: edma@01c00000 {
>> -			compatible =3D "ti,edma3";
>> +			compatible =3D "ti,edma3-tpcc";
>>  			/* eDMA3 CC0: 0x01c0 0000 - 0x01c0 7fff */
>>  			reg =3D	<0x0 0x8000>;
>> -			interrupts =3D <11 13 12>;
>> -			#dma-cells =3D <1>;
>> +			reg-names =3D "edma3_cc";
>> +			interrupts =3D <11 12>;
>> +			interrupt-names =3D "edma3_ccint", "edma3_ccerrint";
>> +			#dma-cells =3D <2>;
>> +
>> +			ti,tptcs =3D <&edma0_tptc0 7>, <&edma0_tptc1 0>;
>> +			ti,edma-memcpy-channels =3D /bits/ 16 <20 21>;
>=20
> Same here. I would drop this.

OK, I'll drop this part.

>=20
> Thanks,
> Sekhar
>=20


--=20
P=E9ter
