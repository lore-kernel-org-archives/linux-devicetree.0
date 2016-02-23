From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/7] QE: Add IC, SI and SIRAM document to device tree
 bindings.
Date: Tue, 23 Feb 2016 14:15:20 -0600
Message-ID: <20160223201520.GA3354@rob-hp-laptop>
References: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455757572-44955-1-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: oss@buserror.net, leoyang.li@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 18, 2016 at 09:06:06AM +0800, Zhao Qiang wrote:
> Add IC, SI and SIRAM document of QE to
> Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> 
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---
> Changes for v2
> 	- Add interrupt-controller in Required properties
> 	- delete address-cells and size-cells for qe-si and qe-siram
> 
>  .../devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt  | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> index 4f89302..84052a7 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> @@ -69,6 +69,56 @@ Example:
>  	};
>       };
>  
> +* Interrupt Controller (IC)
> +
> +Required properties:
> +- compatible : should be "fsl,qe-ic".

> +- compatible : should be "fsl,qe-si".

> +- compatible : should be "fsl,qe-siram".

These compatible strings are all a bit generic and should have SoC 
specific compatible strings.

Rob
