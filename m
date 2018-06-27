Return-Path: <SRS0=yY7i=JN=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v8 03/14] staging: typec: tcpci: add compatible string for
 nxp ptn5110
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
 <1530056732-9640-4-git-send-email-jun.li@nxp.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <cc78bdfb-0716-9887-350f-7e0f4fe481b1@roeck-us.net>
Date: Tue, 26 Jun 2018 17:28:32 -0700
MIME-Version: 1.0
In-Reply-To: <1530056732-9640-4-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 06/26/2018 04:45 PM, Li Jun wrote:
> Add nxp ptn5110 typec controller compatible string: "nxp,ptn5110",
> which is a standard tcpci chip with power delivery support. Meanwhile
> remove "usb,tcpci" because it doesn't follow the binding format rule
> and has not been used yet.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/staging/typec/tcpci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 076d97e..dd29288 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -575,7 +575,7 @@ MODULE_DEVICE_TABLE(i2c, tcpci_id);
>   
>   #ifdef CONFIG_OF
>   static const struct of_device_id tcpci_of_match[] = {
> -	{ .compatible = "usb,tcpci", },
> +	{ .compatible = "nxp,ptn5110", },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, tcpci_of_match);
> 
