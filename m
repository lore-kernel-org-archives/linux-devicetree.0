From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 0/3] dts: add ls2088a and 1088a pcie DT nodes
Date: Sat, 5 Aug 2017 13:46:29 +0800
Message-ID: <20170805054627.GU31819@dragon>
References: <1501829046-3761-1-git-send-email-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501829046-3761-1-git-send-email-Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhiqiang Hou <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 04, 2017 at 02:44:03PM +0800, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>
> 
> Add GICv3 ITS DT node for ls1088a, because the PCIe nodes must
> have a msi-parent.
> 
> Hou Zhiqiang (3):
>   dts: ls2088a: add pcie support
>   dts: ls1088a: add gicv3 ITS DT node
>   dts: ls1088a: add PCIe controller DT nodes

Please have an additional 'arm64: ' prefix for these arm64 dts patches.

Shawn

> 
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 81 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi |  4 ++
>  2 files changed, 85 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
