From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: hi6220: add acpu clock
Date: Mon, 12 Jun 2017 09:29:07 +0800
Message-ID: <85a39ff8-5d69-ac21-ec9e-6d0bb224f023@linaro.org>
References: <1492478242-16146-1-git-send-email-zhangfei.gao@linaro.org>
 <20170420155717.mohnrg6lxpwkoytb@rob-hp-laptop>
 <0e1a391e-cec5-1e94-c491-1c816eca85c3@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0e1a391e-cec5-1e94-c491-1c816eca85c3-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Li Pengcheng <lipengcheng8-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Stephen


Would you mind taking this patch, it's better go through 4.12.


On 2017年05月17日 09:31, zhangfei wrote:
>
>
> On 2017年04月20日 23:57, Rob Herring wrote:
>> On Tue, Apr 18, 2017 at 09:17:21AM +0800, Zhangfei Gao wrote:
>>> Add acpu clock, including sft clock controlling hi6220 coresight module
>>>
>>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Li Pengcheng <lipengcheng8-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   .../devicetree/bindings/clock/hi6220-clock.txt     |  1 +
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Thanks Rob
>
> Btw, have tested on 4.12-rc1, the patches can be applied directly.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
