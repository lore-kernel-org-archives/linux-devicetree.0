From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH v3] hwspinlock: qcom: Add support for Qualcomm HW Mutex
 block
Date: Wed, 3 Sep 2014 07:55:10 -0700
Message-ID: <20140903145508.GA16352@sonymobile.com>
References: <1409688246-16530-1-git-send-email-bjorn.andersson@sonymobile.com>
 <2B6A9AA9-E69F-47DF-A1E7-5C95B4E6FA94@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2B6A9AA9-E69F-47DF-A1E7-5C95B4E6FA94@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, Suman Anna <s-anna@ti.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Eric Holmberg <eholmber@codeaurora.org>, "Cavin, Courtney" <Courtney.Cavin@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On Wed 03 Sep 05:49 PDT 2014, Kumar Gala wrote:

>=20
> On Sep 2, 2014, at 3:04 PM, Bjorn Andersson <Bjorn.Andersson@sonymobi=
le.com> wrote:
>=20
> > Changes since v2:
> > - MODULE_DEVICE_TABLE
> > - Changed prefix to qcom
> > - Cleaned up includes
> > - Rely on reg and num-locks to figure out stride, instead of of_mat=
ch data
>=20
> I know Jeff prefers this method of computing stride, but I=92m not a =
fan as
> there isn=92t a reason one could adjust qcom,num-locks in the dt for =
some
> reason and leave regs alone.
>=20

All the current platform it's 32 consecutive mutexes with either 4 or 1=
28 byte
stride, so encoding it as data either way works fine. The hardware you'=
re
trying to describe with your dt is the addresses that spans your mutex
registers and how many there are. So from the HW/dts pov I don't see wh=
y you
would like to do this.

Then looking in the caf code, there is a limit of max 8 mutexes. So app=
arently
there is some sort of usecase, I just don't know what or if it's valid =
from a
dt pov.


Going to that future awesome SoCs where it's still called tcsr-mutex, b=
ut with
a stride of 4096 bytes makes me wonder; is that really a consecutive 12=
8kb with
nothing else in-between that we can ioremap?
I.e. can we really reuse this driver straight off for that SoC?

> > diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlo=
ck.txt b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
> > +- compatible:
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition: must be one of:
> > +		    "qcom,sfpb-mutex",
> > +		    "qcom,tcsr-mutex=94
>=20
> I dont get the purpose of having different compatible strings if ther=
e is no
> difference in the code between them.
>=20

The semantics are the same, but there are no mutex registers in the tcs=
r block
in e.g 8960, so the name is just missleading. I assume that's why you d=
idn't
follow caf and used the compatible "sfpb" in the first place?

Regards,
Bjorn
