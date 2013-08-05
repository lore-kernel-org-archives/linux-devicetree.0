From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] Add device file bindings for MAPLE
Date: Mon, 5 Aug 2013 17:16:27 -0500
Message-ID: <1375740987.13074.65.camel@snotra.buserror.net>
References: <1375354963-11219-1-git-send-email-shaveta@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1375354963-11219-1-git-send-email-shaveta@freescale.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Shaveta Leekha <shaveta@freescale.com>
Cc: devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, 2013-08-01 at 16:32 +0530, Shaveta Leekha wrote:
> Signed-off-by: Shaveta Leekha <shaveta@freescale.com>
> ---
>  .../devicetree/bindings/powerpc/fsl/maple.txt      |   30 ++++++++++++++++++++
>  1 files changed, 30 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/maple.txt
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/maple.txt b/Documentation/devicetree/bindings/powerpc/fsl/maple.txt
> new file mode 100644
> index 0000000..da51c5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/maple.txt
> @@ -0,0 +1,30 @@
> +* Freescale MAPLE Multi Accelerator Platform Engine Baseband 3
> +  (MAPLE-B3)device nodes
> +
> +Supported chips:
> +Example: B4860
> +
> +Required properties:
> +
> +- compatible:	Should contain "fsl,maple-b3-liodn" as the value
> +		This identifies Multi Accelerator Platform Engine
> +		Baseband 3 block.This representation is required
> +		for doing the PAMU/LIODN programming on the Linux side.

Device tree bindings should not talk about particular OSes or use cases
(except for use case information that is part of the AMP partitioning,
and thus not at the discretion of the OS).  Just say that this
identifies the LIODN register of the block.

> +
> +- reg:		offset and length of the register set for the device
> +
> +Devices that have LIODNs need to specify links to the parent PAMU controller
> +(the actual PAMU controller that this device is connected to) and a pointer to
> +the LIODN register, if applicable.
> +
> +- fsl,iommu-parent
> +		: <phandle>
> +		This property should be present
> +
> +Example:
> +	/* B4860 */
> +	maple@800000 {
> +		compatible = "fsl,maple-b3-liodn";
> +		reg = <0x8000000 0x10000>;

Unit address doesn't match reg (missing/extra zero).

-Scott
