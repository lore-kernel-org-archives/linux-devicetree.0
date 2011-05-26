From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] powerpc: document the FSL MPIC message register
	binding
Date: Thu, 26 May 2011 15:03:51 -0500
Message-ID: <20110526150351.12af61a8@schlenkerla.am.freescale.net>
References: <1305909399-26969-1-git-send-email-meador_inge@mentor.com>
	<1305909399-26969-2-git-send-email-meador_inge@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1305909399-26969-2-git-send-email-meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: openmcapi-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 20 May 2011 11:36:38 -0500
Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:

> This binding documents how the message register blocks found in some FSL
> MPIC implementations shall be represented in a device tree.
> 
> Signed-off-by: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> Cc: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

Acked-by: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

> ---
>  .../devicetree/bindings/powerpc/fsl/mpic-msgr.txt  |   62 ++++++++++++++++++++
>  1 files changed, 62 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/mpic-msgr.txt
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/mpic-msgr.txt b/Documentation/devicetree/bindings/powerpc/fsl/mpic-msgr.txt
> new file mode 100644
> index 0000000..385dba6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/mpic-msgr.txt
> @@ -0,0 +1,62 @@
> +* FSL MPIC Message Registers
> +
> +This binding specifies what properties must be available in the device tree
> +representation of the message register groups found in some FSL MPIC
> +implementations.
> +
> +Required properties:
> +
> +    - compatible: Specifies the compatibility list for the message register
> +      block.  The type shall be <string> and the value shall be of the form
> +      "fsl,mpic-v<version>-msgr", where <version> is the version number of
> +      the MPIC containing the message registers.
> +
> +    - reg: Specifies the base physical address(s) and size(s) of the
> +      message register block's addressable register space.  The type shall be
> +      <prop-encoded-array>.
> +
> +    - interrupts: Specifies a list of interrupt source and level-sense pairs.
> +      The type shall be <prop-encoded-array>.  The length shall be equal to
> +      the number of bits set in the 'msg-receive-mask' property value.
> +
> +Optional properties:
> +
> +    - mpic-msgr-receive-mask: Specifies what registers in the containing block
> +      are allowed to receive interrupts.  The value is a bit mask where a set
> +      bit at bit 'n' indicates that message register 'n' can receive interrupts.
> +      The type shall be <prop-encoded-array>.  If not present, then all of
> +      the message registers in the block are available.
> +
> +Aliases:
> +
> +    An alias should be created for every message register block.  They are not
> +    required, though.  However, are particular implementation of this binding
> +    may require aliases to be present.  Aliases are of the form
> +    'mpic-msgr-block<n>', where <n> is an integer specifying the block's number.
> +    Numbers shall start at 0.
> +
> +Example:
> +
> +	aliases {
> +		mpic-msgr-block0 = &mpic_msgr_block0;
> +		mpic-msgr-block1 = &mpic_msgr_block1;
> +	};
> +
> +	mpic_msgr_block0: mpic-msgr-block@41400 {
> +		compatible = "fsl,mpic-v3.1-msgr";
> +		reg = <0x41400 0x200>;
> +		// Message registers 0 and 2 in this block can receive interrupts on
> +		// sources 0xb0 and 0xb2, respectively.
> +		interrupts = <0xb0 2 0xb2 2>;
> +		mpic-msgr-receive-mask = <0x5>;
> +	};
> +
> +	mpic_msgr_block1: mpic-msgr-block@42400 {
> +		compatible = "fsl,mpic-v3.1-msgr";
> +		reg = <0x42400 0x200>;
> +		// Message registers 0 and 2 in this block can receive interrupts on
> +		// sources 0xb4 and 0xb6, respectively.
> +		interrupts = <0xb4 2 0xb6 2>;
> +		mpic-msgr-receive-mask = <0x5>;
> +	};
> +
