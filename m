From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v3] hwspinlock: qcom: Add support for Qualcomm HW Mutex block
Date: Wed, 3 Sep 2014 10:22:57 -0500
Message-ID: <5B5C3B14-0FC8-4B4B-AE33-69030B7863D8@codeaurora.org>
References: <1409688246-16530-1-git-send-email-bjorn.andersson@sonymobile.com> <2B6A9AA9-E69F-47DF-A1E7-5C95B4E6FA94@codeaurora.org> <20140903145508.GA16352@sonymobile.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140903145508.GA16352@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <Bjorn.Andersson@sonymobile.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, Suman Anna <s-anna@ti.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Eric Holmberg <eholmber@codeaurora.org>, "Cavin, Courtney" <Courtney.Cavin@sonymobile.com>
List-Id: devicetree@vger.kernel.org


On Sep 3, 2014, at 9:55 AM, Bjorn Andersson <Bjorn.Andersson@sonymobile=
=2Ecom> wrote:

> On Wed 03 Sep 05:49 PDT 2014, Kumar Gala wrote:
>=20
>>=20
>> On Sep 2, 2014, at 3:04 PM, Bjorn Andersson <Bjorn.Andersson@sonymob=
ile.com> wrote:
>>=20
>>> Changes since v2:
>>> - MODULE_DEVICE_TABLE
>>> - Changed prefix to qcom
>>> - Cleaned up includes
>>> - Rely on reg and num-locks to figure out stride, instead of of_mat=
ch data
>>=20
>> I know Jeff prefers this method of computing stride, but I=92m not a=
 fan as
>> there isn=92t a reason one could adjust qcom,num-locks in the dt for=
 some
>> reason and leave regs alone.
>>=20
>=20
> All the current platform it's 32 consecutive mutexes with either 4 or=
 128 byte
> stride, so encoding it as data either way works fine. The hardware yo=
u're
> trying to describe with your dt is the addresses that spans your mute=
x
> registers and how many there are. So from the HW/dts pov I don't see =
why you
> would like to do this.
>=20
> Then looking in the caf code, there is a limit of max 8 mutexes. So a=
pparently
> there is some sort of usecase, I just don't know what or if it's vali=
d from a
> dt pov.

I believe not all the mutexes are meant for the cores running linux.  H=
owever, I think we just expect linux to play nice and not touch anythin=
g it isn=92t using explicitly.

> Going to that future awesome SoCs where it's still called tcsr-mutex,=
 but with
> a stride of 4096 bytes makes me wonder; is that really a consecutive =
128kb with
> nothing else in-between that we can ioremap?

think 64-bit machines with more address space to burn and wanting to se=
parate resources to use MMUs for protection.

> I.e. can we really reuse this driver straight off for that SoC?

I dont see why not.

>>> diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlo=
ck.txt b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
>>> +- compatible:
>>> +	Usage: required
>>> +	Value type: <string>
>>> +	Definition: must be one of:
>>> +		    "qcom,sfpb-mutex",
>>> +		    "qcom,tcsr-mutex=94
>>=20
>> I dont get the purpose of having different compatible strings if the=
re is no
>> difference in the code between them.
>>=20
>=20
> The semantics are the same, but there are no mutex registers in the t=
csr block
> in e.g 8960, so the name is just missleading. I assume that's why you=
 didn't
> follow caf and used the compatible "sfpb" in the first place?

What do you expect the 8960 dt node to look like?  I=92m not 100% again=
st =91sfpb=92

I=92m feel like we we should use compat for stride, so we=92d end up wi=
th something like:

qcom,sfpb-mutex: stride 4 bytes, base: 0x01200604, reset: 0x01200600
qcom,tcsr-mutex: stride 128 bytes, base: 0xFD484000, reset: 0xFD485380
qcom,tcsr-4k-mutex: stride 4k bytes, base: 0x740000, reset: 0x767000

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
