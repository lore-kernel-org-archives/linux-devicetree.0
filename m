From: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v4 4/5] Documentation: DT: vdma: update binding doc for
 AXI CDMA
Date: Mon, 2 May 2016 12:02:44 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A57D479@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1460006985-14805-1-git-send-email-appanad@xilinx.com>
 <1460006985-14805-5-git-send-email-appanad@xilinx.com>
 <20160411140243.GA827@rob-hp-laptop>
 <C246CAC1457055469EF09E3A7AC4E11A4A57553D@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A57553D-4lKfpRxZ5enZMOc0yg5rMog+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Appana Durga Kedareswara Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, Anirudha Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Punnaiah
List-Id: devicetree@vger.kernel.org

Hi Vinod,

> -----Original Message-----
> From: dmaengine-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:dmaengine-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Appana Durga Kedareswara Rao
> Sent: Tuesday, April 12, 2016 11:51 AM
> To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
> Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; Michal Simek
> <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org;
> laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org; luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org; Anirudha
> Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Subject: RE: [PATCH v4 4/5] Documentation: DT: vdma: update binding doc for
> AXI CDMA
> 
> 
> 
> > -----Original Message-----
> > From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> > Sent: Monday, April 11, 2016 7:33 PM
> > To: Appana Durga Kedareswara Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> > ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org; galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; Michal Simek
> > <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> > vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org; Appana Durga Kedareswara
> > Rao <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org;
> > laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org; luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org; Anirudha
> > Sarangi <anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> > kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Subject: Re: [PATCH v4 4/5] Documentation: DT: vdma: update binding doc for
> > AXI CDMA
> >
> > On Thu, Apr 07, 2016 at 10:59:44AM +0530, Kedareswara rao Appana wrote:
> > > This patch updates the device-tree binding doc for adding support for
> > > AXI CDMA.
> > >
> > > Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > Changes for v4:
> > > ---> None.
> > > Changes for v3:
> > > ---> Removed CDMA DT example from the patch as suggested by the Rob.
> > > Changes for v2:
> > > ---> Modified commit message as suggested by Vinod.
> > > ---> Moved the patch to forward in the series as suggested by vinod.
> > >
> > >  Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 6
> > > +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Thanks for the Ack Rob...
> 
> @Vinod: I got the Ack's for the binding doc patches in this series
> If you are ok with the other patches could you please apply this patch series?

Could you please review this patch Series?
If you are ok with this patch series will resend on top of the dma-next  

Regards,
Kedar.

> 
> Regards,
> Kedar.
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
