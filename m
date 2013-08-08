Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:47892 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752006Ab3HHOnD convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 8 Aug 2013 10:43:03 -0400
Subject: Re: [PATCH 1/2] DT: Add documentation for gpio-falcon
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
From: Kumar Gala <galak@codeaurora.org>
In-Reply-To: <1375971555-24128-1-git-send-email-blogic@openwrt.org>
Date: Thu, 8 Aug 2013 09:43:01 -0500
Content-Transfer-Encoding: 8BIT
Message-Id: <3A609810-9F8E-4682-A1EC-D98FCEB41E55@codeaurora.org>
References: <1375971555-24128-1-git-send-email-blogic@openwrt.org>
Sender: devicetree-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On Aug 8, 2013, at 9:19 AM, John Crispin wrote:

> Describe gpio-falcon binding.

Would be good to have a little more description in the commit message about which SoC this is associated with.

> 
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: linux-mips@linux-mips.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> ---
> .../devicetree/bindings/gpio/gpio-falcon.txt       |   25 ++++++++++++++++++++
> 1 file changed, 25 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/gpio/gpio-falcon.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-falcon.txt b/Documentation/devicetree/bindings/gpio/gpio-falcon.txt
> new file mode 100644
> index 0000000..60bc6cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-falcon.txt
> @@ -0,0 +1,25 @@
> +Lantiq Falon SoC GPIO controller bindings
> +
> +Required properties:
> +- compatible:
> +  - "lantiq,falcon-gpio" for Falcon SoC controllers
> +- #gpio-cells : Should be two.
> +  - first cell is the pin number
> +  - second cell is used to specify optional parameters (unused)
> +- gpio-controller : Marks the device node as a GPIO controller
> +- reg : Physical base address and length of the controller's registers
> +- interrupt-parent: phandle to the IM device node that the irq is routed via
> +- interrupts : Specify the IM interrupt number
> +- lantiq,bank : The physical GPIO bank that this block is assiciated with

spelling w/assiciated

> +
> +Example:
> +
> +	gpio0: gpio@810000 {
> +		compatible = "lantiq,falcon-gpio";
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reg = <0x810000 0x80>;
> +		interrupt-parent = <&icu0>;
> +		interrupts = <44>;
> +		lantiq,bank = <0>;
> +	};

- k

> -- 
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

