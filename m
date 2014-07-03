From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 09/18] AT91: Call at91_register_devices in the board files
Date: Thu, 3 Jul 2014 16:52:22 +0200
Message-ID: <20140703145222.GE31996@lukather>
References: <1404396906-25194-1-git-send-email-maxime.ripard@free-electrons.com>
 <1404396906-25194-15-git-send-email-maxime.ripard@free-electrons.com>
 <D103F102-4B04-4CC6-8F20-58CEB0EC8E36@jcrosoft.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5627525796115524065=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <D103F102-4B04-4CC6-8F20-58CEB0EC8E36@jcrosoft.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: devicetree@vger.kernel.org, dbaryshkov@gmail.com, Nicolas FERRE <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas@free-electrons.com>, Boris Brezillon <boris@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, dwmw2@infradead.org, linux@maxim.org.za, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5627525796115524065==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Content-Disposition: inline


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 03, 2014 at 10:29:58PM +0800, Jean-Christophe PLAGNIOL-VILLARD =
wrote:
> no do this at SoC level

Since it has to be done at init_machine, I don't see any other easy
way to do this at the SoC level.

What is your suggestion?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTtW4mAAoJEBx+YmzsjxAg3MUQAInAlJsAnscIG2n2uUxwpKLL
6YKy9CLZL7wIaWlT3XFspUg6QrWRX9fpjcEkpNlhg7VV+JP0R+ak9sOTpshaerAc
2hmsrFFVoqtKUxwhd0J0B534XyUcSl2FFTRKk+8eLWV13DuKP2yVLkDcVmf+ofAm
y0XP+3549hlfL8TJN2SSN7+tYttJ9zSZ0FJoAl6MHE9wJPes6u1dc0oXiV1KTL0f
eAVw0zGygwQOngF8dRHsA8Fl4rfZ67TVjThYbTuOIa1SLmNs6KsWiwsRof7Ho5Ag
6b2M61DswdcHUJqdZzUOAoqbfZH+Gl8Lkc4+htbmOYGJDIIDaX79Fj+eezEjzIyq
YmUQsuluegXOQwVRniJneCbMOKAEjCtwkJK5uR3B2rgm+enkzT5wsh4WziWMreFs
eeJGYZls2clQObv/XNOKQ462TFk6JXSCPuFDjmFHjMtV+rv7fdIE8Yu3PFmhBM8Y
jR3tAlI5IPWdDEHSK3nSrqOkVd06e0UisfbgsY2YXbxVD2rhVcF6YQ884HiPnrC4
+Fj6QKV+tvnmJqg6IxuYVcKuuFx97wRzGiKhY/KtYGxNMH7wG2yVAPblKfrwqata
St9a7VCA8miQBSU3de/sr9zHNEgtJ7hdVPUkF3nE+NjXbthzMkYMXQZU01HxXvpN
Bn309VsA0afYCn02gtcS
=3Fk1
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--


--===============5627525796115524065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5627525796115524065==--
