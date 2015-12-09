From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 4/9] ARM: dts: add dts files for hi3519-demb board
Date: Wed, 09 Dec 2015 16:31:25 +0100
Message-ID: <5533669.m0KDLq8XOc@wuerfel>
References: <1449110668-23647-1-git-send-email-xuejiancheng@huawei.com> <56652912.80308@huawei.com> <5666548B.90502@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5666548B.90502@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xuejiancheng <xuejiancheng@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, suwenping@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yanhaifeng@hisilicon.com, gaofei@hisilicon.com, ml.yang@hisilicon.com, yanghongwei@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Tuesday 08 December 2015 11:54:51 xuejiancheng wrote:
> On 2015/12/7 14:37, xuejiancheng wrote:
> > 
> > On 2015/12/4 18:49, Arnd Bergmann wrote:
> >> On Friday 04 December 2015 10:27:58 xuejiancheng wrote:
> >>>>
> >> Maybe split out the sysctrl binding from
> >> Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt, as it has
> >> you already have a couple of those, and it's not clear how they relate
> >> to one another.
> >>
> >> If we introduce a string for all hip04 compatible sysctrl devices, we should
> >> document that and use it consistently, so hi3519 becomes
> >>
> >>      compatible = "hisilicon,hi3519-sysctrl", "hisilicon,hip04-sysctrl", "hisilicon,sysctrl";
> >>
> >> but I'd clarify in the binding documentation that "hisilicon,sysctrl" should
> >> only be used for hip04 and hi3519 but not the others.
> >>
> >> As this seems to be a standard part, we can also think about making a
> >> high-level driver for in in drivers/soc rather than relying on the syscon
> >> driver which we tend to use more for one-off devices with random register
> >> layouts.
> >>
> >    Sorry. I didn't understand your meaning well and maybe I gave you a wrong description.
> > Please allow me to clarify it again.
> >    The "sysctrl" nodes here is just used for the "reboot" function. It is corresponding to
> > the driver "drivers/power/reset/hisi-reboot.c". The compatible string in the driver is
> > "hisilicon,sysctrl".
> >    The layout of this block is also different from the one in HiP04.
> 
> I'll use "syscon" as the compatible value for sysctrl node and "syscon-reboot" for a new reboot node.
> 
> 

This is not what I meant. You have to use "syscon" as the most generic
"compatible" value here, but should add a machine specific string
as a more specific one. "hisilicon,sysctrl" is not appropriate because
it does not identify the IP block uniquely, you can only use that
in combination with another more specific string.

That way, we have to option to create a high-level driver for the IP
block later if it turns out that we need some more generic functionality
that is provided by those registers.

	Arnd
