From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 0/3] Qualcomm Resource Power Manager driver
Date: Wed, 28 May 2014 12:06:32 -0500
Message-ID: <8CA95B37-E5EE-46BE-ABFD-64AA3BBF4E96@codeaurora.org>
References: <1401211721-19712-1-git-send-email-bjorn.andersson@sonymobile.com> <F773CDFB-2957-49C0-99D3-E9CDCE33C378@codeaurora.org> <CAJAp7Ojb7PvuNYJkPyKx+iehi0bF6rdYvYmfrDz21mebxMN1qg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJAp7Ojb7PvuNYJkPyKx+iehi0bF6rdYvYmfrDz21mebxMN1qg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On May 28, 2014, at 11:59 AM, Bjorn Andersson <bjorn@kryo.se> wrote:

> On Wed, May 28, 2014 at 9:23 AM, Kumar Gala <galak@codeaurora.org> wr=
ote:
>>=20
>> On May 27, 2014, at 12:28 PM, Bjorn Andersson <bjorn.andersson@sonym=
obile.com> wrote:
>>=20
>>> This series adds a regulator driver for the Resource Power Manager =
found in
>>> Qualcomm 8660, 8960 and 8064 based devices.
>>>=20
>>> The RPM driver exposes resources to its child devices, that can be =
accessed to
>>> implement drivers for the regulators, clocks and bus frequency cont=
rol that's
>>> owned by the RPM in these devices.
>>=20
>> Rather than adding yet another mfd driver, how about we put this in =
drivers/soc/qcom as a much better location for the low level rpm code. =
 Some code already merged in arm-soc for creation of drivers/soc/qcom/
>=20
> Hi Kumar,
>=20
> I do see rpm as somewhat equivalent to a pmic and that was why I
> followed suite and put it in mfd, but I can of course move it if you
> prefer.
>=20
>=20
> Lately I've been working on rpm, rpm-smd, smem, smd, smsm, smp2p
> patches for mainline.
> It could be argued that smd is a bus and should go in drivers/bus, bu=
t
> for the rest I fear that we just created drivers/soc/qcom as another
> dumping ground for things; a "Qualcomm specific drivers/mfd".
>=20
> But maybe that is the purpose of it ;)

It is the purpose so that as we see common patterns between either driv=
ers/soc/<VENDOR> we can refactor in the future.  However, we need to al=
l a little time for those patterns to emerge rather than shoe horning i=
n drivers into places that don=92t make sense.

>=20
> If I move the rpm driver, are there any conclusion to where I should
> move the dt binding documentation?

devicetree/bindings/soc/qcom
include/dt-bindings/soc

>=20
> Regards,
> Bjorn

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
