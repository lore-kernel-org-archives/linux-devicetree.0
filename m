From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Appended DTB files for multi-machine kernels
Date: Thu, 4 Jul 2013 18:11:48 +0100
Message-ID: <20130704171148.GJ27646@sirena.org.uk>
References: <51D5A938.30607@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0143677987900294903=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51D5A938.30607-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sven Neumann <s.neumann-5g8ninUHluJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============0143677987900294903==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yo6atQ2PxMLW0cRR"
Content-Disposition: inline


--yo6atQ2PxMLW0cRR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 04, 2013 at 06:56:24PM +0200, Daniel Mack wrote:

> Unless I missed some recent discussion, this case is not easy to handle.
> Yes, I know that these kind of things should be handled by a
> next-generation bootloader, but in our case, we want to avoid a loader
> update of already shipped hardware by all means.

There was some discussion about appending multiple DTBs recently.  I
can't actually recall anything about it though so that's not an entirely
helpful thing...

> As a solution, I'm thinking of a small framework that could for example
> work as follows.

> a) A small mechanism allows storing multiple DTB binary files inside the
> kernel binary at compile time, and a simple function can extract them
> again by name at runtime (something like what the firmware framework
> does, but I don't know if that one can be used at such an early stage in
> the boot process).

Another way of skinning this would be for either the kernel to contain
a set of machine ID to compatible string mappings or for the device
trees for the boards to have an additional properties giving the machine
IDs that the boards match.  The kernel could then look for multiple DTBs
appended to the image and try to pick one based on ATAGs.

--yo6atQ2PxMLW0cRR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR1azRAAoJELSic+t+oim9XMYP/0pG+ceAPKwVvkXGzLVIXgMK
P/dnxhlYyzQb2dGen/xA9TsZB6RQclBq4cd9SgdSANJzXRUNoH083Z/kpPtmOZEt
5pqpSHNh6GuFPgTwSLf8ggd0PE34uVUqFxZi5YaJUGHFJbVDxJZt50vZ4j3Uxfbo
1Ev9Y5VfbPtFU5aryrhA5nrjjBnhxeMUfXMkhX9C7ONcdDUh0jFLZVc8BgY4m/1J
E03D3debAXL+0QxAAsCp35yLMoFQM4WCul1a2PwozIX8Ghtww4PCHKBjGJe/8gHR
8Sxoe5PIeXTjc2S9aBECSu9EXEh0xDpU45iOGlqN5keKVpKnHMrFOU1daNlFthWW
tKlhyam+27djvzso8fMZ1U8JZU6Mmu318yHSiKb0UW00dAWPa+o0+JW6ReTW3STe
01C0f/cGA/9MizKvw3Sf4slanUC9LlbSAPWVxj90WoX4TILtlsiPIHDOC4+KJjWC
fCU7LLY2d5khEtDXUo5ZiCFkI7mlq/076xDvOKcq5woputrHevm+qstq46tTV3YR
DxzErVbtYOOMyPSxiP2nZGj8UELotuMHvaCo2B7Ayum4d7G9556fxVvgLBcVgX2q
wgyw9Hg7yLlA/j4R72DeHc58jCvlmCfimNcv+oCnHO7odejSgNsPhvTX+OkNTZd5
DR0DJOwkfRPCJomuRzVl
=JmNA
-----END PGP SIGNATURE-----

--yo6atQ2PxMLW0cRR--

--===============0143677987900294903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0143677987900294903==--
