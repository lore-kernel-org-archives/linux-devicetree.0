From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] rtc: sprd: Add Spreadtrum RTC driver
Date: Wed, 15 Nov 2017 17:01:36 +0100
Message-ID: <20171115160136.yopwad4hfcg5zfhr@piout.net>
References: <c65b61e5e37cb43214973cb3e479ce06c4a73395.1510198341.git.baolin.wang@spreadtrum.com>
 <1e1ee941cc59375627712c0e77036ff36389bb33.1510198341.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1e1ee941cc59375627712c0e77036ff36389bb33.1510198341.git.baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/11/2017 at 11:34:17 +0800, Baolin Wang wrote:
> This patch adds the Spreadtrum RTC driver, which embedded in the
> Spreadtrum SC27xx series PMICs.
> 
> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> ---
> Changes since v2:
>  - Add checking if RTC values are valid.
> 
> Changes since v1:
>  - Change file name.
>  - Should depend on the MFD parent.
>  - Add more help documentation.
>  - Remove regmap wrapper functions.
>  - Modify the mothod of setting alarm.
>  - Remove set_mmss64() method.
>  - Remove checking RTC power-down.
>  - Optimize lock/unlock alarm.
> ---
>  drivers/rtc/Kconfig      |   11 +
>  drivers/rtc/Makefile     |    1 +
>  drivers/rtc/rtc-sc27xx.c |  662 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 674 insertions(+)
>  create mode 100644 drivers/rtc/rtc-sc27xx.c
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
