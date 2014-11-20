From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Looking for good references for ARM driver development
Date: Thu, 20 Nov 2014 18:33:05 +0400
Message-ID: <20141120183305.53af4ec99d746403b339aaf1@gmail.com>
References: <546C920A.7060800@free.fr>
	<546CB0EB.9080005@suse.de>
	<546CBFAC.9040906@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546CBFAC.9040906-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mason <mpeg.blue-GANU6spQydw@public.gmane.org>
Cc: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 19 Nov 2014 17:05:00 +0100
Mason <mpeg.blue-GANU6spQydw@public.gmane.org> wrote:

> Hello Andreas,
>=20
> On 19/11/2014 16:02, Andreas F=E4rber wrote:
>=20
> > Am 19.11.2014 um 13:50 schrieb Mason:
> >
=2E..
> > Since this appears to be about an ARM SoC according to your To list=
,
> > in general, you create a device tree binding, that binding is
> > registered within your platform/... driver code and referenced in t=
he
> > device tree for SoC or board, and then your driver will automatical=
ly
> > be probed.
>=20
> I know nothing about DT (aside from the Wikipedia entry).
> I'll take a closer look at Documentation/devicetree.
> Will that explain what platform/... is?
>=20
> I see a drivers/platform folder, but nothing ARM-specific there?

There are very good presentations from Free Electrons:

  * http://free-electrons.com/pub/conferences/2013/elce/petazzoni-devic=
e-tree-dummies/petazzoni-device-tree-dummies.pdf
     ** see also http://www.youtube.com/watch?v=3Dm_NyYEBxfn8
  * https://archive.fosdem.org/2013/schedule/event/arm_in_the_linux_ker=
nel/attachments/slides/273/export/events/attachments/arm_in_the_linux_k=
ernel/slides/273/arm_support_kernel.pdf

--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
