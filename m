From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/8] arm64: dts: db820c: add basic board support
Date: Tue, 28 Jun 2016 10:17:59 -0700
Message-ID: <20160628171759.GZ1521@codeaurora.org>
References: <1466452907-23290-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1466452907-23290-2-git-send-email-srinivas.kandagatla@linaro.org>
 <57687B08.9060900@codeaurora.org>
 <5769058D.9020008@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5769058D.9020008-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/21, Srinivas Kandagatla wrote:
> I agree, this should match up with the dtbTool. I have been manually
> patching up dtb to include the board-id, pmic id stuff.

Uh oh :/

> 
> I will fix it in next version,
> 
> Did not look at full details but, For some reason dtbTool does not
> support multiple compatible strings, do you think it makes sense to
> add this support in dtb tool to cope up with compatible strings
> like:
> 
> compatible = "qcom,apq8096-db820c", "qcom,apq8096-sbc";
> 

Hmm I suppose we can add support to look for the first compatible
that matches something that we can generate an id for? That would
allow us to have the LK compatible and then whatever is more
specific than that which the bootloader doesn't care about.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
