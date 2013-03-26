From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 0/7] move s3c24xx-irq to drivers/irqchip and add dt support
Date: Tue, 26 Mar 2013 22:12:31 +0000
Message-ID: <201303262212.31283.arnd@arndb.de>
References: <201303262305.49725.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <201303262305.49725.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Thomas Abraham <thomas.abraham@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 26 March 2013, Heiko St=FCbner wrote:
> This v6 addresses more comments from Arnd Bergmann, setting the compa=
tible
> property to the first supported SoC (s3c2410) instead of using the s3=
c24xx
> wildcard. It also switches the parent-irq and controller irq in the d=
t
> irq descriptor bringing it to a format of
>=20
>   <ctrl_num parent_irq ctrl_irq type>

Entire series

Acked-by: Arnd Bergmann <arnd@arndb.de>
