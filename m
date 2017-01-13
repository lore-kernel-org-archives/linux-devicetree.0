From: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v5 1/3] dmaengine: xilinx_dma: Check for channel idle
 state before submitting dma descriptor
Date: Fri, 13 Jan 2017 05:32:39 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A666694@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1483771530-8545-1-git-send-email-appanad@xilinx.com>
 <1483771530-8545-2-git-send-email-appanad@xilinx.com>
 <20170110062349.GY3573@localhost>
 <C246CAC1457055469EF09E3A7AC4E11A4A666658@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20170113052939.GP3573@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170113052939.GP3573@localhost>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, "Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,
=09
	Thanks for the review...
>=20
> On Fri, Jan 13, 2017 at 04:28:11AM +0000, Appana Durga Kedareswara Rao
> wrote:
> > Hi Vinod,
> >
> > 	Thanks for the review...
> > >
> > > On Sat, Jan 07, 2017 at 12:15:28PM +0530, Kedareswara rao Appana wrot=
e:
> > > > Add channel idle state to ensure that dma descriptor is not
> > > > submitted when VDMA engine is in progress.
> > >
> > > any reason why you want to make your own varible and not use the HW
> > > to query as done earlier. It is not clear to me why that is removed
> > > from description
> >
> > We need to poll for a bit in the status register to know the dma state.
> > We are currently doing that in the driver hot path To avoid this using
> > own variables.
>=20
> It would be worthwhile to document these, down the line people may not
> remeber the motivation

Sure will add comments during the variable initialization
In the driver...

Regards,
Kedar.

>=20
>=20
> --
> ~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
