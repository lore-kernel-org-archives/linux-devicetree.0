From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/5] Documentation: DT: vdma: Rename vdma-chan prefix
 to dma-chan
Date: Wed, 6 Apr 2016 16:00:14 -0700
Message-ID: <20160406230014.GC16193@xsjsorenbubuntu>
References: <1459959335-24083-1-git-send-email-appanad@xilinx.com>
 <1459959335-24083-2-git-send-email-appanad@xilinx.com>
 <20160406162022.GS23198@xsjsorenbubuntu>
 <C246CAC1457055469EF09E3A7AC4E11A4A57364B@XAP-PVEXMBX01.xlnx.xilinx.com>
 <57057C9B.8040804@metafoo.de>
 <1459980839.3136.87.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459980839.3136.87.camel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Williams, Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XWGXanvQGlWp@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-04-06 at 22:13:59 +0000, Koul, Vinod wrote:
> On Wed, 2016-04-06 at 23:16 +0200, Lars-Peter Clausen wrote:
> > On 04/06/2016 06:25 PM, Appana Durga Kedareswara Rao wrote:
> > > a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> > > > > +++
> > > > > b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.tx=
t
> > > > > @@ -24,8 +24,8 @@ Optional properties:
> > > > >  	{3}, flush s2mm channel
> > > > >=20
> > > > >  Required child node properties:
> > > > > -- compatible: It should be either "xlnx,axi-vdma-mm2s-channe=
l"
> > > > > or
> > > > > -	"xlnx,axi-vdma-s2mm-channel".
> > > > > +- compatible: It should be either "xlnx,axi-dma-mm2s-channel=
"
> > > > > or
> > > > > +	"xlnx,axi-dma-s2mm-channel".
> > > >=20
> > > > This change is not backwards compatible and breaks every user o=
f
> > > > the current
> > > > binding.
> > >=20
> > > This commit http://git.kernel.org/cgit/linux/kernel/git/vkoul/sla=
ve-
> > > dma.git/commit/?h=3Dnext&id=3D8e66e7d682b04f7141f8ae666908c8dcd7f=
c0bfa=20
> > > Renames xilinx_vdma_ prefix to xilinx_dma which includes renaming=
 of
> > > the above properties.
>=20
> That patch changes driver from vdma to dma. It does not change proper=
ty
> name!

It does. Unfortunately there are no line numbers on that website, hence=
 here an excerpt
from the commit you mention:
@@ -1220,26 +1220,26 @@ static int xilinx_vdma_chan_probe(struct xilinx=
_vdma_device *xdev,
 	if (!has_dre)
 		xdev->common.copy_align =3D fls(width - 1);
=20
-	if (of_device_is_compatible(node, "xlnx,axi-vdma-mm2s-channel")) {
+	if (of_device_is_compatible(node, "xlnx,axi-dma-mm2s-channel")) {
 		chan->direction =3D DMA_MEM_TO_DEV;
 		chan->id =3D 0;

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
