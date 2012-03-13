From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/1] of: add NULL parameter check for of_device_is_available
Date: Tue, 13 Mar 2012 07:46:15 -0500
Message-ID: <4F5F4197.4070605@gmail.com>
References: <1331638805-17136-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1331638805-17136-1-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On 03/13/2012 06:40 AM, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> This function will return 1 even the device node passed in
> is NULL which is a little error-prone.
> Change to return 0 if the device node passed in is NULL.
> 
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>

Applied.

Rob

> ---
>  drivers/of/base.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 133908a..b9347d8 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -280,6 +280,9 @@ int of_device_is_available(const struct device_node *device)
>  	const char *status;
>  	int statlen;
>  
> +	if (device == NULL)
> +		return 0;
> +
>  	status = of_get_property(device, "status", &statlen);
>  	if (status == NULL)
>  		return 1;
