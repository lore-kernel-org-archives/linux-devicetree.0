Return-Path: <SRS0=5puu=VQ=outlook.com=leiwang_git@kernel.org>
From: Lei Wang <leiwang_git@outlook.com>
Subject: Re: [PATCH v4 2/2] EDAC: add EDAC driver for DMC520
Date: Fri, 19 Jul 2019 19:49:38 +0000
Message-ID: <BN6PR04MB1107476879762678425B9C9286CB0@BN6PR04MB1107.namprd04.prod.outlook.com>
References: <BN6PR04MB11075E9070EE1A263E099A7386E60@BN6PR04MB1107.namprd04.prod.outlook.com>
 <65439e51-5356-ae93-dffb-5a87279f6c8b@arm.com>
 <BN6PR04MB1107E018F29465B68EE708C786FA0@BN6PR04MB1107.namprd04.prod.outlook.com>
 <d82e6187-4a3d-1dc2-298a-0748ef0a7136@arm.com>
In-Reply-To: <d82e6187-4a3d-1dc2-298a-0748ef0a7136@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <DBE04A51BD3C904C85006309A320D9A0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: James Morse <james.morse@arm.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "bp@alien8.de" <bp@alien8.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, "ruizhao@microsoft.com" <ruizhao@microsoft.com>
List-ID: <devicetree@vger.kernel.org>

Hi James,

> Bingo: 'format_control' can be read in all states and has a 'memory_width=
' field that
> indicates if the PHY is connected to a 'x32 DDR device' or 'x64 DDR devic=
e'. (I'm guessing
> those double bit values are for address + data)
>=20
> This probably affects the 'grain' too.
>=20

Thanks a lot for this finding! I double-checked with brcm and yes this=20
can be used to decide the memory data width.


>>>> +static void dmc520_handle_dram_ecc_errors(struct mem_ctl_info *mci,
>>>> +					  bool is_ce)
>>>> +{
>>>> +	struct ecc_error_info info;
>>>> +	struct dmc520_edac *edac;
>>>> +	u32 cnt;
>>>> +	char message[EDAC_MSG_BUF_SIZE];
>>>> +	unsigned long flags;
>>>> +
>>>> +	edac =3D mci->pvt_info;
>>>> +	dmc520_get_dram_ecc_error_info(edac, is_ce, &info);
>>>> +
>>>> +	cnt =3D dmc520_get_dram_ecc_error_count(edac, is_ce);
>>>> +
>>>> +	if (cnt > 0) {
>>>> +		snprintf(message, ARRAY_SIZE(message),
>>>> +			 "rank:%d bank:%d row:%d col:%d",
>>>> +			 info.rank, info.bank,
>>>> +			 info.row, info.col);
>>>> +
>>>> +		spin_lock_irqsave(&edac->ecc_lock, flags);
>>> irqsave/irqrestore is overkill as this function is only called from an =
interrupt handler.
>>> There is no way for this to be called with interrupts unmasked.
>=20
>> Still feel spin_lock_irqsave and spin_unlock_irqstore are the safest. If
>> a processor is on isr for interrupt line 1 and calls
>> dmc520_handle_dram_ecc_errors, only line 1 is disabled and and other
>> lines can still interrupt calling dmc520_handle_dram_ecc_errors again.
>=20
> But not on the same CPU, (which is the problem the irqsave helpers solve)=
.
>=20
> When the CPU takes an interrupt the hardware sets a status bit to prevent=
 this CPU taking
> any other interrupt. On armv8, this is PSTATE.I, its set automatically by=
 the hardware. If
> CPUs didn't do this, you could never guarantee that any interrupt would e=
ver be handled.
>=20
> You are right a second interrupt may occur, but it can't interrupt this C=
PU until it
> returns from the Interrupt, or clears the status bit. If the second inter=
rupt is taken at
> the same time its because it was routed to a different CPU. A regular spi=
n_lock() stops
> any problems here, the second CPU has to wait for the first CPU to releas=
e the lock.
>=20
> spin_lock_irqsave() is for a more complicated problem. If you used the sp=
inlock in process
> context, (e.g. your probe function), as well as interrupt context, then i=
ts possible the
> interrupt is taken while the lock is held in process context on the same =
CPU. This causes
> your interrupt handler to wait forever for the lock. The irqsave helpers =
stop this by
> masking interrupts when taking the lock, so that this 'same CPU' sequence=
 can't happen.
>=20
> Because you don't take the lock in process context, you don't need the ir=
qsave variants.
>=20

Thanks! I overlooked the fact that aarch64's default behavior for=20
interrupt handling is that further interrupts are disabled on the same=20
CPU in interrupt context. Found the arm doc for it. :)=20
https://developer.arm.com/docs/100933/latest/interrupt-handling. With=20
this, yes I'll switch to normal spin_lock instead of irq version's=20
spin_lock API's.

Just for my education: if in a more general condition when the same CPU=20
supports embedded interrupts, are the spin_lock_irqsave and restore=20
always the recommended if used in an interrupt context?

>=20
> (N.B: your mail is still coming base64 encoded, so its very unlikely the =
maintainer can
> pick it up.)
>=20
Ah I found if without explicit "--transfer-encoding=3D7bit" when do "git=20
send-mail", my ubuntu box sent out base64 by default. I'll make sure to=20
explicitly setting 7bit sending new patches.


Thanks,
-Lei
