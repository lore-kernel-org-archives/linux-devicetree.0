Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:46239 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030942Ab3HIUoT (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 9 Aug 2013 16:44:19 -0400
Received: by mail-la0-f50.google.com with SMTP id fn20so2060402lab.37
        for <devicetree@vger.kernel.org>; Fri, 09 Aug 2013 13:44:17 -0700 (PDT)
Message-ID: <520554AA.4030503@cogentembedded.com>
Date: Sat, 10 Aug 2013 00:44:26 +0400
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] DT: Add documentation for spi-rt2880
References: <1376074288-29302-1-git-send-email-blogic@openwrt.org>
In-Reply-To: <1376074288-29302-1-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <devicetree@vger.kernel.org>

Hello.

On 08/09/2013 10:51 PM, John Crispin wrote:

> Describe the SPI master found on the MIPS based Ralink SoC.

> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> ---
>   .../devicetree/bindings/spi/spi-rt2880.txt         |   26 ++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/spi/spi-rt2880.txt

> diff --git a/Documentation/devicetree/bindings/spi/spi-rt2880.txt b/Documentation/devicetree/bindings/spi/spi-rt2880.txt
> new file mode 100644
> index 0000000..d946626
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-rt2880.txt
> @@ -0,0 +1,26 @@
> +Ralink SoC RT2880 and famile SPI master controller.
> +
> +Required properties:
> +- compatible : "ralink,rt2880-spi"
> +- reg : The register base for the controller.
> +- #address-cells : <1>, as required by generic SPI binding.
> +- #size-cells : <0>, also as required by generic SPI binding.
> +
> +Child nodes as per the generic SPI binding.
> +
> +Example:
> +
> +	spi@b00 {
> +		compatible = "ralink,rt2880-spi";
> +		reg = <0xb00 0x100>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		m25p80@0 {

    Don't call nodes with chip names. ePAPR [1] says: "the name of a node 
should be somewhat generic, reflecting the function of the device and not its
precise programming model". I suspect this is a flash device, ePAPR suggests 
using "flash" as a name in this case.

> +			compatible = "m25p80";
> +			reg = <0>;
> +			spi-max-frequency = <10000000>;
> +		};
> +	};
> +

WBR, Sergei

