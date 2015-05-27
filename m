From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/6] xhci: probe phy before add usb_hcd
Date: Wed, 27 May 2015 07:18:43 -0500
Message-ID: <20150527121843.GA8611@saruman.tx.rr.com>
References: <1432727283-20303-1-git-send-email-chunfeng.yun@mediatek.com>
 <1432727283-20303-4-git-send-email-chunfeng.yun@mediatek.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7430766310324523213=="
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1432727283-20303-4-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============7430766310324523213==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2015 at 07:48:00PM +0800, chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>=20
> find the phy driver before add primary usb_hcd to avoid acessing
> xHCI register which may hangup the system when the phy is not loaded
> yet and the related powers or clocks put in phy driver are not
> enabled.

it seems like the same clock is needed by PHY and XHCI. This patch looks
incorrect.

--=20
balbi

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVZbYjAAoJEIaOsuA1yqREXjIP/1p5nENHZlvgoTPp0O+fC3Db
h42j1q1S1cC3A12PYIrYwhGRTaipP2hXaE+S8TE1dO/Nn0iFzWUt54AKaSj0NaTm
gCYlnPwkNR25/uX+SvpA9bzL/jsWvTKn+j0/HbH1f/I2KEnOBJOj4Bn4EN+2Emtf
/rlH49SM6yt9vHhPYCGSa1/lfw9FAGC5ZcPnmV96dAAghshE9t5l5e5Nd3A6JYh1
hzbqhSO/GzzLOn0P5NO2En7O1xNcJ4i8ut5aTtHwt3wU2+OA93sOksJbnaijoPfc
ijrsebg/o+HHG2XcUTzB7TgYH/vWQmSkdP1tXGr2zuycILAFfMNz2uTRVTIM5Mod
t+obvfKQYnsQKsuJ/P/QAaSBHAJNHaZ+Iu2+yD5JM5pGOTSlojDH7H/2KKhpY7Wk
RpxQZU/1HFthfd1QTDcYJAS05tPs0RJNGZJ9A5orMpg1ShSfzHo9LiIrJF8WaSSl
sUa4xgz19Htbmw4InAROfpXPNgdUElV/IGUQAipTGTj7sBM7B8Kpu8jbS1QO+mtM
da7/xiwpCufDUJ6w2ZnrjJP2KDQRTr7YVlkaEbCHGlPD/6sMje0FHqUYdxQesSpM
g1fvqmFLCj3aglL1JyBOODUrYcv5uhj+EcW4NDhkaN4ZamMyTttH9Q8g6WLAgj5x
X2dtZ684V1ce6ZtQdZsa
=iAQw
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--


--===============7430766310324523213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7430766310324523213==--
