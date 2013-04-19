From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH -next] mmc: mxs-mmc: fix error return code in mxs_mmc_probe()
Date: Fri, 19 Apr 2013 14:07:32 +0200
Message-ID: <201304191407.33143.marex@denx.de>
References: <CAPgLHd8+rdPX-B8raEjF0ygrG1QC2OFkuTzXw1eeaWsO0dHmcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd8+rdPX-B8raEjF0ygrG1QC2OFkuTzXw1eeaWsO0dHmcg@mail.gmail.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: cjb@laptop.org, grant.likely@linaro.org, rob.herring@calxeda.com, shawn.guo@linaro.org, fabio.estevam@freescale.com, broonie@opensource.wolfsonmicro.com, yongjun_wei@trendmicro.com.cn, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Dear Wei Yongjun,

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Fix to return -ENODEV in the request dma error case instead
> of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Seems ok to me.

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
