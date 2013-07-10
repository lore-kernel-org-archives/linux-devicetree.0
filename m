From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: DT bindings for the palmas family MFD
Date: Wed, 10 Jul 2013 11:27:24 +0100
Message-ID: <20130710102724.GC24508@sirena.org.uk>
References: <1370261333-5121-1-git-send-email-j-keerthy@ti.com>
 <20130603141851.GG3370@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1117981669512644219=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130603141851.GG3370-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1117981669512644219==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 03, 2013 at 03:18:51PM +0100, Lee Jones wrote:
> On Mon, 03 Jun 2013, J Keerthy wrote:

> > +	       optional chip specific regulator fields :-
> > +	       ti,warm-reset - maintain voltage during warm reset(boolean)

> Pushing the boat out a bit here, but is it possible to reuse
> 'regulator-always-on' for this?

This sounds more like "don't reset over reboot" than "never change the
enable state".

> > +	       ti,roof-floor - control voltage selection by pin(boolean)

> Is this the same as a GPIO regulator?

> If so, you might not need to add superfluous vendor specific properties.

Lots of regulators have the ability to do things like switch between
programmable voltages based on GPIOs (enabling a fast change to a known
voltage) - the roof-floor naming sounds like this.  Usually there's also
register based element for selecting the voltage.

> See: Documentation/devicetree/bindings/regulator/gpio-regulator.txt

> > +	       ti,sleep-mode - mode to adopt in pmic sleep 0 - off, 1 - auto,
> > +	       2 - eco, 3 - forced pwm

> I've seen lots of sleep-mode properties, can't we define a generic
> one?

We should make some of this more standard (at least things like
voltages) but the whole concept of what sleep mode is is at best fuzzy.
You typically need different selections for suspend to RAM and suspend
to disk, plus often the suspend configuration is dynamic depending on
what the system is doing since suspend is just CPU suspend not system
suspend and there's also some changes that might happen depending on
which wake sources are currently available.

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR3TcEAAoJELSic+t+oim9e6YP/iYgEoPUxH/OaBtTO5O3hYid
RZ/mIrqY68dIOBRQ50vRmLY1FlauXeQCRKTALvgX6yBlPjAuYhpJBnEIp9hxZqR9
sZuSG8RBseeKJGxtswfwLWWes2fO9RTfT2a4cqvtc32fmzu0/0bAxKqz/CtHkKIj
trGvd/RUFjBuZzPPuAZ+L4Cx8vX40NunK9jWsoR02NcH3Z06SOsa7ztYm7ORjvj+
qdxD+y5/2mNdt211YQbwHSTTPcfyLJdlxrrJTxaUTfHYML+SvWEh//8OFFBKKdua
s4Rwrf1X56aSalHKW0o1VnSsoDJmadMoc1GeOYsKrUZD5p8zW8BkMMYkjXyGkCSr
CJ0M79o8IkXUolKoWUiX+S+lelO7I8j0iu0mzssJsC4Tf8+OJwtBAz6waPvuJlrN
ez+fqsR3yEXSc5UuGRfzZFNYa1+SYcA8Ma4AITR+iwnGc9TOegBCI3NE9XvQZa/i
VIGE9+M3OVYM+XxrNLjKkw4QD27dRz8/RExH7PgumC1liFU+Nvmainx2mqaomwXN
Tl0WYaZEQ1Gu9pv7MHb/ywBbD93M7gzgD6jtOzYiGUogSE+HmbeediDblLtGvTbh
Sfm9JVWRhlt7aLHNsx3YLKHvFmRuhY+48pJrZtNZBBtmcspeBDvXNqCY65eImVbW
awRLEklN7Az8Ea6n0PYK
=UQsC
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--

--===============1117981669512644219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1117981669512644219==--
