From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND 1/5] mfd: arizona: Add registers for ADC
 microphone detection
Date: Fri, 11 Sep 2015 09:58:35 +0100
Message-ID: <20150911085835.GH3260@x1>
References: <1441787690-30148-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <55F28975.2070907@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55F28975.2070907@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Chanwoo Choi wrote:
> I make the temporary branch[1] and then apply patch1-patch4 without p=
atch5
> because of patch5 may need the ack message by DT maintainer. If Lee w=
ant to
> make the immutable branch and send the pull request, I'll make the im=
mutable
> branch based on Linux-4.3-rcX and send it to MFD maintainer (Lee Jone=
s).
> [1] branch name : extcon-next-v4.4-for-arizona
> - git.kernel.org/cgit/linux/kernel/git/chanwoo/extcon.git/log/?h=3Dex=
tcon-next-v4.4-for-arizona
>=20
> I need the your opinion.

I'm not sure we need two immutable branches.  I'm happy to create one.
All I need are Acks for the patches which touch extcon.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
