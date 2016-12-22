From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: hi3660: Clock driver support for Hisilicon
 hi3660 SoC
Date: Thu, 22 Dec 2016 12:51:12 -0800
Message-ID: <20161222205112.GD8288@codeaurora.org>
References: <1481781493-6188-1-git-send-email-zhangfei.gao@linaro.org>
 <1481781493-6188-3-git-send-email-zhangfei.gao@linaro.org>
 <20161221232551.GB8288@codeaurora.org>
 <fc7bebd2-ad03-6479-d6e7-42f5d724216c@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fc7bebd2-ad03-6479-d6e7-42f5d724216c-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/22, zhangfei wrote:
> On 2016年12月22日 07:25, Stephen Boyd wrote:
> >On 12/15, Zhangfei Gao wrote:
> >>Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> >>+
> >>+	switch (type) {
> >>+	case HI3660_CRGCTRL:
> >>+		hi3660_clk_crgctrl_init(np);
> >>+		break;
> >>+	case HI3660_PCTRL:
> >>+		hi3660_clk_pctrl_init(np);
> >>+		break;
> >>+	case HI3660_PMUCTRL:
> >>+		hi3660_clk_pmuctrl_init(np);
> >>+		break;
> >>+	case HI3660_SCTRL:
> >>+		hi3660_clk_sctrl_init(np);
> >>+		break;
> >>+	case HI3660_IOMCU:
> >>+		hi3660_clk_iomcu_init(np);
> >>+		break;
> >This "multi-device" driver design is sort of odd. Why not have
> >different files and struct drivers for the different devices in
> >the system that are clock controllers? I don't really understand
> >why we're controlling the devices with one struct driver
> >instance. Is something shared between the devices?
> Do you mean put in different .c / drivers?

Yes.

> They have to be put in the same file, since the parent / child
> relate to each other.

We handle clk parent/child relationships through strings. So why
does that mean we need to put these in the same file with the
same struct driver?

> They are for the same chip, but some put in different region for
> privilege control.

Ok.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
