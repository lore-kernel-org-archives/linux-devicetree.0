Return-Path: <SRS0=h742=GR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:38354 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751249AbeC0U7U (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 27 Mar 2018 16:59:20 -0400
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add vendor prefix and docs for CR0014114
References: <20180326121506.9528-1-oleg@kaa.org.ua>
 <20180327164903.6307-1-oleg@kaa.org.ua>
Message-ID: <66fb58b2-2ae7-8edf-6c48-0f78f82c31a2@gmail.com>
Date: Tue, 27 Mar 2018 22:58:00 +0200
MIME-Version: 1.0
In-Reply-To: <20180327164903.6307-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Oleh,

Thanks for the update.

Patch version is missing in the subject e.g. [PATCH v5 1/2].

On 03/27/2018 06:49 PM, Oleh Kravchenko wrote:
> - add vendor prefix for Crane;
> - add documentation and example for dt-bindings CR0014114.
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../devicetree/bindings/leds/leds-cr0014114.txt    | 51 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> new file mode 100644
> index 000000000000..5f38f16aa08a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> @@ -0,0 +1,51 @@
> +Crane Merchandising System - cr0014114 LED driver
> +-------------------------------------------------
> +
> +This LED Board is widely used in vending machines produced
> +by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible: "crane,cr0014114"
> +
> +LED sub-node properties:
> +- label :
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger : (optional)
> +	see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example
> +-------
> +
> +led-controller@0 {
> +	compatible = "crane,cr0014114";
> +	reg = <0>;
> +	spi-max-frequency = <50000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	led@0 {
> +		reg = <0>;
> +		label = "cr0:red:coin";
> +	};
> +	led@1 {
> +		reg = <1>;
> +		label = "cr0:green:coin";
> +	};
> +	led@2 {
> +		reg = <2>;
> +		label = "cr0:blue:coin";
> +	};
> +	led@3 {
> +		reg = <3>;
> +		label = "cr1:red:bill";
> +	};
> +	led@4 {
> +		reg = <4>;
> +		label = "cr1:green:bill";
> +	};
> +	led@5 {
> +		reg = <5>;
> +		label = "cr1:blue:bill";
> +	};

Why cr0 and cr1? It should be cr0014114 to stick to the
current LED naming pattern <devicename:colour:function>.

Nonetheless, we lately came to the conclusion that devicename
segment is redundant in LED class device name, so until we change
LED naming convention officially, let's remove devicename segment
at least from DT and prepend the label with "cr0014114" in the driver.

Please compare how it is approached in [0] (not merged yet).

> +};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index ae850d6c0ad3..f17949c365f5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -75,6 +75,7 @@ cnxt	Conexant Systems, Inc.
>  compulab	CompuLab Ltd.
>  cortina	Cortina Systems, Inc.
>  cosmic	Cosmic Circuits
> +crane	Crane Connectivity Solutions
>  creative	Creative Technology Ltd
>  crystalfontz	Crystalfontz America, Inc.
>  cubietech	Cubietech, Ltd.
> 

[0] https://www.spinics.net/lists/devicetree/msg220561.html

-- 
Best regards,
Jacek Anaszewski


