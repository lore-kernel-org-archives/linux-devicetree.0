From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5] mtd: m25p80: Make fast read configurable via DT
Date: Fri, 21 Sep 2012 16:19:10 +0300
Message-ID: <1348233550.7550.2.camel@sauron.fi.intel.com>
References: <1345923416-9293-1-git-send-email-marex@denx.de>
 <201209171610.28410.marex@denx.de>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1767882004379537005=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201209171610.28410.marex-ynQEQJNshbs@public.gmane.org>
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
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <david.woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1767882004379537005==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-OnCi+bgaJ2bV0OXmkNoX"


--=-OnCi+bgaJ2bV0OXmkNoX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-17 at 16:10 +0200, Marek Vasut wrote:
> Bump, do you think we can get this into 3.7 please?

Aiaiai!

---------------------------------------------------------------------------=
-----

Successfully built configuration "i386_defconfig,i386,", results:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/devices/m25p80.c: In function =E2=80=98m25p_probe=E2=80=99:
+drivers/mtd/devices/m25p80.c:808:23: warning: unused variable =E2=80=98np=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----


--=20
Best Regards,
Artem Bityutskiy

--=-OnCi+bgaJ2bV0OXmkNoX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXGlOAAoJECmIfjd9wqK0QYUQAIHqypvKSsHsUOvX9KrsNFe0
RktQndeAEJNh/zFGUOfPAJEtBxIQ+vKwDUWBMuAIR0RQM8ip7vFTiTjJL7veAnnq
suKMQAH52dWloE3rHsC2aQ4BZlEsl+r1hoLekcOUNpw7NMyCuMdQh6syGiNzIGYE
Fl1BExyvzAs7639ju662P1vlez6SS6IFTA17th1Mo3FLLBasIqV7HJEMEQ+tig3k
KMHLO5rWtXQ+mmUOoq4TUPYUOst2SeqjoRkZ2PZJrkoDayz7Wz+/6YxzfbcVwBt0
3XqilAQvV9bSXK0WHGpZ5zClkhjurbx+94c5YoR0zyqVhBxKclWD3evlq0iqHEBj
pi8SQovC8cm1nuxkxHN4TFcugTX9akugktkfttqYbEjG7wHgETAuC0BxcOuxZN8R
Qw6ZXaR08A8JH/rx13liaumRitxEG/SnZXdwnZ+7QT49zhumOnTjeDKsVmcoTGV9
bzT6/0HajWMpCBPLzd21V3LQx5y+L59iIjCawzjhNMvL9r5yralf9C6j6XkDFfJM
PeJ1l6zcrWozS24RMld9A+XY2wsBc2Bqq4UIp4zzzzNbgdl2kn5YOhy2M5RoWAFv
TW+k3lqL0pcru5zIll/MwJ+8TLbaT8sA6pKh4cMvTeWMPINRblWrMJovI96tSYfp
EMBk9vcPT/7eNzzZgBL1
=csaK
-----END PGP SIGNATURE-----

--=-OnCi+bgaJ2bV0OXmkNoX--


--===============1767882004379537005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1767882004379537005==--
