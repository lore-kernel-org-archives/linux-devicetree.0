From: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH/RFC 05/15] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Date: Fri, 8 Mar 2019 17:49:25 +0100
Message-ID: <20190308164925.jwgq4rdqh6mmwwtf@uno.localdomain>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-6-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0996303141=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190306232345.23052-6-laurent.pinchart+renesas@ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0996303141==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fmhj6g4gxg4ka2nj"
Content-Disposition: inline


--fmhj6g4gxg4ka2nj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Thu, Mar 07, 2019 at 01:23:35AM +0200, Laurent Pinchart wrote:
> The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
> dual-link. In dual-link mode both input ports are used to carry even-
> and odd-numbered pixels separately. Document this in the DT bindings,
> along with the related rules governing port and usage.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/thine,thc63lvd1024.txt         | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> index 37f0c04d5a28..4ff6eb9bbc19 100644
> --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> @@ -28,6 +28,13 @@ Optional video port nodes:
>  - port@1: Second LVDS input port
>  - port@3: Second digital CMOS/TTL parallel output
>
> +The device can operate in single-link mode or dual-link mode. In single-link
> +mode, all pixels are received on port@0, and port@1 shall not contain any
> +endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
> +odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
> +endpoints.

You know, I'm not sure this is helpful, as if we have to go and
describe what the chip supports, a paragraph for dual ouput mode would
be required as well. The bindings already document that the chip
supports single/dual input/output modes, maybe you can just add rules
that prescribes how to populate the endpoints, for both input and
output modes?

> +
> +

You can drop this empty line.

Thanks
   j

>  Example:
>  --------
>
> --
> Regards,
>
> Laurent Pinchart
>

--fmhj6g4gxg4ka2nj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlyCnRUACgkQcjQGjxah
VjwEow/+LflqXWN5RKHsIxOibqt3qnn6ImaFNTUP4lfnovmstG4bvZWHW0gi56Cu
bDFnDHicpDEplvJ68BFY0LGAaIowY/4jnE/tuUt3FwCg/nzrluLt69Dg7wVucaet
HjSm2MhW9DXXscGWKqH3rPtCAX2nLHZJzim5HAWkJ+ImJTYINxJmArYclBLONvFU
b2zLHjYM8QZnqMwP0pNuXgRPuqnTRWBIB23acJ0sMinnQLxkXnMpR2zvN0xU6Pbq
yfDlNaKIWZ1Snz3rjqMlivI7J9/iNSNCYS77S4vqRjLIhfkMtvrogim6fOtTZGYg
1fCofTtneM9uP8kQdjPC7Rfbg/3Udmg/PG1VCjhtxQsPRS/1Xxo5rFp1IkV8vFoq
X5er4gZGsu8dfhBu4ZThKp4OrIE4nMgpVEngytxPrjp3Yf9XinjlW1nhIulOsjCz
TS4gSC5EbfQdb8tW4triqIpj8JeJBbCu84hzJH+23iqRAMm7QefqIAqUt5y87+4X
aOeBBSnyi+IDpdU8KiQSyorsioeIDmokmgAaUDJpwmVLHk8lsbuvIPuUT5bbf07d
BqhrvgD9loWc3GwInfu/TlCfWQ/gq5ZE5gC1ClBxVi+AR3ahtAJ859ykml3bkAtV
o661bRkWEXk+4dAmLjLn6+UA+ZeQS7uLeczePS7/YmCAZ1rBKjI=
=ifmn
-----END PGP SIGNATURE-----

--fmhj6g4gxg4ka2nj--

--===============0996303141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0996303141==--
