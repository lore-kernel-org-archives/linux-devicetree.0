From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/3] Documentation: DT: Add entry for DPAA2 console
Date: Tue, 22 Jan 2019 10:54:43 +0800
Message-ID: <20190122025441.GB19233@dragon>
References: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
 <1545406240-3061-3-git-send-email-ioana.ciornei@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1545406240-3061-3-git-send-email-ioana.ciornei@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 21, 2018 at 03:31:11PM +0000, Ioana Ciornei wrote:
> This patch adds a devicetree binding documentation for
> FSL's DPAA2 console.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  Documentation/devicetree/bindings/misc/dpaa2-console.txt | 11 +++++++++++
>  MAINTAINERS                                              |  1 +
>  2 files changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/dpaa2-console.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/dpaa2-console.txt b/Documentation/devicetree/bindings/misc/dpaa2-console.txt
> new file mode 100644
> index 0000000..f4e16b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/dpaa2-console.txt
> @@ -0,0 +1,11 @@
> +DPAA2 console support
> +
> +Required properties:
> +
> +    - compatible
> +        Value type: <string>
> +        Definition: Must be "dpaa2-console".

Why this doesn't need a vendor prefix?

Shawn

> +    - reg
> +        Value type: <prop-encoded-array>
> +        Definition: A standard property.  Specifies the region where the MCFBA
> +                    (MC firmware base address) register can be found.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7b76a80..229d4fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5969,6 +5969,7 @@ M:	Li Yang <leoyang.li@nxp.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  L:	linux-arm-kernel@lists.infradead.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/misc/dpaa2-console.txt
>  F:	Documentation/devicetree/bindings/soc/fsl/
>  F:	drivers/soc/fsl/
>  F:	include/linux/fsl/
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
