From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RESEND] Documentation: devicetree: Fix Xilinx VDMA
 specification
Date: Wed, 12 Nov 2014 10:26:03 -0800
Message-ID: <bd47278216b64375b32cdc9ed66fe907@BN1BFFO11FD024.protection.gbl>
References: <1415800277-6817-1-git-send-email-afaerber@suse.de>
 <6067bede14b9421fa87db96bdc66dc66@BN1AFFO11FD040.protection.gbl>
 <5463A0F4.6060300@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5463A0F4.6060300-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-11-12 at 07:03PM +0100, Andreas F=C3=A4rber wrote:
> Am 12.11.2014 um 16:57 schrieb S=C3=B6ren Brinkmann:
> > On Wed, 2014-11-12 at 02:51PM +0100, Andreas F=C3=A4rber wrote:
> >> The specification requires xlnx,data-width, but example and driver=
 use
> >> xlnx,datawidth. Change the specification to match the implementati=
on.
> >=20
> > Isn't this the wrong way around? The bindings are considered API, s=
o
> > shouldn't the driver be fixed to match the spec?
>=20
> In theory, patch review should've never let the two differ... ;)
>=20
> It's not my driver, so I fixed the perceived inconsistency the least
> invasive way; Michal and Srikanth seemed to concur at the time.
>=20
> https://patchwork.kernel.org/patch/4620261/
>=20
> > Are there already dts files out there using either of these options=
?
>=20
> In upstream, no. microblaze and virtex440 use a
> xlnx,include-datawidth-matching-0 property as precedence for the
> spelling, whereas there is an fsl,data-width and an unused msix-data-=
width.
>=20
> Downstream, yes: Beyond my own patch derived from the Parallella tree=
,
> there's some in the ADI tree. None in the Xilinx tree on quick check.
>=20
> I haven't encountered any using the documented xlnx,data-width - but
> this patch was authored pre 3.17, haven't ran a full Web search again=
=2E

grepping through linux-next shows some usage of xlnx,datawidth, but
only the single hit in  Documentation for xlnx,data-width.
Other than VDMA the other hit seems to be just some DT
documentation which I can't find a driver for...
Anyhow, this patch is probably the best way of fixing this.

Reviewed-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

	Thanks,
	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
