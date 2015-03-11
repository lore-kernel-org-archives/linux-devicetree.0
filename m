From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] soc: Mediatek: Add SCPSYS power domain driver
Date: Wed, 11 Mar 2015 11:16:31 +0800
Message-ID: <1426043791.24243.9.camel@mtksdaap41>
References: <1425888603-25800-1-git-send-email-s.hauer@pengutronix.de>
	 <1425888603-25800-3-git-send-email-s.hauer@pengutronix.de>
	 <7h61a94zy0.fsf@deeprootsystems.com>
	 <20150310094142.GD24885@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150310094142.GD24885-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 2015-03-10 at 10:41 +0100, Sascha Hauer wrote:
> On Mon, Mar 09, 2015 at 02:35:03PM -0700, Kevin Hilman wrote:
> > Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> >=20
> > > Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >=20
> > A bit of a changelog here would be useful describing this driver, t=
hat
> > it's only covering part of the device (e.g. power controller) with =
more
> > to come, dependency on the syscon driver, etc.
> >=20
> > > +/*
> > > + * The Infracfg unit has bus protection bits. We enable the bus =
protection
> > > + * for disabled power domains so that the system does not hang w=
hen some unit
> > > + * accesses the bus while in power down.
> > > + */
> >=20
> > Hmm, why don't you want to know if some device is accessing another
> > device which is in a domain that is powered down?   Seems like this=
 is a
> > good way to hide real bugs.
>=20
> How I understand it the system just hangs on erroneous accesses witho=
ut
> these protection bits enabled, so enabling them at least makes sure w=
e
> can output something.
> I must admit though that my understanding of these bits is quite limi=
ted
> and the only user of this driver I have available here (audio) doesn'=
t
> make use of these protection bits, so I can't test here.
>=20
> James, could you shed some light on this issue?

I asked our designer about the bus protection feature, here is his
response:

"
It's for unexpected signal glitch in Power switch process.

During Power switch process, we have clock switch, reset, isolation
enable/disable and  power switch involved where the transition of
asynchronous reset and  isolation is the most critical one,  which have
risk to introduce a unexpected short period signal transition from
MTCMOS=A2s interface to other alive HW .=20
"

That means it protects unexpected bus accessing from HW, not from SW. S=
o
it will not hide bugs from wrong SW access.


Best regards,

James

************* Email Confidentiality Notice ********************
The information contained in this e-mail message (including any=20
attachments) may be confidential, proprietary, privileged, or otherwise
exempt from disclosure under applicable laws. It is intended to be=20
conveyed only to the designated recipient(s). Any use, dissemination,=20
distribution, printing, retaining or copying of this e-mail (including =
its=20
attachments) by unintended recipient(s) is strictly prohibited and may=20
be unlawful. If you are not an intended recipient of this e-mail, or be=
lieve=20
that you have received this e-mail in error, please notify the sender=20
immediately (by replying to this e-mail), delete any and all copies of=20
this e-mail (including any attachments) from your system, and do not
disclose the content of this e-mail to any other person. Thank you!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
