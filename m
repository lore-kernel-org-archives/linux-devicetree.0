From: srinivas kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 0/2] Fixes for STi SOCs
Date: Thu, 14 Nov 2013 10:36:39 +0000
Message-ID: <5284A7B7.4070406@st.com>
References: <1379410003-9911-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379410003-9911-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd/Olof,

I think, these patches some how missed 3.13 window.
Can you please consider these fixes at least for 3.13-rc1?

Without these patches we can not get the serial output with
multi_v7_defconfig on STi SOCs.


Thanks,
srini

On 17/09/13 10:26, Srinivas KANDAGATLA wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> 
> Hi Arnd/Olof, 
> 
> These two are very minor fixes for STi SOCs.
> One of the fix is a typo and other is to add two new options to
> multi_v7_defconfig to get STi SOC based boards boot with nfs root with serial
> console.
> 
> These patches are based on v3.12-rc1.
> 
> Thanks,
> srini
> 
> Srinivas Kandagatla (2):
>   ARM: STi: OF: Fix a typo in pincfg header
>   ARM: multi_v7_defconfig: Fix STi support
> 
>  arch/arm/boot/dts/st-pincfg.h       |    2 +-
>  arch/arm/configs/multi_v7_defconfig |    3 +++
>  2 files changed, 4 insertions(+), 1 deletions(-)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
