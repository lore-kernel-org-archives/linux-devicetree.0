From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dt-bindings: hwmon: lm90: Document ti,tmp451 compatible
 string
Date: Sat, 1 Dec 2018 10:41:42 -0800
Message-ID: <20181201184142.GA12484@roeck-us.net>
References: <20181123120846.16999-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181123120846.16999-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 23, 2018 at 01:08:46PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The TI TMP451 temperature sensors are compatible with the National LM90
> temperature sensors.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/lm90.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt b/Documentation/devicetree/bindings/hwmon/lm90.txt
> index 97581266e329..c76a7ac47c34 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm90.txt
> +++ b/Documentation/devicetree/bindings/hwmon/lm90.txt
> @@ -23,6 +23,7 @@ Required node properties:
>  		"onnn,nct1008"
>  		"winbond,w83l771"
>  		"nxp,sa56004"
> +		"ti,tmp451"
>  
>  - reg: I2C bus address of the device
>  
