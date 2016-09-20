From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] Documentation: dtb: lm87: Add hwmon binding
 documentation.
Date: Mon, 19 Sep 2016 22:14:51 -0700
Message-ID: <125e0069-38b5-1e4a-6c2f-9f4c8532e34a@roeck-us.net>
References: <20160920045538.9548-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <20160920045538.9548-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
To: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

On 09/19/2016 09:55 PM, Mahoda Ratnayaka wrote:
> This patch adds lm87 hwmon device tree node documentation.
>
> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>

It might make more sense to add this as trivial binding to
Documentation/devicetree/bindings/i2c/trivial-devices.txt.

Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documentation/devicetree/bindings/hwmon/lm87.txt
> new file mode 100644
> index 0000000..fefcb48
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lm87.txt
> @@ -0,0 +1,14 @@
> +*LM87 temprature sensor.
> +
s/temprature/temperature/

> +Required properties:
> +- compatible: Should be
> +	"ti,lm87"
> +
> +- reg: I2C address
> +
> +Example:
> +
> +lm87@2e {
> +	compatible = "ti,lm87";
> +	reg = <0x2e>;
> +};
>

