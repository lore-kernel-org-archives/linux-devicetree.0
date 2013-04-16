From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] gpio: samsung: Remove OF support for s3c24xx
Date: Tue, 16 Apr 2013 20:13:44 +0200
Message-ID: <201304162013.45134.heiko@sntech.de>
References: <1366134094-23140-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1366134094-23140-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linus.walleij@linaro.org, grant.likely@secretlab.ca, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 16. April 2013, 19:41:34 schrieb Sylwester Nawrocki:
> There is no users of this code and there is already a pinctrl
> driver written for s3c24xx which is going to be used on any
> s3c24xx DT platforms. Hence this has been effectively a dead
> code in mainline.
>=20
> This reverts commit 172c6a13653ac8cd6a231293b87c93821e90c1d6
> gpio: samsung: add devicetree init for s3c24xx arches
>=20
> Cc: Heiko St=C3=BCbner <heiko@sntech.de>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

This patch stems from a time where I thought pinctrl on s3c24xx would b=
e ages=20
away :-D, so

Acked-by: Heiko Stuebner <heiko@sntech.de>
