From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v4 2/4] arm64: dts: Add Qualcomm MSM8916 SoC and evaluation board dts
Date: Fri, 13 Mar 2015 11:43:28 -0500
Message-ID: <91E83B79-5004-48C5-948B-7A9FD7F13BFE@codeaurora.org>
References: <1426182985-10425-1-git-send-email-galak@codeaurora.org> <20150313105207.GB3592@leverpostej> <04AD8E46-277D-4652-88AF-D16538C2AA87@codeaurora.org> <20150313162516.GA9603@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150313162516.GA9603@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org


On Mar 13, 2015, at 11:25 AM, Mark Rutland <mark.rutland@arm.com> wrote=
:

> On Fri, Mar 13, 2015 at 03:50:42PM +0000, Kumar Gala wrote:
>>=20
>> On Mar 13, 2015, at 5:52 AM, Mark Rutland <mark.rutland@arm.com> wro=
te:
>>=20
>>>> +/ {
>>>> +	chosen {
>>>> +		stdout-path =3D &blsp1_uart2;
>>>> +	};
>>>=20
>>> It would be good if we had the configuration too (see
>>> Documentation/devicetree/bindings/chosen.txt), as that avoids any
>>> reliance on kernel defaults.
>>>=20
>>> You can refer to an alias, so this could be:
>>>=20
>>> aliases {
>>> 	serial0 =3D &blsp1_uart2;
>>> };
>>>=20
>>> chosen {
>>> 	stdout-path =3D "serial0:115200n8";
>>> };
>>>=20
>>> ...assuming that 115200n8 is correct for your UART, of course.
>>>=20
>>>=20
>>> [=85]
>>=20
>> Where is the code that actually handles this parsing?  I=92m not see=
 it
>> in early_init_dt_scan_chosen_serial and I don=92t believe
>> fdt_path_offset does anything special with =91:'
>=20
> Take a look at commit 7914a7c5651a5161 ("of: support passing console =
options with
> stdout-path").
>=20
> Early on of_alias_scan will find the options and in of_console_check
> we'll call add_preferred_console as appropriate. That'll be called in
> uart_add_one_port.

Ok, but earlycon dt code doesn=92t utilize this, as its setup is before=
 we unflatten the dt.

So it breaks earlycon parsing right now, I=92ll look at fixing that.

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
