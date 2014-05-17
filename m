From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: rockchip: convert smp bringup to CPU_METHOD_OF_DECLARE
Date: Sat, 17 May 2014 02:16:10 +0200
Message-ID: <21547723.QIMYqQcA8Y@phil>
References: <1632873.urGeGsUMPH@diego> <155552153.z5UXrbJMBi@phil> <20140516225422.GA6028@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140516225422.GA6028-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Olof,

Am Freitag, 16. Mai 2014, 15:54:22 schrieb Olof Johansson:
> On Mon, May 12, 2014 at 07:17:46PM +0200, Heiko St=FCbner wrote:
> > Am Donnerstag, 27. M=E4rz 2014, 01:06:32 schrieb Heiko St=FCbner:
> > > With the newly introduced CPU_METHOD_OF_DECLARE is not necessary =
anymore
> > > to reference the relevant smp_ops in the board file, but instead =
it can
> > > simply be set by the enable-method property of the cpu nodes.
> > >=20
> > > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> >=20
> > more responses to this? [or maybe even an ack :-) ? ]
>=20
> Looks reasonable to me:
>=20
> Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

or you could simply apply it to arm-soc directly :-)

Because apart from the pull request I sent two days ago, this patch loo=
ks like=20
the last one for 3.16 ... everything else needs to marture a bit longer=
=2E

Otherwise I'll send a pull-request for this one patch in the next days.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
