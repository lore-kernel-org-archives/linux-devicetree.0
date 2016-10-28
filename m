From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: hi6220: add resets property into
 dwmmc nodes
Date: Fri, 28 Oct 2016 20:34:23 +0800
Message-ID: <20161028123422.GA22734@leoy-linaro>
References: <CALAqxLXfb48h8hMQmAaJ+YjA5=pekkQ8Dg8ReL6VTTfmuFRPDw@mail.gmail.com>
 <CAKfTPtAXdkKcfpHmUmQNwuJxO0PORcCf49noST_CCkZPigPwgw@mail.gmail.com>
 <CGME20161028072654epcas4p13cbf983b3e22dd96039ed33a4ac792d5@epcas4p1.samsung.com>
 <20161028072640.GB17266@leoy-linaro>
 <d7993c1a-5e50-9a33-0900-5c1a79884d3c@samsung.com>
 <20161028073830.GC17266@leoy-linaro>
 <24930ad4-313f-a4f0-c89a-770238863816@samsung.com>
 <95e22336-0465-f1e1-71b8-548d0e6ee8b7@samsung.com>
 <20161028101919.GA25564@leoy-linaro>
 <f5dfafbb-39df-4edb-03b8-57c0e34c912f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f5dfafbb-39df-4edb-03b8-57c0e34c912f@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, John Stultz <john.stultz@linaro.org>, Guodong Xu <guodong.xu@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <rob.herring@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, Fathi Boudra <fathi.boudra@linaro.org>, LAK <linux-arm-kernel@lists.infradead.org>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 28, 2016 at 08:52:49PM +0900, Jaehoon Chung wrote:

[...]

> >> Could you check the below thing..
> >>
> >>         /* find reset controller when exist */
> >> -       pdata->rstc = devm_reset_control_get_optional(dev, NULL);
> >> +       pdata->rstc = devm_reset_control_get_optional(dev, "dwmci-reset");
> >>         if (IS_ERR(pdata->rstc)) {
> >>                 if (PTR_ERR(pdata->rstc) == -EPROBE_DEFER)
> >>                         return ERR_PTR(-EPROBE_DEFER);
> > 
> > Confirmed with this fixing, the kernel can bootup successfully.
> > 
> > Thanks for this.
> 
> Thanks for checking this..If this approach is not bad, i will send the patch.
> Or if there are other good approaches, let me know, plz.

I'd like Guodong and John to confirm for Hikey specific. I have no
knowledge for this so cannot answer.

Thanks,
Leo Yan
