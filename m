Return-Path: <robherring2@gmail.com>
Date: Fri, 11 Jan 2019 13:36:12 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Message-ID: <20190111193612.GA23166@bogus>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, mark.rutland@arm.com, openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, shunyong.yang@hxt-semitech.com, dongsheng.wang@hxt-semitech.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
> Bindings for DPS650AB power, voltage, temperature, and fan monitering.

s/monitering/monitoring/

> 
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> new file mode 100644
> index 000000000000..bbd601100e66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> @@ -0,0 +1,11 @@
> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
> +
> +Required properties:
> +- compatible : "dps650ab"

Needs a vendor prefix.

> +- reg        : I2C address, one of 0x58, 0x59.
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

We can't accept emails with these clauses.

Rob
