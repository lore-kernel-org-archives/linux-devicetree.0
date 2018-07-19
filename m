Return-Path: <SRS0=Hazi=KD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr20131.outbound.protection.outlook.com ([40.107.2.131]:18242
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730521AbeGSPtM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Jul 2018 11:49:12 -0400
Subject: Re: [PATCH V3 1/2] dt-bindings: mux: add adi,adgs1408
References: <20180719134320.23560-1-mircea.caprioru@analog.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <4b4fb70f-edb8-f7d3-a6f9-8adf31424030@axentia.se>
Date: Thu, 19 Jul 2018 17:05:28 +0200
MIME-Version: 1.0
In-Reply-To: <20180719134320.23560-1-mircea.caprioru@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mircea Caprioru <mircea.caprioru@analog.com>, robh+dt@kernel.org
Cc: davem@davemloft.net, mchehab+samsung@kernel.org, akpm@linux-foundation.org, rdunlap@infradead.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2018-07-19 15:43, Mircea Caprioru wrote:
> Adding documentation for adgs1408/1409 multiplexer. The bindings
> follow the standard SPI and mux bindings and do not require any
> additional custom properties.
> 
> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
> ---
> Changelog V2 -> V3
> - formated dt-bindings commit message
> - added property for general purpose outputs
> 
>  .../devicetree/bindings/mux/adi,adgs1408.txt  | 48 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mux/adi,adgs1408.txt
> 
> diff --git a/Documentation/devicetree/bindings/mux/adi,adgs1408.txt b/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
> new file mode 100644
> index 000000000000..0a7b67023ef0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
> @@ -0,0 +1,48 @@
> +Bindings for Analog Devices ADGS1408/1409 8:1/Dual 4:1 Mux
> +
> +Required properties:
> +- compatible : Should be one of
> +	* "adi,adgs1408"
> +	* "adi,adgs1409"
> +* Standard mux-controller bindings as described in mux-controller.txt
> +
> +Optional properties for ADGS1408/1409:
> +- gpio-controller : if present, #gpio-cells is required.
> +- #gpio-cells : should be <2>
> +			- First cell is the GPO line number, i.e. 0 or 1

ADGS1408 has four GPOs, and it's five for 1409. So, you should adjust
the "0 or 1" copy-paste from the adg792a origin (which has two GPOs).

Cheers,
Peter

> +			- Second cell is used to specify active high (0)
> +			or active low (1)
> +
> +Optional properties:
> +- idle-state : if present, array of states that the mux controllers will have
> +  when idle. The special state MUX_IDLE_AS_IS is the default and
> +  MUX_IDLE_DISCONNECT is also supported.
> +
> +States 0 through 7 correspond to signals S1 through S8 in the datasheet.
> +For ADGS1409 only states 0 to 3 are available.
> +
> +Example:
> +
> +	/*
> +	 * One mux controller.
> +	 * Mux state set to idle as is (no idle-state declared)
> +	 */
> +	&spi0 {
> +		mux: mux-controller@0 {
> +			compatible = "adi,adgs1408";
> +			reg = <0>;
> +			spi-max-frequency = <1000000>;
> +			#mux-control-cells = <0>;
> +		};
> +	}
> +
> +	adc-mux {
> +		compatible = "io-channel-mux";
> +		io-channels = <&adc 1>;
> +		io-channel-names = "parent";
> +		mux-controls = <&mux>;
> +
> +		channels = "out_a0", "out_a1", "test0", "test1",
> +			"out_b0", "out_b1", "testb0", "testb1";
> +
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 192d7f73fd01..55dfdbf835c1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -810,6 +810,12 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	drivers/media/i2c/ad9389b*
>  
> +ANALOG DEVICES INC ADGS1408 DRIVER
> +M:	Mircea Caprioru <mircea.caprioru@analog.com>
> +S:	Supported
> +F:	drivers/mux/adgs1408.c
> +F:	Documentation/devicetree/bindings/mux/adgs1408.txt
> +
>  ANALOG DEVICES INC ADV7180 DRIVER
>  M:	Lars-Peter Clausen <lars@metafoo.de>
>  L:	linux-media@vger.kernel.org
> 

