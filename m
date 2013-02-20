From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of/i2c: don't register disabled devices
Date: Wed, 20 Feb 2013 13:09:05 -0600
Message-ID: <51251F51.2010003@gmail.com>
References: <1361384904-13853-1-git-send-email-dmitry_eremin@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1361384904-13853-1-git-send-email-dmitry_eremin@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Cc: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/20/2013 12:28 PM, Dmitry Eremin-Solenikov wrote:
> Don't register i2c slave device tree nodes which have
> status = "disabled" property.
> 

This is already in 3.8.

Rob

> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
> ---
>  drivers/of/of_i2c.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
> index 1e173f3..63f3236 100644
> --- a/drivers/of/of_i2c.c
> +++ b/drivers/of/of_i2c.c
> @@ -35,6 +35,9 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>  		const __be32 *addr;
>  		int len;
>  
> +		if (!of_device_is_available(node))
> +			continue;
> +
>  		dev_dbg(&adap->dev, "of_i2c: register %s\n", node->full_name);
>  
>  		if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {
> 
