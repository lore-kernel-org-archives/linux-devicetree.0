From: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v7 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma
 device tree binding documentation
Date: Wed, 27 Apr 2016 07:33:22 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A57B840@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1461740729-30715-1-git-send-email-appanad@xilinx.com>
 <57206632.7010508@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57206632.7010508-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, Anirudha Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lars,

> -----Original Message-----
> From: Lars-Peter Clausen [mailto:lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org]
> Sent: Wednesday, April 27, 2016 12:42 PM
> To: Appana Durga Kedareswara Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; Michal Simek
> <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; Appana Durga Kedareswara
> Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org;
> laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org; luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org; Anirudha
> Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Punnaiah Choudary Kalluri
> <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v7 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma
> device tree binding documentation
> 
> On 04/27/2016 09:05 AM, Kedareswara rao Appana wrote:
> [...]
> > +- xlnx,include-sg	: Indicates the controller to operate in simple or
> > +			  scatter gather dma mode
> > +- xlnx,ratectrl		: Scheduling interval in terms of clock cycles for
> > +			  source AXI transaction
> > +- xlnx,overfetch	: Tells whether the channel is allowed to over
> > +			  fetch the data
> > +- xlnx,src-issue	: Number of AXI outstanding transactions on source
> side
> > +- xlnx,src-burst-len	: AXI length for data read. Support only power of
> > +			  2 byte values.
> > +- xlnx,dst-burst-len	: AXI length for data write. Support only power of
> 
> These are all software runtime configuration parameters that you'd want to
> change at runtime depending on which peripheral you are targeting with a
> specific DMA transfer. These really do not belong into the devicetree.

You mean to have a separate config structure in the driver and handle the above parameters
Through that structure???

I understand that above will work for slave dma transfer types what about memory to memory
Transfers where we don't have provision to the use this parameters...

Regards,
Kedar.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
