Return-Path: <SRS0=f43A=H6=gmail.com=mats.dev.list@kernel.org>
Subject: Re: [PATCH v5 03/14] staging: typec: tcpci: add compatible string for
 nxp ptn5110
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-4-git-send-email-jun.li@nxp.com>
From: Mats Karrman <mats.dev.list@gmail.com>
Message-ID: <b5a8eb68-c4dc-ee6e-5e3c-f2a49577e4c0@gmail.com>
Date: Fri, 11 May 2018 21:51:36 +0200
MIME-Version: 1.0
In-Reply-To: <1525307094-27402-4-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Li Jun <jun.li@nxp.com>, robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: a.hajda@samsung.com, cw00.choi@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, gsomlo@gmail.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi Li Jun,

On 2018-05-03 02:24, Li Jun wrote:

> Add nxp ptn5110 typec controller compatible string: usb-tcpci,ptn5110,
> which is a standard tcpci chip with power delivery support.
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>   drivers/staging/typec/tcpci.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index 076d97e..741a80a 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -576,6 +576,7 @@ MODULE_DEVICE_TABLE(i2c, tcpci_id);
>   #ifdef CONFIG_OF
>   static const struct of_device_id tcpci_of_match[] = {
>   	{ .compatible = "usb,tcpci", },

Either this line should go away, or a "generic TCPCI controller" line should be
added to the DT documentation.

BR // Mats

> +	{ .compatible = "nxp,ptn5110", },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, tcpci_of_match);
>
