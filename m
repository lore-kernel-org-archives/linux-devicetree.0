From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [rtc-linux] [PATCH 2/6] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Mon, 11 Jan 2016 09:05:01 +0000
Message-ID: <20160111090501.GG14104@x1>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com>
 <1452177524-23192-3-git-send-email-ldewangan@nvidia.com>
 <CAJKOXPfa0jjRWE6LKvNmwCRcG9Es7=36_03kTqCx-aB1wENx0g@mail.gmail.com>
 <20160111054627.GB3331@x1>
 <56934AFD.5060008@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56934AFD.5060008@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: rtc-linux@googlegroups.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@nvidia.com, treding@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>, Chaitanya Bandi <bandik@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Mon, 11 Jan 2016, Krzysztof Kozlowski wrote:

> On 11.01.2016 14:46, Lee Jones wrote:
> > On Fri, 08 Jan 2016, Krzysztof Kozlowski wrote:
> >=20
> > Thanks for taking the time to review.
> >=20
> >> ()2016-01-07 23:38 GMT+09:00 Laxman Dewangan <ldewangan@nvidia.com=
>:
> >>> MAX77620/MAX20024 are Power Management IC from the MAXIM.
> >>> It supports RTC, multiple GPIOs, multiple DCDC and LDOs,
> >>> watchdog, clock etc.
> >>>
> >>> Add MFD drier to provides common support for accessing the
> >>> device; additional drivers is developed on respected subsystem
> >>> in order to use the functionality of the device.
> >>>
> >>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> >>> Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>
> >>> Signed-off-by: Mallikarjun Kasoju <mkasoju@nvidia.com>
> >>> Tested-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
> >>
> >> The Testing and Reviewed are statements (see SubmittingPatches) so
> >> they should be made explicitly by people. As this is v1 how they c=
ould
> >> make a public statement so far?
> >=20
> > SubmittingPatches bears no mention that Reviewed-by/Tested-by
> > statements have to be provided on one of the public mailing lists.
> > These can be provided privately prior to upstream submission v1.
>=20
> Indeed the document does not mention that they have to be provided by
> public.
>=20
> In the same time these are statements given by a reviewer ("By offeri=
ng
> my Reviewed-by: tag, I state that:")... and how can you validate a
> statement given through a private channel? Is it true? Is it a thorou=
gh
> testing or just copy-paste from Gerrit (or other automated system)?

That is for the submitter's conscience to decide.  If the statements
are supplied, we must assume they were provided in good faith and in
accordance with the rules set out by the Linux Kernel.  We can not ask
for every Tested-by/Acked-by/Reviewed-by/etc provider to verify on
each upstream submission.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
