From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 0/5] mmc: mxcmmc: add mpc512x support
Date: Tue, 2 Apr 2013 09:01:56 +0200
Message-ID: <20130402070156.GE1906@pengutronix.de>
References: <1364768585-5177-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1364768585-5177-1-git-send-email-agust@denx.de>
Sender: linux-mmc-owner@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: linux-mmc@vger.kernel.org, Chris Ball <cjb@laptop.org>, Markus Pargmann <mpa@pengutronix.de>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 01, 2013 at 12:23:00AM +0200, Anatolij Gustschin wrote:
> The SDHC controller on mpc512x is compatible with i.MX31 SDHC
> controller, the existing MMC host driver can be used on
> mpc512x with some modifications, the patch series extends
> the existing driver. It is based on the following v3 mxcmmc DT
> support patch:
> 
>    https://patchwork.kernel.org/patch/2368631
> 
> Changes in v2 series are mentioned in each patch

With the two comments I made fixed you can add my:

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
