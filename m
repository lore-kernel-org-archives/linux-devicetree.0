From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 01/11] dt: binding: add binding for ImgTec IR block
Date: Sun, 22 Dec 2013 13:48:43 +0100
Message-ID: <3633330.ixgGf52iFP@flatron>
References: <1386947579-26703-1-git-send-email-james.hogan@imgtec.com> <1386947579-26703-2-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386947579-26703-2-git-send-email-james.hogan@imgtec.com>
Sender: linux-doc-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi James,

On Friday 13 of December 2013 15:12:49 James Hogan wrote:
> Add device tree binding for ImgTec Consumer Infrared block.
> 
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>
> Cc: linux-media@vger.kernel.org
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: Rob Landley <rob@landley.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/media/img-ir.txt | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/img-ir.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/img-ir.txt b/Documentation/devicetree/bindings/media/img-ir.txt
> new file mode 100644
> index 000000000000..6f623b094ea6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/img-ir.txt
> @@ -0,0 +1,20 @@
> +* ImgTec Infrared (IR) decoder
> +
> +Required properties:
> +- compatible:		Should be "img,ir"

This compatible string isn't really very specific. Is there some IP
revision string that could be added, to account for possible design
changes that may require binding change?

> +- reg:			Physical base address of the controller and length of
> +			memory mapped region.
> +- interrupts:		The interrupt specifier to the cpu.
> +
> +Optional properties:
> +- clocks:		Clock specifier for base clock.
> +			Defaults to 32.768KHz if not specified.

To make the binding less fragile and allow interoperability with non-DT
platforms it may be better to provide also clock-names property (so you
can use clk_get(); that's a Linux implementation detail, though, but to
make our lives easier IMHO they should be sometimes considered too).

Best regards,
Tomasz

