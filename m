Return-Path: <SRS0=3bjE=I5=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 11 Jun 2018 15:32:16 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 03/15] staging: typec: tcpci: add compatible string
 for nxp ptn5110
Message-ID: <20180611123216.GL17155@kuha.fi.intel.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-4-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527475967-15201-4-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 10:52:35AM +0800, Li Jun wrote:
> Add nxp ptn5110 typec controller compatible string: "nxp,ptn5110",
> which is a standard tcpci chip with power delivery support. Meanwhile
> remove "usb,tcpci" because it doesn't follow the binding format rule
> and has not been used yet.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/staging/typec/tcpci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 076d97e..dd29288 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -575,7 +575,7 @@ MODULE_DEVICE_TABLE(i2c, tcpci_id);
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id tcpci_of_match[] = {
> -	{ .compatible = "usb,tcpci", },
> +	{ .compatible = "nxp,ptn5110", },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, tcpci_of_match);

-- 
heikki
