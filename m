Return-Path: <SRS0=ehaR=J5=linaro.org=lee.jones@kernel.org>
Date: Fri, 13 Jul 2018 08:38:24 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/4] mfd: wm8994: Allow to configure Speaker Mode
 Pullup from dts
Message-ID: <20180713073824.GU4641@dell>
References: <20180709160631.GU18740@imbe.wolfsonmicro.main>
 <1531158406-18646-1-git-send-email-anthony@amarulasolutions.com>
 <1531158406-18646-2-git-send-email-anthony@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1531158406-18646-2-git-send-email-anthony@amarulasolutions.com>
To: Anthony Brandon <anthony@amarulasolutions.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com, alberto@amarulasolutions.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 09 Jul 2018, Anthony Brandon wrote:

> From: Alberto Panizzo <alberto@amarulasolutions.com>
> 
> Configuring Speaker Mode Pullup was already supported in pdata, but not
> in the dts.
> 
> Signed-off-by: Alberto Panizzo <alberto@amarulasolutions.com>
> Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
> ---
>  drivers/mfd/wm8994-core.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
