From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: EDAC: Add Amazon's Annapurna Labs L1
 EDAC
Date: Wed, 21 Aug 2019 14:17:04 -0500
Message-ID: <20190821191704.GA32425@bogus>
References: <20190805143911.12185-1-hhhawa@amazon.com>
 <20190805143911.12185-2-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190805143911.12185-2-hhhawa@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hanna Hawa <hhhawa@amazon.com>
Cc: mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, linus.walleij@linaro.org, Jonathan.Cameron@huawei.com, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 05, 2019 at 03:39:08PM +0100, Hanna Hawa wrote:
> Document Amazon's Annapurna Labs L1 EDAC SoC binding.
> 
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> ---
>  .../devicetree/bindings/edac/amazon,al-l1-edac.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-l1-edac.txt
> 
> diff --git a/Documentation/devicetree/bindings/edac/amazon,al-l1-edac.txt b/Documentation/devicetree/bindings/edac/amazon,al-l1-edac.txt
> new file mode 100644
> index 000000000000..2ae8370216bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/amazon,al-l1-edac.txt
> @@ -0,0 +1,14 @@
> +* Amazon's Annapurna Labs L1 EDAC
> +
> +Amazon's Annapurna Labs SoCs supports L1 single bit correction and
> +two bits detection capability based on ARM implementation.
> +
> +Required properties:
> +- compatible:
> +	should be "amazon,al-l1-edac".

Why is this even in DT? AFAICT, this is all just CortexA57 core features 
(i.e. nothing Amazon specific). The core type and the ECC capabilities 
are discoverable.

Rob
