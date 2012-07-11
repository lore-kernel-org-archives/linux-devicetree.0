From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3] PWM: add lpc32xx PWM support
Date: Wed, 11 Jul 2012 07:27:19 +0200
Message-ID: <20120711052719.GA10344@avionic-0098.mockup.avionic-design.de>
References: <1341931090-18296-1-git-send-email-aletes.xgr@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4121801046797067903=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1341931090-18296-1-git-send-email-aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Alexandre Pereira da Silva <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============4121801046797067903==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 11:38:10AM -0300, Alexandre Pereira da Silva wrote:
> Add lpc32xx SOC PWM driver.
>=20
> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes since v2:
> * Update commit message
> * Change the driver to handle the two PWM's of the SOC
> * Disable clock on removal
>=20
> Changes since v1:
> * Style fixes
> * Better error handling
> * Improved Kconfig and DT descriptions
>=20
>  .../devicetree/bindings/pwm/lpc32xx-pwm.txt        |   12 ++
>  drivers/pwm/Kconfig                                |   10 ++
>  drivers/pwm/Makefile                               |    1 +
>  drivers/pwm/pwm-lpc32xx.c                          |  148 ++++++++++++++=
++++++
>  4 files changed, 171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
>  create mode 100644 drivers/pwm/pwm-lpc32xx.c

Applied, thanks.

Thierry

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP/Q63AAoJEN0jrNd/PrOhRC8QAJpVGcaSWhdCdnzwhgRivSRN
PXCgz4IJjSjsk1VTxgYUzvdCLTFIBU2m9h4NG7WHmkGqoC8b51bz+cY6bwl34uNl
ZTvl/ONOj/6IJc/bFGjRUKxG831BENcg73pYJTIvZAsXTWWfIzVbZlj3pWMxPLIB
24gBOEijdPxopw2Ue7qpwwnpZlG1pgsJnqtXniudiN9Z+XMVdddl0KuCU1AfzQvS
e0T5PtASHkFAUNpU45/IB+YVlM94SDvWNO/I1slRHKW8J1RQOFFSlhfmCl6Op5i8
h9MErco5XG67g2favVnbGRxsSMHrj48rLtf0mhdQJlMLDbLWcTQ07/PHXxhUlY/G
wPteUtbyAdVaOPX+3n6M8H6xCp/F4bLVUMdTLMoHoV3aD6UuD3cjeVpiVYykU2OH
8LOVYm2DK/Xi+40JO0CZCSId+fixeaw3BBMobJyjchONXrbns5LOuSPhBXhKMxeB
8kckuMM0FoIJgNPu2DPNvuh6QbJuDIMIlEDqHAC8benyuJec44ptGIMLpJ4plHUX
DgbaaZpbwnNzTP5zRlGOj8S03tY+z5Olm5Rroy78/nGrumj9I735xUledEzbTYdw
JFFmi+o6PhBe374skXDv55LUBgTTBlC9syFVVEZKJPrhfLbujn86OQ03lO+QagtK
LUPuW2WezNDddna23Ue1
=endm
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

--===============4121801046797067903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4121801046797067903==--
