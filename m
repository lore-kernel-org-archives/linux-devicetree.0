From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v6 0/7] move s3c24xx-irq to drivers/irqchip and add dt
 support
Date: Tue, 02 Apr 2013 17:17:00 +0900
Message-ID: <22c901ce2f7a$731fe9f0$595fbdd0$%kim@samsung.com>
References: <201303262305.49725.heiko@sntech.de>
 <201303262212.31283.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <201303262212.31283.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, 'Rob Herring' <rob.herring@calxeda.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Arnd Bergmann wrote:
>=20
> On Tuesday 26 March 2013, Heiko St=FCbner wrote:
> > This v6 addresses more comments from Arnd Bergmann, setting the
> compatible
> > property to the first supported SoC (s3c2410) instead of using the
> s3c24xx
> > wildcard. It also switches the parent-irq and controller irq in the=
 dt
> > irq descriptor bringing it to a format of
> >
> >   <ctrl_num parent_irq ctrl_irq type>
>=20
> Entire series
>=20
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks.

Applied this whole series.

- Kukjin
