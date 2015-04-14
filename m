From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Tue, 14 Apr 2015 09:44:11 -0500
Message-ID: <97B1A2D4-6F6B-433B-83E6-9C8A95D1BFC6@codeaurora.org>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org> <20150410100529.GA6854@e104818-lin.cambridge.arm.com> <493B15F8-0EBE-4633-9604-671EF403F36E@codeaurora.org> <20150410161052.GF6854@e104818-lin.cambridge.arm.com> <FDC755A7-ACCF-4222-8730-782EEC632159@codeaurora.org> <20150413094117.GA2745@e104818-lin.cambridge.arm.com> <245B9FDD-E1B5-41E4-9F24-4D5BB86C450E@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <245B9FDD-E1B5-41E4-9F24-4D5BB86C450E@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, arm@kernel.org, Abhimanyu Kapur <abhimany@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


> On Apr 14, 2015, at 9:21 AM, Kumar Gala <galak@codeaurora.org> wrote:
>=20
>>>>=20
>>>> So please come up with proper technical arguments rather than the =
kernel
>>>> should take whatever SoC vendors dreamt of.
>>>=20
>>> There is no technical argument to be made.  This is about the
>>> community and you as maintainer wanting to accept code that complie=
s
>>> to your decision or not.
>>=20
>> If you are not willing to make technical arguments, I don't have to
>> provide any further reasons in this thread. It's your choice. In the
>> meantime, the short answer is NAK.

I assume you would than NAK someone trying to get support for their Nex=
us 9 Tablet using a Tegra K1.  It appears the shipping code for that de=
vice didn=E2=80=99t use PSCI (again guessing because it wasn=E2=80=99t =
available at the time).

https://android.googlesource.com/kernel/tegra/+/android-tegra-flounder-=
3.10-lollipop-release/arch/arm64/mach-tegra/platsmp.c

If so, I find this counter to the Linux kernel communities normal desir=
e to support the most hardware platforms.

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
