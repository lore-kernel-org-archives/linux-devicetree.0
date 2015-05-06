From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Wed, 6 May 2015 19:17:55 +0800
Message-ID: <20150506111755.GA5590@leoy-linaro>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
 <1430827599-11560-6-git-send-email-bintian.wang@huawei.com>
 <20150505171349.GA30215@leverpostej> <5549877C.10408@huawei.com>
 <20150506035120.GA20852@leoy-linaro>
 <20150506092056.GA31001@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20150506092056.GA31001@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, "btw@mail.itp.ac.cn" <btw@mail.itp.ac.cn>, Catalin Marinas <Catalin.Marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, Will Deacon <Will.Deacon@arm.com>, "huxinwei@huawei.com" <huxinwei@huawei.com>, "khilman@linaro.org" <khilman@linaro.org>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "yanhaifeng@gmail.com" <yanhaifeng@gmail.com>, "rob.herring@linaro.org" <rob.herring@linaro.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "khilman@kernel.org" <khilman@kernel.org>, "victor.lixin@hisilicon.com" <victor.lixin@hisilicon.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>, heyun
List-Id: devicetree@vger.kernel.org

hi Mark,

Thanks for detailed reviewing, pls see below inline comments.

On Wed, May 06, 2015 at 10:20:56AM +0100, Mark Rutland wrote:
> On Wed, May 06, 2015 at 04:51:20AM +0100, Leo Yan wrote:
> > On Wed, May 06, 2015 at 11:16:12AM +0800, Bintian Wang wrote:
> > > On 2015/5/6 1:13, Mark Rutland wrote:
> > > >[...]
> > > >
> > > >>+	psci {
> > > >>+		compatible = "arm,psci-0.2";
> > > >>+		method = "smc";
> > > >>+	};
> > > >
> > > >Are all the PSCI 0.2 mandatory features implemented?
> > >
> > > The system off/suspend is under development, and system off will
> > > be released in next months, and system suspend may be released in the
> > > following two months.
> > 
> > Yes; now for mandatory features, except SYSTEM_OFF others have supported.
> 
> Ok. Do you mean in the next month, or in a number of months?

We will finish it in May; the mainly work is to hook this API w/t PMIC
to power down system.

> > for PSCI 0.2, SYSTEM_SUSPEND even is not supported, right?
> 
> SYSTEM_SUSPEND was introduced in PSCI 1.0, and is optional.
> 
> So long as PSCI_VERSION reports 0.2 or PSCI_FEATURES reports
> NOT_SUPPORTED for SYSTEM_SUSPEND, it's ok to not implement.
> 
> I guess PSCI_VERSION reports PSCI 0.2?

This is depend on ARM trusted firmware's implementation, now we are
using ATFv1.1, so it will declare to support PSCI 1.0; pls see below
boot log:

psci: probing for conduit method from DT.
psci: PSCIv1.0 detected in firmware.
psci: Using standard PSCI v0.2 function IDs

> > > So can I keep "arm,psci-0.2" here?
> > > 
> > > >Can CPU0 be hot unplugged?
> > > Yes, CPU0~CPU7 all can be hot unplugged.
> > 
> > Just clarify: now use s/w method to emulate CPU and cluster's low
> > power state; all cores can be hotplugged [1].
> 
> So long as CPUs brought online are reset appropriately, and "offline"
> CPUs can't bring down the system somehow, that should be fine. For now
> the important part is the interface.

Thanks for confirmation.

Thanks,
Leo Yan
