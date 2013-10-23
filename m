From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Wed, 23 Oct 2013 22:08:09 +0200
Message-ID: <20131023200808.GC8828@mithrandir>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <1382346813-8449-1-git-send-email-denis@eukrea.com>
 <20131022045833.GB17512@ns203013.ovh.net>
 <20131022072307.GA8681@ulmo.nvidia.com>
 <20131022153445.GD17512@ns203013.ovh.net>
 <20131022200141.GA8037@mithrandir>
 <20131023134236.GE17512@ns203013.ovh.net>
 <5267FE02.6000001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2/5bycvrmDh4d1IB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5267FE02.6000001-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Eric B??nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar Wa??mann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 05:49:06PM +0100, Stephen Warren wrote:
> On 10/23/2013 02:42 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> ...
> > For me gpio_get_value can return the value of a an output gpio but this=
 need
> > to be checked with LinusW
>=20
> That's certainly not true for all possible GPIO controllers; there are
> at least some that can't read either:
>=20
> * The value of the physical wire, if the GPIO is configured as an output.
>=20
> * The value that the GPIO controller is driving as an output.

My point originally was that since it's an output pin, you need to
configure it as an output before you can use it. The way to do that in
Linux is to call gpio_direction_output(). But that will automatically
also force the output value to whatever you specify as the second
parameter.

I suppose that could be remedied by adding a separate function that
doesn't set the value, but as Stephen points out, reading the value of
an output pin may not be supported on all hardware.

Thierry

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaCyoAAoJEN0jrNd/PrOh+IEP/36fiiVQC4AugeLmNB2LmAdf
jkRZOFpiNPM27Xb+eCU/HBJgYbZxoY1SH/0qUnlBRTSMIaQ451MG3nHOr4UH1Q0E
64GnyHxOyFc9/Vp94IITvnJgYsKATllUIGklJC3MajlgKCmVtlUSkVoVphXsh7r/
j5U+fKaVsvlRSWBO25cYvNSWZtTzEb/gmjWeRdZlI2PcCmFGpQSAvBs23KHHxIFd
HH7PGCFrRyNk09RRRfSz3Ax+X4E/0Y0Mvl2ZdWhlGETij72V3uYEbJ9O7U3rV+kT
H3PorXpKFAvLTcSkguNN1kATcZ/fJmalbFUN4zlB8xjSwls6UCLp3ZCSmA1cl7cJ
uRiDHzW9eQMQM4/GOm0YEa0dfRsMBDHHBfATE6XaqYztt9KT2I5NoRjoVWXwZm4i
Dy39NsrwaxT9T/bEM9RjDQpKjfbPCyMV5hCc/0myJIBcM/b6gzUodxpLEduSNTiJ
7NpqCs9qjWNT199LRf8W074tn8OvYTLUtp9+nak0fkxkqL3uvt2Rl5hNdTxTN8fz
9z17QyahM8+BRrEBGnAuRbS/apbR9MqQ5BFsIx/iuCwdFIOljAIl0SrhxciNkWOJ
tnAIT2R12mAzieEVisn9orlwmzN42OaCiUPDnpypzNhHCuxFJVca11l+W+94brD/
twDDzcAKiBe8G0rcvbll
=3e4C
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
