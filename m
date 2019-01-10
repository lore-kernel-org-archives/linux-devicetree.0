From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab documentation
Date: Thu, 10 Jan 2019 10:46:24 -0800
Message-ID: <20190110184624.GC9010@roeck-us.net>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
 <0527fcf7155ea12a2a1be680b3617691e6e26d72.1546918172.git.xiaoting.liu@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0527fcf7155ea12a2a1be680b3617691e6e26d72.1546918172.git.xiaoting.liu@hxt-semitech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shunyong.yang@hxt-semitech.com, dongsheng.wang@hxt-semitech.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 10:24:33AM +0800, Xiaoting Liu wrote:
> Bindings for Delta Electronics DPS-650-AB power supply.
> 
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>

Waiting for DT maintainer Ack to apply. Note that you did not copy
linux-hwmon@vger.kernel.org. As a result, it _may_ get lost since
https://patchwork.kernel.org/project/linux-hwmon/list/ is my primary
means to track hwmon patches, and it isn't there.
If I don't the patch after the Ack, please resend and remember
to include the hwmon mailing list.

Thanks,
Guenter

> ---
> v3:
>   Change patch commit message.
>   Add vendor delta to the compatible property.
> ---
> v2:
>   Change the patch subject.
> ---
>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> new file mode 100644
> index 000000000000..32d89e4f4956
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> @@ -0,0 +1,11 @@
> +Bindings for Delta Electronics DPS-650-AB power supply
> +
> +Required properties:
> +- compatible : "delta,dps650ab"
> +- reg        : I2C address, one of 0x58, 0x59.
> +
> +Example:
> +	dps650ab@58 {
> +		    compatible = "delta,dps650ab";
> +		    reg = <0x58>;
> +	};
> -- 
> 1.8.3.1
> 
