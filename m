From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2 v6] dt/bindings: Add bindings for Layerscape SCFG MSI
Date: Wed, 23 Mar 2016 10:22:17 -0500
Message-ID: <20160323152217.GA23919@rob-hp-laptop>
References: <1458731300-13648-1-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458731300-13648-1-git-send-email-Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Scott Wood <scott.wood-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 23, 2016 at 07:08:19PM +0800, Minghuan Lian wrote:
> Some Layerscape SoCs use a simple MSI controller implementation.
> It contains only two SCFG register to trigger and describe a
> group 32 MSI interrupts. The patch adds bindings to describe
> the controller.
> 
> Signed-off-by: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
> ---
> change log:
> v6-v4: no change
> v4: add interrupt-parent description
> v3-v1: no change
>  
>  .../interrupt-controller/fsl,ls-scfg-msi.txt       | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-scfg-msi.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
