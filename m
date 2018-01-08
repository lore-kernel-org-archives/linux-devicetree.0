From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/5] bindings: regulator: added support for suspend
 states
Date: Mon, 8 Jan 2018 12:35:33 +0000
Message-ID: <20180108123533.GE11698@sirena.org.uk>
References: <1515050568-23876-1-git-send-email-zhang.chunyan@linaro.org>
 <1515050568-23876-2-git-send-email-zhang.chunyan@linaro.org>
 <20180105185328.zmt33idv2cqled62@rob-hp-laptop>
 <20180105191837.GI9076@sirena.org.uk>
 <CAG2=9p-ec1oVe-+O0TGYFF-E5dGrP3FoRZXb1sCyjNScVvGNQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAG2=9p-ec1oVe-+O0TGYFF-E5dGrP3FoRZXb1sCyjNScVvGNQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 08, 2018 at 02:36:36PM +0800, Chunyan Zhang wrote:
> On 6 January 2018 at 03:18, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > No, it means that the software has permission to use those changes to
> > those registers - we only want to be changing things if the user has
> > permission to change them since some systems will have specific
> > constraints, we don't know if it's safe without being explicitly told.
> > You're right that we could infer this from a range being provided
> > though, let's do that.

> Ok, so we don't need this property IIUC, and instead we just need to check
> if the regulator-suspend-min-microvolt and regulator-suspend-max-microvolt
> are set to the same value, right?

Yes.

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlpTZZQACgkQJNaLcl1U
h9Dtigf+L8Ds7R6DYPDJApzyqaVRbHO40Noi0YsyljhtyjvEEIZ7egYeBMe4PHOu
85IovrsZ2NatFdQooepeACQeTUycIZlFRB8SGlh9QEZLhSEW98wMta3YixIL/iB6
hohaE/haBIixTircxFSFr7SN6o7PIs96yUzJ9snUQr3EN0cfS9LZs9co9uSLyaNh
IwxFTxbQKGrum/IGnq3TxvKVYFbVrUGKxuTgGEnrfSXCJRgZfjIfiRBPWDJjqsdk
EC9SJIB8DXKtGZjgEyd+PM95G04dlbpltny8k+9FBR94Lg53YD9GplLF7ZmsuupO
55QBlamq0Hi8oB8VN15KWfxlaQqs/A==
=ahAB
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
