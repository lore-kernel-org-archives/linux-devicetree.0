Return-Path: <SRS0=U7QJ=SF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbfDCJX3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 3 Apr 2019 05:23:29 -0400
Date: Wed, 3 Apr 2019 16:23:23 +0700
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/2] Documentation: DT: Add entry for DPAA2 console
Message-ID: <20190403092322.GC7932@X250>
References: <1553628194-25119-1-git-send-email-ioana.ciornei@nxp.com>
 <1553628194-25119-3-git-send-email-ioana.ciornei@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1553628194-25119-3-git-send-email-ioana.ciornei@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 26, 2019 at 07:23:31PM +0000, Ioana Ciornei wrote:
> This patch adds a devicetree binding documentation for
> FSL's DPAA2 console.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt | 11 +++++++++++
>  MAINTAINERS                                                  |  1 +
>  2 files changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt b/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
> new file mode 100644
> index 000000000000..1442ba5d2d98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
> @@ -0,0 +1,11 @@
> +DPAA2 console support
> +
> +Required properties:
> +
> +    - compatible
> +        Value type: <string>
> +        Definition: Must be "fsl,dpaa2-console".
> +    - reg
> +        Value type: <prop-encoded-array>
> +        Definition: A standard property.  Specifies the region where the MCFBA
> +                    (MC firmware base address) register can be found.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 32d444476a90..aed85fc7c783 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6127,6 +6127,7 @@ M:	Li Yang <leoyang.li@nxp.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  L:	linux-arm-kernel@lists.infradead.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
>  F:	Documentation/devicetree/bindings/soc/fsl/
>  F:	drivers/soc/fsl/
>  F:	include/linux/fsl/

I think the MAINTAINERS change should be a separate patch to be handled
by Leo.

Shawn

> -- 
> 1.9.1
> 
