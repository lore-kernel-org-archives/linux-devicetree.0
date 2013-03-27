From: Martin Fuzzey <mfuzzey@parkeon.com>
Subject: Re: [PATCH 01/11] staging: drm/imx: Add LDB support
Date: Wed, 27 Mar 2013 12:54:19 +0100
Message-ID: <5152DDEB.9020907@parkeon.com>
References: <1364307246-9017-1-git-send-email-p.zabel@pengutronix.de>
 <1364307246-9017-2-git-send-email-p.zabel@pengutronix.de>
Reply-To: mfuzzey@parkeon.com
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1364307246-9017-2-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, Fabio Estevam <fabio.estevam@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de, Sean Cross <xobs@kosagi.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On 26/03/13 15:13, Philipp Zabel wrote:

> +static void imx_ldb_encoder_disable(struct drm_encoder *encoder)
> +{
> +	struct imx_ldb_channel *imx_ldb_ch =3D enc_to_imx_ldb_ch(encoder);
> +	struct imx_ldb *ldb =3D imx_ldb_ch->ldb;
> +
> +	if (gpio_is_valid(imx_ldb_ch->enable_gpio))
> +		gpio_set_value(imx_ldb_ch->enable_gpio, 0);
>
I get a compile error here:
drivers/staging/imx-drm/imx-ldb.c: In function =91imx_ldb_encoder_disable=
=92:
drivers/staging/imx-drm/imx-ldb.c:283:2: error: implicit declaration of =

function =91gpio_is_valid=92 [-Werror=3Dimplicit-function-declaration]
drivers/staging/imx-drm/imx-ldb.c:283:30: error: =91struct =

imx_ldb_channel=92 has no member named =91enable_gpio=92
drivers/staging/imx-drm/imx-ldb.c:284:3: error: implicit declaration of =

function =91gpio_set_value=92 [-Werror=3Dimplicit-function-declaration]
drivers/staging/imx-drm/imx-ldb.c:284:28: error: =91struct =

imx_ldb_channel=92 has no member named =91enable_gpio=92

Adding #include <linux/gpio.h> fixes that but gives another error:
drivers/staging/imx-drm/imx-ldb.c: In function =91imx_ldb_encoder_disable=
=92:
drivers/staging/imx-drm/imx-ldb.c:284:30: error: =91struct =

imx_ldb_channel=92 has no member named =91enable_gpio=92
drivers/staging/imx-drm/imx-ldb.c:285:28: error: =91struct =

imx_ldb_channel=92 has no member named =91enable_gpio=92

Commenting out the block gives a working driver.

Regards,

Martin
