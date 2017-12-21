From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: Add label for GLINK bindings
Date: Thu, 21 Dec 2017 11:36:09 -0800
Message-ID: <d6ad476e-b68c-a1ed-9256-5997312a6024@codeaurora.org>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-2-git-send-email-clew@codeaurora.org>
 <20171220183000.rhxgyikfqzxmqkjo@rob-hp-laptop>
 <20171221013557.GE12655@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221013557.GE12655@minitux>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chris Lew <clew-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, aneela-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/20/2017 05:35 PM, Bjorn Andersson wrote:
> On Wed 20 Dec 10:30 PST 2017, Rob Herring wrote:
>
>> On Mon, Dec 18, 2017 at 02:02:09PM -0800, Chris Lew wrote:
>>> Add a label property to identify the edge this node represents.
>> Why does a user need to know this?
>>
> We have multiple remoteproc instances, each one having one or more
> associated SMD or GLINK links (this node), exposing logical
> communication channels. Some of these logical channels are exposed to
> user space and we need a way to distinguish them there.
>
> In the current implementation of SMD this value goes straight into an
> sysfs attribute that we can use when writing udev rules and for the DIAG
> implementation to pair up channels related to the same remoteproc. This
> adds the equivalent information for glink-backed channels.
>
>
> I'm therefor in favor of picking this patch.

Please add these details to the commit log. Just writing what the patch
is doing isn't very helpful.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
