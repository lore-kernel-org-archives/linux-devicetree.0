From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v1 4/4] ARM: debug: qcom: Add APQ8084 DEBUG_LL UART support
Date: Wed, 21 May 2014 14:14:29 -0500
Message-ID: <A9A4B705-E550-407D-BDAD-91083417B356@codeaurora.org>
References: <1400684225-21381-1-git-send-email-gdjakov@mm-sol.com> <1400684225-21381-5-git-send-email-gdjakov@mm-sol.com> <4365639.JcFl1cP048@wuerfel> <1400686086.856.15.camel@iivanov-dev>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1400686086.856.15.camel@iivanov-dev>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Georgi Djakov <gdjakov@mm-sol.com>, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, sboyd@codeaurora.org, rvaswani@codeaurora.org, davidb@codeaurora.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On May 21, 2014, at 10:28 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote=
:

> Hi,=20
>=20
> On Wed, 2014-05-21 at 17:18 +0200, Arnd Bergmann wrote:
>> On Wednesday 21 May 2014 17:57:05 Georgi Djakov wrote:
>=20
>>>=20
>>> +#ifdef CONFIG_DEBUG_APQ8084_UART
>>> +#define MSM_DEBUG_UART_BASE    0xFA75E000
>>> +#define MSM_DEBUG_UART_PHYS    0xF995E000
>>> +#endif
>>> +
>=20
>> Maybe we should move debug/msm.S over to use
>> CONFIG_DEBUG_UART_PHYS/CONFIG_DEBUG_UART_VIRT now?
>>=20
>=20
> There is patch which do this [1]. It was reviewed=20
> by Stephen Boyd [2].
>=20
> Regards,
> Ivan
>=20
>=20
> [1] https://lkml.org/lkml/2014/4/14/312
> [2] https://lkml.org/lkml/2014/4/14/542

I=92ll grab Ivan=92s patch and send via my qcom tree to arm-soc.

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
