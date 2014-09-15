From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH resend 1/4] clk: hix5hd2: add complex clk
Date: Tue, 16 Sep 2014 03:51:02 +0800
Message-ID: <CABQgh9Hn6xUqKcCNAp3mi0cDWE8tgA2Y0MJwH8Vxyq+GhkxNxQ@mail.gmail.com>
References: <1409031970-4821-1-git-send-email-zhangfei.gao@linaro.org>
	<1409031970-4821-2-git-send-email-zhangfei.gao@linaro.org>
	<20140903173753.11368.10916@quantum>
	<CABHwWpQRj1YepkszoiiH0_vAp_-mS8qSwrEiLNkRoKvUUt7uxg@mail.gmail.com>
	<20140910165211.19023.39726@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140910165211.19023.39726@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?B?6Jab5bu65oiQ?= <jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haifeng Yan <haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Mike

Thanks for the comments.
Sorry for the delay, since the trip.

On 11 September 2014 00:52, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>     > +static int clk_ether_enable(struct clk_hw *hw)
>>     > +{
>>     > +       struct hix5hd2_clk_complex *clk = to_complex_clk(hw);
>>     > +       u32 val;
>>     > +
>>     > +       val = readl_relaxed(clk->ctrl_reg);
>>     > +       val |= clk->ctrl_clk_mask | clk->ctrl_rst_mask;
>>     > +       writel_relaxed(val, clk->ctrl_reg);
>>     > +       val &= ~(clk->ctrl_rst_mask);
>>     > +       writel_relaxed(val, clk->ctrl_reg);
>>     > +
>>     > +       val = readl_relaxed(clk->phy_reg);
>>     > +       val |= clk->phy_clk_mask;
>>     > +       val &= ~(clk->phy_rst_mask);
>>     > +       writel_relaxed(val, clk->phy_reg);
>>     > +       mdelay(10);
>>     > +
>>     > +       val &= ~(clk->phy_clk_mask);
>>     > +       val |= clk->phy_rst_mask;
>>     > +       writel_relaxed(val, clk->phy_reg);
>>     > +       mdelay(10);
>>     > +
>>     > +       val |= clk->phy_clk_mask;
>>     > +       val &= ~(clk->phy_rst_mask);
>>     > +       writel_relaxed(val, clk->phy_reg);
>>     > +       mdelay(30);
>>
>>     With all of these mdelays, I wonder if you should use .prepare and
>>     .unprepare instead? Does the Ethernet driver call clk_{en|dis}able from
>>     interrupt context?
>>
>>
>> Thank you for the advise.
>>
>> In hix5hd2 soc, these mdelays are necessary for resetting the Ethernet  phy
>> device. The hardware need some time to be stable.It's difficult to use .prepare
>> and .unprepare instead, because they are embeded in several places among the
>> whole sequence. Even though some code segment could be put into  the .prepare
>> callback, mdelays should still be reserved. So we hope to keep this manner if
>> it's ok.
>
> OK. I wonder if you should be using the reset controller framework to control the
> reset of your phy? Some clock drivers are also reset drivers since bits
> for controlling that stuff are often combined in the same register
> space. As an example, take a look at:
>
> drivers/clk/qcom/gcc-apq8084.c

Have considered the reset before, and decided simply to encapsulate to clock.
1, The reset and delay is rather a silicon limitation, and will be
optimized later, so only switch on / off are required later.
2, There is dependence, like first reset, then delay, then switch on,
it would be complicated to add this to the net driver itself.
3, Some driver use standard driver, like usb / mmc, which already have
clock interface inside, it would be easier to use them directly
without touching the driver itself.

>
>>
>> The Ethernet driver won't call clk_enable and clk_disable from interrupt
>> context.
>
> Good to know. clk_enable and clk_disable are designed to be called
> safely from interrupt context. clk_prepare and clk_unprepare often
> enable/disable a clock, but are designed for use in a regular process
> context (e.g. we might sleep or schedule). So depending on how long it
> takes you to enable/disable your Ethernet clock you might want to
> migrate to those callbacks instead.
>

Thanks for the info.
Could we directly move .clk_enable to .clk_preare, and move
.clk_disable to clk_unprepare.
Then the delay should not be a problem any more.
What the dirver using is clk_prepare_enable & clk_disable_unprepare,
which are called in open/close & probe.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
