From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH V2] added device tree support to gpio-generic driver
Date: Thu, 11 Jun 2015 13:40:05 +0200
Message-ID: <20150611114005.GF6325@pengutronix.de>
References: <CACRpkdbWhtkMgz2qTg1y7AguLQCJXnAoi7gVnFvPb1sR7eES_g@mail.gmail.com>
 <1434018735-10176-1-git-send-email-romain.baeriswyl@alitech.com>
 <1434019336.14615543@f356.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1434019336.14615543@f356.i.mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Romain Baeriswyl <romain.baeriswyl@alitech.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Ruppert <christian.ruppert@alitech.com>, Anton Vorontsov <cbouatmailru@gmail.com>, Rojhalat Ibrahim <imr@rtschenk.de>, abdoulaye berthe <berthe.ab@gmail.com>, Anthony Fee <anthony.fee@emutex.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 11, 2015 at 01:42:16PM +0300, Alexander Shiyan wrote:
> Hello.
>=20
> =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3, 11 =D0=B8=D1=8E=D0=BD=D1=8F=
 2015, 12:32 +02:00 =D0=BE=D1=82 Romain Baeriswyl <romain.baeriswyl@ali=
tech.com>:
> > This patch adds support of device tree to the gpio-generic driver.
> >=20
> > Signed-off-by: Romain Baeriswyl <romain.baeriswyl@alitech.com>=20
> > ---
>=20
> The only issue how the direction will be handled in this case?

The bgpio driver uses named resources for the different registers, like
"dat", "set", "clr", "dirout". That of course should be described in th=
e
binding.

Sascha

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
