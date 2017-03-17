From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [v3 3/5] coresight: add support for debug module
Date: Sat, 18 Mar 2017 00:28:36 +0800
Message-ID: <20170317162836.GD2020@leoy-linaro>
References: <1488520809-31670-4-git-send-email-leo.yan@linaro.org>
 <011fdac0-59bf-b539-2de3-0b59a41bc922@arm.com>
 <20170309175915.GA964@leoy-linaro>
 <3f27efee-3b63-81fd-eb96-73fd7e6f5e92@arm.com>
 <20170313165600.GB32431@linaro.org>
 <516f8989-4dde-2686-d549-0761feb14d1b@arm.com>
 <CANLsYkzJsGvr4ZzNbTwcPu1Qki6=Szvu+bMjHZ_rza==DqFChw@mail.gmail.com>
 <20170317101328.GA19877@leoy-linaro>
 <20170317155007.GA20435@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170317155007.GA20435@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Guodong Xu <guodong.xu@linaro.org>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Leach <mike.leach@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 17, 2017 at 09:50:07AM -0600, Mathieu Poirier wrote:

[...]

> If we don't check for "nohlt" some platform may freeze, others may work.  If we
> mandate that "nohlt" be present on the kernel cmd line it works in all cases.
> As such mandating that "nohlt" be present is a better way to go.

Sure, so I will add below checking code in the probe function, please
let me know if you have alter better way to implement this:

+       if (IS_ENABLED(CONFIG_CPU_IDLE) &&
+                       !strstr(boot_command_line, "nohlt")) {
+               dev_err(dev, "May not be accessible in CPU power domain.\n");
+               return -EPERM;
+       }

Thanks,
Leo Yan
