From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC V1] devicetree: Dialog Semiconductor consolidate existing
 vendor prefixes to standardise on 'dlg'
Date: Tue, 15 Jul 2014 12:13:50 +0100
Message-ID: <20140715111350.GA18495@sirena.org.uk>
References: <201407141616.s6EGG7uK022881@swsrvapps-01.diasemi.com>
 <20140714162101.GM26465@leverpostej>
 <6ED8E3B22081A4459DAC7699F3695FB7D0B269FA@SW-EX-MBX02.diasemi.com>
 <20140715110944.GY26465@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9208548269256216062=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140715110944.GY26465@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Shawn Guo <shawn.guo@freescale.com>, Silvio F <silvio.fricke@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, DEVICE TREE <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnaud Ebalard <arno@natisbad.org>, Rob Herring <robh+dt@kernel.org>, LINUX ARM KERNEL <linux-arm-kernel@lists.infradead.org>, Martin Fuzzey <mfuzzey@parkeon.com>, Support Opensource <Support.Opensource@diasemi.com>, LINUX KERNEL <linux-kernel@vger.kernel.org>, "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>, Florian
List-Id: devicetree@vger.kernel.org


--===============9208548269256216062==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 15, 2014 at 12:09:44PM +0100, Mark Rutland wrote:
> On Tue, Jul 15, 2014 at 11:07:57AM +0100, Opensource [Steve Twiss] wrote:

> > Rob said that the old forms should be marked as deprecated, but I didn't
> > deprecate any "dialog" or "diasemi" entries in this patch because I have
> > only made two types of change:

> > (1) definitions of "diasemi" or "dialog" that have not been used in the kernel;
> > (2) definitions of "diasemi" or "dialog" that are incompatible with existing driver code.

> > In both of these cases they cannot affect any working DTB.

> Ok, that sounds fine then. That just wasn't immediately obvious.

> Could you please note those facts in the commit message when you next
> post?

I thought we were already trying to do the stable ABI thing in wich case
at least the first case (where we just happen to not have in tree DTs
using the identifiers) should still remain supported?  It's not like it
really costs us anything to do it.

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxQzrAAoJELSic+t+oim96QwP/0nGX+/1gXpwtOhD7jG+f2dS
v3RDwz+Es2wv5CvytR3D1y9hezaQI2LqHPo8pB/gY28ALdbfSgQ1ODp3FLztXCgy
/7FAbLCjF8Lg4awtqOl0cnhyoe78DPpRs+Jqur1bTlFjvBTy5CnthdE2nM/kqUPO
QF3OktN59MSpPaeAgdxztD7RvLH7fOv+h66kMV7/9+SLaF7Jdu5pxYgW6UBtD9jH
79q2IMlc4gthK7zoHpswv8ntoY2VoNIj74mgtx6d96fNV3Nqe1esV62lHtOQzTkK
ZNgcnfb1HIw59crm09zPMEasPId5FUxiS5OBwV9k/Hz8lnNddPk2JoPtXu/cCFRA
pdCD6GTxsrbKLcF9h3vlLQr+rcDh1vavdroSePHnsvIF1Y5ru8V0gKB3C8nr4ymW
7ei3Gbfcj6arbxCeRpQsg0hrG1XQxKk9HrbPaEtDee+eT6m3NGQzO1w9g4JTvMpo
2lAaq3bzow9MngKz05+BHtBxStHMVJ9KUE4RHiWQVneNEJt/wrOXyxdWjrt2Hfk2
YMttUP5pQg4drjIQPVIucak95/MQHzNacXeoVMHVD65i1T2zuLxpvGEo9EvEmbm2
PQtxjzbSVhV/y+K7Lgt1jaCG/N72XHvNu/bfxfOK0DIE2i2S2s8tqKCLrdVqqfnS
cQTlfRoUGtRKxjh9/GV3
=NkQN
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--


--===============9208548269256216062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9208548269256216062==--
