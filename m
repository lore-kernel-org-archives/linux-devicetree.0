From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/5] powerpc/dts: add mcke-gpios for PM feature
Date: Thu, 4 Aug 2016 12:10:30 -0500
Message-ID: <20160804171030.GA12055@rob-hp-laptop>
References: <1470139124-12652-1-git-send-email-chenhui.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470139124-12652-1-git-send-email-chenhui.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chenhui Zhao <chenhui.zhao@nxp.com>
Cc: oss@buserror.net, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, jason.jin@nxp.com, z.chenhui@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 02, 2016 at 07:58:44PM +0800, Chenhui Zhao wrote:
> Signed-off-by: Chenhui Zhao <chenhui.zhao@nxp.com>
> ---
>  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 13 +++++++++++++
>  arch/powerpc/boot/dts/fsl/t1040si-post.dtsi        |  3 +++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> index e284e4e..1d44a80 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> @@ -21,6 +21,10 @@ Required properites:
>  	* "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
>  	* "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
>  
> +Optional properites:
> +  - mcke-gpios : The GPIO pin is used for keeping the MCKE signal of DDR modules
> +		 low in the LPM35 state on some platforms, such as T1040.

Needs a vendor prefix.
