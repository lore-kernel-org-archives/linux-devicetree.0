From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon: add dps650ab documentation
Date: Mon, 7 Jan 2019 05:58:07 -0800
Message-ID: <568735a3-1de2-3880-5fe1-7be38a55f33f@roeck-us.net>
References: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
 <0087d2d9c7cd7f38761f76c80d1c37cb2cea6ef2.1546851856.git.xiaoting.liu@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0087d2d9c7cd7f38761f76c80d1c37cb2cea6ef2.1546851856.git.xiaoting.liu@hxt-semitech.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>, jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, openbmc@lists.ozlabs.org
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, shunyong.yang@hxt-semitech.com, dongsheng.wang@hxt-semitech.com
List-Id: devicetree@vger.kernel.org

On 1/7/19 3:00 AM, Xiaoting Liu wrote:
> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
> 
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
> v2:
>    Change the patch subject.
> ---
>   Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> new file mode 100644
> index 000000000000..6bbbff89f6d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> @@ -0,0 +1,11 @@
> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
> +

Assuming this is the Delta Electronics DPS-650-AB power supply, I think
you should mention that here.

> +Required properties:
> +- compatible : "dps650ab"

Again, assuming this is the Delta Electronics power supply, this should
probably be something like "delta,dps650ab".

Thanks,
Guenter

> +- reg       : I2C address, one of 0x58, 0x59.
> +
> +Example:
> +       dps650ab@58 {
> +                   compatible = "dps650ab";
> +                   reg = <0x58>;
> +       };
> --
> 1.8.3.1
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> 
> 
> 
