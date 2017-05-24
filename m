From: Jarkko Nikula <jarkko.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 05/12] arm64: dts: Add I2C nodes for Hi3660
Date: Wed, 24 May 2017 11:31:10 +0300
Message-ID: <a45b3ab7-4f77-be0a-6382-a94e43fd512e@linux.intel.com>
References: <20170517083745.24479-1-guodong.xu@linaro.org>
 <20170517083745.24479-6-guodong.xu@linaro.org>
 <20170523003908.ztuh4oohdk3g34pm@rob-hp-laptop>
 <94d06900-d871-7bc6-e1f3-d2b22ba20aaf@linaro.org>
 <CAL_JsqJUH-TOufw=dtpgDww_VEvyTW_LZuSQqRSU-cYbAqfJ6A@mail.gmail.com>
 <10a19a02-21ac-364e-ab5c-de8aa16c3858@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10a19a02-21ac-364e-ab5c-de8aa16c3858-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/24/2017 05:34 AM, zhangfei wrote:
> Rob suggest add something like "hisilicon,hi3660-dw-i2c" as well.
> "The problem is dw-i2c does not give any clue as to what the
> configuration or version of the IP is.
> Is that fully discoverable with version/capability registers? If not
> then you need a specific compatible.
> Generally when we have not required them, it ends up being a problem
> later on."
>
Some features are discoverable from DW_IC_COMP_PARAM_1, 
DW_IC_COMP_VERSION and DW_IC_COMP_TYPE registers. Although my 
specification does not document what's inside of DW_IC_COMP_VERSION and 
DW_IC_COMP_TYPE but code is using them.

>
> While Documentation/devicetree/bindings/i2c/i2c-designware.txt
> compatible : should be "snps,designware-i2c"
>
> Besides, on Hikey960,
> [    3.822353] dw_readl(dev, DW_IC_COMP_VERSION)=0x3132302a
> [    3.827763] dw_readl(dev, DW_IC_COMP_TYPE)=0x44570140
> Are these two registers enough to distinguish version etc?
>
I've seen DW_IC_COMP_VERSION being 0x3131352a or 0x3132312a in our 
platforms. DW_IC_COMP_TYPE has the same value what you are seeing.

-- 
Jarkko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
