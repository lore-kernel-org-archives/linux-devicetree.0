From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCHv7][ 2/2] video: backlight: gpio-backlight: Add DT support.
Date: Fri, 6 Dec 2013 14:00:15 +0100
Message-ID: <20131206130014.GB30625@ulmo.nvidia.com>
References: <1386266109-16071-1-git-send-email-denis@eukrea.com>
 <1386266109-16071-2-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2265133720620764698=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386266109-16071-2-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Denis Carikli <denis@eukrea.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Jingoo Han <jg1.han@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Richard Purdie <rpurdie@rpsys.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sascha Hauer <kernel@pengutronix.de>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org, Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org


--===============2265133720620764698==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2013 at 06:55:09PM +0100, Denis Carikli wrote:
[...]
> +Optional properties:
> +  - default-state: The initial state of the backlight.
> +    Valid values are "on", "off", and "keep".
> +    The "keep" setting will keep the backlight at whatever its current
> +    state is, without producing a glitch. The default is keep if this
> +    property is not present.

I'm not sure if "on", "off" and "keep" are a good choice for this
binding. Having strings for these tristate values seems suboptimal.
Other bindings have chosen a representation that, transposed to this
use-case, would read something like this:

	- default-state: The initial state of the backlight. Valid
	  values:
	  - 0: off
	  - 1: on

	If the "default-state" property is not present, the default
	will be to keep the current backlight state.

Which is in fact the exact behaviour that your binding describes, but
it's much more intuitive in my opinion.

Thierry

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSocpeAAoJEN0jrNd/PrOhnVoP/ihhXwbyZbJV74YZMGX9WgXN
pdwboR+LZteIC1cUIJrdJJ3hK5dYk7+A4ilgEHQXIMltL16dl98dr2bCD9SASGXv
Z9mxgnqGdvdPijYu7NZrbULljqwFZ4/YzOV0Lw+yz9w0j22eTz+kjsTn48OmfavJ
vZEYihGbMIplA3JmJZexdc6Pw6CW/CXgf9lr/pYLPbsbM+gcqrBNZbmNKO0DQyD4
4Sa1ksFkztZ8tVNnOll8eUGHa7UFNOB+t070G0MAoEFOQm+ywDZm116ZJzfGU2R7
89yFhkl0yE40/OYXX12uxE2VTLO4arY4m16OBCAT+90oM2apIP9oD1FZ471XyDbV
jGBqv0nO8XznkPhpqugPbVHWp1YHpMBWm4DwVbWQd7hRUtkDq2t1XAE84ibZSVny
miRWJZsyOdj0Sq/QQ8lL7fOkKxc+OY/KZ4gzYtgavD3M9zaz+Qm7IKYJsI8itZDb
rR0PomCBKKedbC2+OhwrxW3hejT9wq8RNs7Bu6YEmxDapVUZCbzTospGp98lzrXB
sZiosIoy/Jc8gRHPDhdPdB72scF+evmer3+oYx5nAdkHpBWa3UIkzsCgfHQx2nOU
VRMdwUpfE7QYeI4aAwPs+LXLafKDqRatpQyfl20KxZiJ7c1hSLvujAE0UfEFf7Fe
piWrCMv65u8Uz0tqVnRi
=2eOj
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--


--===============2265133720620764698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2265133720620764698==--
