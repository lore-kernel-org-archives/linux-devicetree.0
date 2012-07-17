From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 i2c-embedded tree
Date: Tue, 17 Jul 2012 16:20:01 +0100
Message-ID: <20120717152001.GF4477@opensource.wolfsonmicro.com>
References: <5003FB7C.4030509@linaro.org>
 <20120717130650.GB27595@sirena.org.uk> <500568D9.10805@linaro.org>
 <20120717133550.GC4477@opensource.wolfsonmicro.com>
 <50057058.2060002@linaro.org>
 <20120717142222.GE4477@opensource.wolfsonmicro.com>
 <50057C1A.80606@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7506620792495498137=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50057C1A.80606-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Deepak Saxena <dsaxena-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alessandro Rubini <rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============7506620792495498137==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Content-Disposition: inline


--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 17, 2012 at 03:52:10PM +0100, Lee Jones wrote:

> I think it would be okay to take the 3 patches due for the v3.6
> merge window, which target the nmk-i2c driver. If any consolidation
> happens in the mean-time/future I will personally do the work to
> bring the nmk-i2c into line to use any generic bindings which
> result.

> No one else is ever going to use these vendor specific bindings, so
> I'm sure no issues will arise. It also means that we have a fully
> enabled driver which is capable of receiving a new configuration via
> minor changes to the dts, which is important for the current (only)
> user of this driver for an upcoming project.

So, this is pretty much what vendors always say about this stuff...

Looking at what's specified in the platform data in the current kernel
it seems like there's a mixture of things in there that are board and
silicon specific.  We've got parameters like the the speed mode and
timeout which are reasonably board specific but we've also got things
like the FIFO sizes which shouldn't be at all board specific and slsu
which really looks like it's something that that the driver ought to be
able to figure out for itself.

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQBYKOAAoJEBus8iNuMP3dQPgP/i14QVmEVzfiikhATrJOg4bW
4dkAqqzsSGoiPXDvLWshMzvN8d1wKwRQcFdELNc8aIvy5bpZSnvjxTASpM5HRv4D
1l6ph901olMmqwkYUG2iPo2RP2DrOK9gF+fgVSIpj2vsxpH3JGuba1O9E486DenM
Wn7ciWXA6nmeJW0XlDQYl7Ln7Glth4hy+aZDFW1svkqUNT7dfXWZLbA21bjDuDW4
NLAcAfSx23snXXlQi2gY1CNnIHOP+CKGmICbRUhG5MbfLWC61V015V3rnlmu9/a/
Z9wav3yF9m8bCUal27oIIWyeyGyz4HxAkQNlRziWUcsJTHhgyhT6x2XU1puRNARh
EVIveMqo2WmZ2eAzom2jg7BkP065BnH1392j4UbaHGv3TWXPz+zmS/ypCdpfi5mp
CvcBSZSHDu96UCAUYyXhtAygPQ9A1CoVwIoLQJ1ZcRKATti6KPQ5sfOd+iQf1WvL
rcUGAREcroaw1hj+QTlgVU8cI82ZSxCL3xc68+NjqKemcuUB74PTuye7Azw4/XLu
zIW91RutdjRAPTgwcO8GeVlcOoT8CDih7EvyhGO+CTg9cTNF0IqAgbLciHTdjHg9
r05TZ9j+BbAYy0EGozuuRqFLALGY66G9zZsuFjFP2ldgn9kqy8Z/FByTsFSNf1fy
fGXoM7pZC8TY6Tk27dLO
=jvqo
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--

--===============7506620792495498137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7506620792495498137==--
