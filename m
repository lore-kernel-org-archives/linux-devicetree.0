From: Jerry-ch Chen <Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH V1 3/6] dt-bindings: mt8183: Added FD dt-bindings
Date: Tue, 7 May 2019 21:52:30 +0800
Message-ID: <1557237150.11458.45.camel@mtksdccf07>
References: <20190423104505.38778-1-Jerry-Ch.chen@mediatek.com>
 <20190423104505.38778-4-Jerry-Ch.chen@mediatek.com>
 <20190501224647.GA12044@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190501224647.GA12044@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, suleiman-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jerry-ch.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, shik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thank you for your comments.

On Wed, 2019-05-01 at 17:46 -0500, Rob Herring wrote:
> On Tue, Apr 23, 2019 at 06:45:02PM +0800, Jerry-ch Chen wrote:
> > From: Jerry-ch Chen <jerry-ch.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > This patch adds DT binding documentation for the Face Detection (FD)
> > unit of the camera system on Mediatek's SoCs.
> > 
> > Signed-off-by: Jerry-ch Chen <jerry-ch.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../bindings/media/mediatek,mt8183-fd.txt     | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> > new file mode 100644
> > index 000000000000..97c12fd93e7e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
> > @@ -0,0 +1,34 @@
> > +* Mediatek Face Detection Unit (FD)
> > +
> > +Face Detection (FD) unit is a typical memory-to-memory HW device.
> > +It provides hardware accelerated face detection function, and it
> > +is able to detect different poses of faces. FD will writre result
> > +of detected face into memory as output.
> > +
> > +Required properties:
> > +- compatible: "mediatek,mt8183-fd"
> > +- reg: Physical base address and length of the function block register space
> > +- interrupts: interrupt number to the cpu.
> > +- iommus: should point to the respective IOMMU block with master port as
> > +  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> > +  for details.
> 
> How many entries? Looks like 3 from the example.
> 

Yes, we have 3 entries.  I would like to update this part as
following:

iommus: should point to the 3 entries:  M4U_PORT_CAM_FDVT_RP,
M4U_PORT_CAM_FDVT_WR and M4U_PORT_CAM_FDVT_RB.  (Please see
Documentation/devicetree/bindings/iommu/mediatek,iommu.txt for details.)

> > +- mediatek,larb: must contain the local arbiters in the current Socs, see
> > +  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> > +  for details.
> > +- clocks : must contain the FDVT clock
> > +- clock-names: must contain FD_CLK_IMG_FD
> > +
> > +Example:
> > +	fd:fd@1502b000 {
>            ^ space needed
> 

We will fix it in next version of the patch.

> > +		compatible = "mediatek,mt8183-fd";
> > +		mediatek,larb = <&larb5>;
> > +		mediatek,scp = <&scp>;
> > +		iommus = <&iommu M4U_PORT_CAM_FDVT_RP>,
> > +			 <&iommu M4U_PORT_CAM_FDVT_WR>,
> > +			 <&iommu M4U_PORT_CAM_FDVT_RB>;
> > +		reg = <0 0x1502b000 0 0x1000>;
> > +		interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&imgsys CLK_IMG_FDVT>;
> > +		clock-names = "FD_CLK_IMG_FD";
> > +	};
> > +
> > -- 
> > 2.18.0
> > 

Sincerely,

Jerry
