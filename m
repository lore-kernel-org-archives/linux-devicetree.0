From: Noam Camus <noamca@mellanox.com>
Subject: RE: [PATCH v2 1/3] soc: Support for NPS HW scheduling
Date: Mon, 31 Oct 2016 12:26:56 +0000
Message-ID: <DB6PR0501MB2518D1746A4592686D45F253AAAE0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
References: <1477224748-25223-1-git-send-email-noamca@mellanox.com>
 <1477224748-25223-2-git-send-email-noamca@mellanox.com>
 <20161031102659.GA1506@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161031102659.GA1506@mai>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org]=20
> Sent: Monday, October 31, 2016 12:27 PM
>>=20
>> This new header file is for NPS400 SoC (part of ARC architecture).
>> The header file includes macros for save/restore of HW scheduling.
>> The control of HW scheduling is acheived by writing core registers.

>s/acheived/achieved/
Thanks will update in V4 of this patch set
...

>> +#ifndef SOC_NPS_MTM_H
>> +#define SOC_NPS_MTM_H
>> +
>> +#define CTOP_INST_HWSCHD_OFF_R3                 0x3B6F00BF
>> +#define CTOP_INST_HWSCHD_RESTORE_R3             0x3E6F70C3
>> +
>> +static inline void hw_schd_save(unsigned int *flags) {
>> +	__asm__ __volatile__(
>> +	"       .word %1\n"
>> +	"       st r3,[%0]\n"
>> +	:
>> +	: "r"(flags), "i"(CTOP_INST_HWSCHD_OFF_R3)
>> +	: "r3", "memory");
>> +}
>> +

>Wouldn't make sense to change the macro name to CTOP_INST_HWSCHD_SAVE_R3 ?
The save of state into register (R3) by this dedicated instruction is only =
part of action which main purpose
Is to turn off the HW scheduler within this core (we call CTOP).
We use it  (Off/On) at places we wish to keep consistency of data where mor=
e than one HW thread can access.
So I believe this way macro name reflects properly the functionality of thi=
s instruction and the API functions
schd_save()/schd_restore() provide similar format like with IRQs.

> +static inline void hw_schd_restore(unsigned int flags) {
> +	__asm__ __volatile__(
> +	"       mov r3, %0\n"
> +	"       .word %1\n"
> +	:
> +	: "r"(flags), "i"(CTOP_INST_HWSCHD_RESTORE_R3)
> +	: "r3");
> +}
> +
> +#endif /* SOC_NPS_MTM_H */
> --
> 1.7.1
>=20
