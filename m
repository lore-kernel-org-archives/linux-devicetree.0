From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Tue, 30 Apr 2013 14:48:08 +0300
Message-ID: <517FAF78.1010306@ti.com>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <517F7245.2050606@iki.fi> <201304301228.42245.arnd@arndb.de>
 <1547536.Us4pVspuI2@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1866101953312983653=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1547536.Us4pVspuI2@avalon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, Tomasz Figa <tomasz.figa@gmail.com>, Rob Clark <robclark@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-rpi-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1866101953312983653==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="----enig2CRIFEWGKIWTFXMNTKPOF"

------enig2CRIFEWGKIWTFXMNTKPOF
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/30/2013 02:42 PM, Laurent Pinchart wrote:
> On Tuesday 30 April 2013 12:28:42 Arnd Bergmann wrote:
>> On Tuesday 30 April 2013, Tomi Valkeinen wrote:
>>> The bootloader would init the display hardware, the bootfb would give=
 an
>>> early /dev/fb0 for the kernel and userspace, and when the real displa=
y
>>> driver is loaded, the bootfb would be unbound and the real driver wou=
ld
>>> take over.
>=20
> This could be done with a KMS driver as well ;-)

Right, I forgot to mention that. I had it in mind also =3D).

DRM has the same problem as fbdev with multi-arch and lots of display
and panel drivers.

Probably the same bootfb could be used for DRM also. Or do you see any
benefit of having a "bootkms" driver, or such?

 Tomi



------enig2CRIFEWGKIWTFXMNTKPOF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJRf694AAoJEPo9qoy8lh71SxAP/AtK73Kf9PR7DSxO5/a2aaU1
jA+Ow8icBJNu9QVHkYyXy+jhTEMAakD1nYfsNHAE/IBLXkxXMOfFI2cox7bp8K+D
oO0hTfAOvmaQO6OwUE6D1JCC3xzUE6ssiCR9vkliCMrstoNoMXKRU+QzlP1uLNP3
+qjfphlraaoJoZS1Tr7NvvsPg2vqbI36jUiSXa9yPt+BdU+nE5zhFwEENZ6EhKs1
Ggit8JmE/to2nltjfTHGd4OPzLdmV7QwGpQMrvcYWDoARa7hzXDh9oEnc11UCdYB
RFja9eRBKFLPsuXZr/rIMp6iYgg3Hx+HBHxZFp97NSliDWM2hqkEnBmJxyoj8Cmt
QHXX4B9XEUmJqefKn1StR69kf7S/jr7rgT8C5dFdtzOW6dW+OP4CuqgeOVCakG//
OTGD54r1oaG/oBfClZMwLGUHDZQwEqrNwc1vHcvaQrIfUsBuuM7Mr414QJAeMg7Z
xskLZ0lR/AHP2OmLGaGdfKliIHO4ybZQsHzAiEyPWCDzr+SDrYPTWXkY9dmMAYo5
3sVVeV+HxGDBUfiyV3KoXP2YI8oxRWURsi/icp68MnKB+72PL6GWCFgkRfAKtmtk
E/fvf7XrMG3XDjDtXTJDlts9ebWrXfdYrJ1iYIkd1AiPZ6X2LvOqyibxvFkz89Fj
643CtzbRnfS1Yg4BCt2J
=Mozz
-----END PGP SIGNATURE-----

------enig2CRIFEWGKIWTFXMNTKPOF--


--===============1866101953312983653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1866101953312983653==--
