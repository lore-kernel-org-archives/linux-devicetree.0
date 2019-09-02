From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] hwmon: (as370-hwmon) Add DT bindings for
 Synaptics AS370 PVT
Date: Mon, 2 Sep 2019 09:06:32 -0700
Message-ID: <20190902160632.GA16274@roeck-us.net>
References: <20190827113214.13773d45@xhacker.debian>
 <20190827113337.384457f6@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190827113337.384457f6@xhacker.debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 03:44:57AM +0000, Jisheng Zhang wrote:
> Add device tree bindings for Synaptics AS370 PVT sensors.
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/as370.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/as370.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/as370.txt b/Documentation/devicetree/bindings/hwmon/as370.txt
> new file mode 100644
> index 000000000000..d102fe765124
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/as370.txt
> @@ -0,0 +1,11 @@
> +Bindings for Synaptics AS370 PVT sensors
> +
> +Required properties:
> +- compatible : "syna,as370-hwmon"
> +- reg        : address and length of the register set.
> +
> +Example:
> +	hwmon@ea0810 {
> +		compatible = "syna,as370-hwmon";
> +		reg = <0xea0810 0xc>;
> +	};
