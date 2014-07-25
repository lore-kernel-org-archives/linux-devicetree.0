From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 06/11] ARM: dts: zynq: Add DMAC for Parallella
Date: Fri, 25 Jul 2014 07:43:44 -0700
Message-ID: <9d1e0d28-1fa2-4ef4-9d6f-b64829223f74@BN1AFFO11FD021.protection.gbl>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
 <1406242820-20140-7-git-send-email-afaerber@suse.de>
 <bc390439-9a5b-43a1-a70c-a4c6517a6cb6@BN1AFFO11FD005.protection.gbl>
 <53D20F2A.5020209@monstr.eu> <53D21458.3060403@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53D21458.3060403-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-07-25 at 10:24AM +0200, Andreas F=C3=A4rber wrote:
> Am 25.07.2014 10:02, schrieb Michal Simek:
> > On 07/25/2014 01:28 AM, S=C3=B6ren Brinkmann wrote:
> >> On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
> >>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> >>> ---
> >>>  v2: New
> >>> =20
> >>>  arch/arm/boot/dts/zynq-7000.dtsi      | 17 +++++++++++++++++
> >>>  arch/arm/boot/dts/zynq-parallella.dts |  4 ++++
> >>>  2 files changed, 21 insertions(+)
> >>>
> >>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts=
/zynq-7000.dtsi
> >>> index eed3df0..1a70277 100644
> >>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> >>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> >>> @@ -223,6 +223,23 @@
> >>>  			};
> >>>  		};
> >>> =20
> >>> +		dmac_s: dmac@f8003000 {
> >>> +			compatible =3D "arm,pl330", "arm,primecell";
> >>> +			reg =3D <0xf8003000 0x1000>;
> >>> +			status =3D "disabled";
> >> I think for this IP we can omit the 'status' property since it is =
always
> >> enabled. I don't see a reason to override it in each board DT.
> >=20
> > Done this change myself
>=20
> Fine with me, but allow me to point out that the TRM documents the DM=
AC
> being mapped as DMAC S at the above address, and as DMAC NS at F800_4=
000
> (secure vs. non-secure, ch. 4.6, p. 116). Not sure how this would be
> handled driver-wise if not through alternative dt nodes?

The upstream Linux runs in secure state on Zynq, hence I think this is =
fine. If
somebody wants to run Linux on Zynq non-secure they have to do some wor=
k
anyhow. This way the standard configuration can use the DMA engine.

	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
