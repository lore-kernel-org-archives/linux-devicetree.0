From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [RFC 0/7] Qualcomm SMEM, SMD, RPM and regulators
Date: Tue, 30 Sep 2014 08:49:52 -0500
Message-ID: <E6EEBBAE-C710-4280-824D-CC5D54CB2551@codeaurora.org>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <Bjorn.Andersson@sonymobile.com>
Cc: Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org


On Sep 29, 2014, at 7:34 PM, Bjorn Andersson <Bjorn.Andersson@sonymobil=
e.com> wrote:

> All Qualcomm platforms implements a shared heap among the processors =
in the
> SoC, used for sharing data with other parts of the system.
>=20
> One consumer of items from this heap is the "Shared Memory Driver", a=
 ring
> buffer based point-to-point communication mechanism used to send eith=
er stream
> or packet based data to remote processors.
>=20
> Starting with 8x74 this system is used to talk to the Resource Power =
Manager
> (RPM), a power efficient "coprocessor" with responsibility of aggrega=
te votes
> from the various systems in the SoC related to regulators, clocks and=
 bus
> frequencies.
>=20
> The PMIC regulators and root clocks in these platforms are only acces=
sible via
> the RPM, so to get access to these we need the full chain of smem, sm=
d, rpm and
> a regulator driver implemented. And that is exactly what this series =
provides.
>=20
>=20
> A key outstanding question is where in the tree we should put the
> implementation, for now I dropped them in drivers/soc/qcom but that's=
 only
> because I don't know where to put it otherwise. I have not found any =
equivalent
> of the SMEM driver, SMD resembles mailbox and rpmsg - but comments in=
 that
> patch on why it's neither.
>=20
> RPM is a mfd and regulator is a regulator :)

I still don=92t see why RPM support for either A-family or B-family sho=
uld exist in MFD vis drivers/soc/qcom.  What benefit is there in puttin=
g this in MFD?

I think both A and B-family support should be in drivers/soc/qcom for t=
he current time being until we determine there is some framework that m=
akes more sense in the future.  I almost see RPM more like a bus contro=
ller than anything else.  Something like an I2C bus controller that tha=
n has some set of devices off of that bus.

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
