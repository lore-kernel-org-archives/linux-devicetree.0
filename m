From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] mfd: add documentation for ACT8945A DT bindings
Date: Sat, 9 Jan 2016 09:38:05 -0600
Message-ID: <20160109153805.GA27000@rob-hp-laptop>
References: <1452218729-11357-1-git-send-email-wenyou.yang@atmel.com>
 <1452218729-11357-3-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452218729-11357-3-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 10:05:28AM +0800, Wenyou Yang wrote:
> The Active-semi ACT8945A PMIC is a Multi-Function Device, it has
> two subdevices:
>  - Regulator
>  - Charger
> 
> This patch adds documentation for ACT8945A DT bindings.
> 
> Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>

One nit, otherwise:

Acked-by: Rob Herring <robh@kernel.org>

> ---
> 
>  Documentation/devicetree/bindings/mfd/act8945a.txt |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/act8945a.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/act8945a.txt b/Documentation/devicetree/bindings/mfd/act8945a.txt
> new file mode 100644
> index 0000000..406db16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/act8945a.txt
> @@ -0,0 +1,16 @@
> +Device-Tree bindings for Active-semi ACT8945A MFD driver
> +
> +Required properties:
> + - compatible: "active-semi,act8945a".
> + - reg: the I2C slave address for the ACT8945A chip
> +
> +The chip exposes two subdevices:
> + - a regulators: see ../regulator/act8945a-regulator.txt
> + - a charger: see ../power/act8945a-charger.txt
> +
> +Example:
> +	mfd: act8945a@5b {

s/act8945a/pmic/

> +		compatible = "active-semi,act8945a";
> +		reg = <0x5b>;
> +		status = "okay";
> +	};
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
