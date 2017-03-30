From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v5 6/9] coresight: add support for CPU debug module
Date: Thu, 30 Mar 2017 21:51:45 +0800
Message-ID: <20170330135145.GA26911@leoy-linaro>
References: <1490466197-29163-1-git-send-email-leo.yan@linaro.org>
 <1490466197-29163-7-git-send-email-leo.yan@linaro.org>
 <20170328165010.GA21937@linaro.org>
 <20170329015423.GA5035@leoy-linaro>
 <CAJ9a7VhQRuVOCJkjPc9RANGo=fgA8wjtB65dC5f19ZX22a5FHQ@mail.gmail.com>
 <20170330010343.GA31843@leoy-linaro>
 <a9078a4e-152e-01ae-8750-1396da2bc623@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a9078a4e-152e-01ae-8750-1396da2bc623@arm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Guodong Xu <guodong.xu@linaro.org>, John Stultz <john.stultz@linaro.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, Sudeep Holla <sudeep.holla>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 10:00:30AM +0100, Suzuki K Poulose wrote:

[...]

> Leo,
> 
> Also, it would be good to restore the PRCR register back to the original state
> after we read the registers (if we changed them). I am exploring ways to make
> use of this feature on demand (e.g, tie it to sysrq-t or sysrq-l) and not just
> at panic time. So it would be good to have the state restored to not affect the
> normal functioning even after dumping the registers.

Got it. Will take care for this.

Thanks,
Leo Yan

> PS: I have a small hack to hook this into a sysrq-x at runtime, but on a second thought
> it is better not to consume the key and rather tie it to something which already exist,
> as mentioned above.
> 
> Thanks
> Suzuki
