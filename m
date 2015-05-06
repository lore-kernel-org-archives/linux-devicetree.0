From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Wed, 6 May 2015 11:51:20 +0800
Message-ID: <20150506035120.GA20852@leoy-linaro>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
 <1430827599-11560-6-git-send-email-bintian.wang@huawei.com>
 <20150505171349.GA30215@leverpostej> <5549877C.10408@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5549877C.10408@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bintian <bintian.wang@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "dan.zhao@hisilicon.com" <dan.zhao@hisilicon.com>, "btw@mail.itp.ac.cn" <btw@mail.itp.ac.cn>, Catalin Marinas <Catalin.Marinas@arm.com>, "wangbinghui@hisilicon.com" <wangbinghui@hisilicon.com>, Will Deacon <Will.Deacon@arm.com>, "huxinwei@huawei.com" <huxinwei@huawei.com>, "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>, "yanhaifeng@gmail.com" <yanhaifeng@gmail.com>, "rob.herring@linaro.org" <rob.herring@linaro.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "khilman@kernel.org" <khilman@kernel.org>, "victor.lixin@hisilicon.com" <victor.lixin@hisilicon.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, "sledge.yanwei@huawei.com" <sledge.yanwei@huawei.com>, "kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>, heyunlei@hu
List-Id: devicetree@vger.kernel.org

On Wed, May 06, 2015 at 11:16:12AM +0800, Bintian Wang wrote:
> On 2015/5/6 1:13, Mark Rutland wrote:
> >[...]
> >
> >>+	psci {
> >>+		compatible = "arm,psci-0.2";
> >>+		method = "smc";
> >>+	};
> >
> >Are all the PSCI 0.2 mandatory features implemented?
>
> The system off/suspend is under development, and system off will
> be released in next months, and system suspend may be released in the
> following two months.

Yes; now for mandatory features, except SYSTEM_OFF others have supported.
for PSCI 0.2, SYSTEM_SUSPEND even is not supported, right?

> So can I keep "arm,psci-0.2" here?
> 
> >Can CPU0 be hot unplugged?
> Yes, CPU0~CPU7 all can be hot unplugged.

Just clarify: now use s/w method to emulate CPU and cluster's low
power state; all cores can be hotplugged [1].

[1] https://github.com/96boards/arm-trusted-firmware;

Thanks,
Leo Yan
