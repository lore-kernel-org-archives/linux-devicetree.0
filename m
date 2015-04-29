From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: imx: make the imx timer driver implementation
 independent of SoCs.
Date: Wed, 29 Apr 2015 17:26:14 +0300
Message-ID: <20150429142614.GE2258@tarshish>
References: <1430316881-4668-1-git-send-email-shenwei.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430316881-4668-1-git-send-email-shenwei.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shenwei Wang <shenwei.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shenwei Wang,

On Wed, Apr 29, 2015 at 09:14:41AM -0500, Shenwei Wang wrote:
> There are 4 versions of the timer hardware on Freescale MXC hardware.
> --Version 0: MX1/MXL
> --Version 1: MX21, MX27.
> --Version 2: MX25, MX31, MX35, MX37, MX51, MX6Q
> --Version 3: MX6DL, MX6SX
> 
> This patch has removed the SoC related codes, and implemented the driver
> directly upon the hardware timer IP version.
> 
> The new driver can be installed via device tree or the direct function
> call to mxc_timer_init in order to support imx legacy systems like MX21
> and MX27.
> 
> For the device tree implementation, the driver is compatible with the current
> bindings like "fsl,imx6q-gpt", but for future dts file, the string like
> "fsl,imx-gpt-v2" without SoC information is recommended.

That is not the usual convention for IP block versions.

Please Cc the devicetree list (added).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
