From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] clk: hisilicon: Add clock driver for hi3660 SoC
Date: Tue, 10 Jan 2017 09:22:32 +0800
Message-ID: <83ecb313-2ad4-379b-6ae8-95d8b570a110@linaro.org>
References: <1482978805-6981-1-git-send-email-zhangfei.gao@linaro.org>
 <1482978805-6981-3-git-send-email-zhangfei.gao@linaro.org>
 <20170110002224.GH17126@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170110002224.GH17126-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2017年01月10日 08:22, Stephen Boyd wrote:
> On 12/29, Zhangfei Gao wrote:
>> Add clock drivers for hi3660 SoC, this driver controls the SoC
>> registers to supply different clocks to different IPs in the SoC.
>>
>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
> Applied to clk-hi3660 and merged into clk-next. I took the
> liberty of using a function pointer in probe though so we don't
> need the enum anymore.

Good idea. It is simplified a lot.
Have verified on hikey960.

Thanks Stephen for the help.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
