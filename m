From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] reset: Add brcm,bcm63xx-reset device tree binding
Date: Tue, 1 Dec 2015 14:16:10 +0300
Message-ID: <565D817A.2030607@cogentembedded.com>
References: <565CB83B.7010000@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <565CB83B.7010000@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, MIPS Mailing List <linux-mips@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org

Hello.

On 11/30/2015 11:57 PM, Simon Arlott wrote:

> Add device tree binding for the BCM63xx soft reset controller.
>
> The BCM63xx contains a soft-reset controller activated by setting
> a bit (that must previously have cleared).
>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>   .../bindings/reset/brcm,bcm63xx-reset.txt          | 37 ++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm63xx-reset.txt
>
> diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm63xx-reset.txt b/Documentation/devicetree/bindings/reset/brcm,bcm63xx-reset.txt
> new file mode 100644
> index 0000000..48e9daf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/brcm,bcm63xx-reset.txt
> @@ -0,0 +1,37 @@
> +BCM63xx reset controller
> +
> +The BCM63xx contains a basic soft reset controller in the perf register
> +set which resets components using a bit in a register.
> +
> +Please also refer to reset.txt in this directory for common reset
> +controller binding usage.
> +
> +Required properties:
> +- compatible:	Should be "brcm,bcm<soc>-reset", "brcm,bcm63xx-reset"

     Wildcards (xx) are not allowed here. Please choose a "least common 
denominator" SoC and name the string after it.

[...]

MBR, Sergei
