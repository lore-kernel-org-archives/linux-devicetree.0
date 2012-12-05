From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH -next] serial: xilinx_uartps: fix return value check in xuartps_probe()
Date: Wed, 05 Dec 2012 23:57:49 +0000
Message-ID: <20121205235749.D084C3E0E22@localhost>
References: <CAPgLHd-upT_0ThHxU9rXtsw6CP4vU8zvOnLp6u0ZC_2unpDbTw@mail.gmail.com>
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd-upT_0ThHxU9rXtsw6CP4vU8zvOnLp6u0ZC_2unpDbTw@mail.gmail.com>
Sender: linux-serial-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>, alan@linux.intel.com, gregkh@linuxfoundation.org, jslaby@suse.cz, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-serial@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Sun, 2 Dec 2012 05:12:43 -0500, Wei Yongjun <weiyj.lk@gmail.com> wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> In case of error, function of_clk_get() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value
> check should be replaced with IS_ERR().
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
>  drivers/tty/serial/xilinx_uartps.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
> index 2be22a2..1eb4657 100644
> --- a/drivers/tty/serial/xilinx_uartps.c
> +++ b/drivers/tty/serial/xilinx_uartps.c
> @@ -948,9 +948,9 @@ static int xuartps_probe(struct platform_device *pdev)
>  	struct clk *clk;
>  
>  	clk = of_clk_get(pdev->dev.of_node, 0);
> -	if (!clk) {
> +	if (IS_ERR(clk)) {
>  		dev_err(&pdev->dev, "no clock specified\n");
> -		return -ENODEV;
> +		return PTR_ERR(clk);
>  	}
>  
>  	rc = clk_prepare_enable(clk);
> 
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
