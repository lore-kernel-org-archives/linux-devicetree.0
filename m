From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/7] QE: Add IC, SI and SIRAM document to device tree
 bindings.
Date: Fri, 4 Mar 2016 22:25:18 -0600
Message-ID: <20160305042518.GB13525@rob-hp-laptop>
References: <1456816183-22340-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456816183-22340-1-git-send-email-qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
Cc: oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, xiaobo.xie-3arQi8VN3Tc@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 01, 2016 at 03:09:37PM +0800, Zhao Qiang wrote:
> Add IC, SI and SIRAM document of QE to
> Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
> 
> Signed-off-by: Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes for v2
> 	- Add interrupt-controller in Required properties
> 	- delete address-cells and size-cells for qe-si and qe-siram
> Changes for v3
> 	- Add SoC specific caompatible strings to qe-si and qe-siram
> 
>  .../devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt  | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
