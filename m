From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RESEND PATCH 0/3] ARM: dts: add device data for exynos4412-trats2
Date: Fri, 02 May 2014 14:29:00 +0900
Message-ID: <04ea01cf65c7$6bfd8db0$43f8a910$@samsung.com>
References: <53327CE3.8030800@samsung.com> <5359C2B9.5040003@samsung.com>
 <53631F16.7010708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <53631F16.7010708@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Beomho Seo' <beomho.seo@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>
Cc: 'Myungjoo Ham' <myungjoo.ham@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Jaehoon Chung' <jh80.chung@samsung.com>
List-Id: devicetree@vger.kernel.org

Beomho Seo wrote:
> 
> Hi all,
> 
> Didn't have Any other comment for this patch set?
> 
> On 04/25/2014 11:04 AM, Beomho Seo wrote:
> > This patchset add some device node for exynos4412-trats2.
> > It is based on v3.15-next/dt-samsung-2 branch.
> >
> > exynos4412-trats2.dts
> > - Fix incorrect compatible. Compatible of AK8975 are "ak8975" or "asahi-
> kasei,ak8975".
> > - Add cm36651 light/proximity sensor device node.
> > - Change gpio-key device node. fix incorrect gpio property, and then add
> "ok-key" node.
> >
> > Beomho Seo (3):
> >   ARM: dts: fix incorrect compatible for exynos4412
> >   ARM: dts: add cm36651 light/proximity sensor node
> >   ARM: dts: fixed gpio key node for exynos4412
> >
> >  arch/arm/boot/dts/exynos4412-trats2.dts |   50
> ++++++++++++++++++++++++++-----
> >  1 file changed, 43 insertions(+), 7 deletions(-)
> >
> 
I have no objection on this series but need to get ack from dt guys.

BTW, shouldn't it include vendor name in compatible?...

And according to dt bindings(iio/magnetometer/ak8975.txt), it should be:

"compatible = "asahi-kasei,ak8975";"

even though "ak8975" also included in the driver "drivers/iio/magnetometer/ak8975.c"...

Thanks,
Kukjin
