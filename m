From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Add support for Armadeus ST0700 Adapt
Date: Tue, 17 Jul 2018 09:28:31 -0300
Message-ID: <CAOMZO5Dr0zqy4Sf3s=L4qoqePRhZAXWpDk1oTOUidy4_TUQ=QA@mail.gmail.com>
References: <20180717072318.18730-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717072318.18730-1-sebastien.szymanski@armadeus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi S=C3=A9bastien,

On Tue, Jul 17, 2018 at 4:23 AM, S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:
> This patch adds support for the Armadeus ST0700 Adapt. It comes with a
> Santek ST0700I5Y-RBSLW 7.0" WVGA (800x480) TFT and an adapter board so
> that it can be connected on the TFT header of Armadeus Dev boards.
>
> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com=
>
> ---
>  .../display/panel/armadeus,st0700-adapt.txt        |  9 +++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++=
++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/armad=
eus,st0700-adapt.txt
>
> diff --git a/Documentation/devicetree/bindings/display/panel/armadeus,st0=
700-adapt.txt b/Documentation/devicetree/bindings/display/panel/armadeus,st=
0700-adapt.txt
> new file mode 100644
> index 000000000000..a30d63db3c8f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/armadeus,st0700-ada=
pt.txt
> @@ -0,0 +1,9 @@
> +Armadeus ST0700 Adapt. A Santek ST0700I5Y-RBSLW 7.0" WVGA (800x480) TFT =
with
> +an adapter board.
> +
> +Required properties:
> +- compatible: "armadeus,st0700-adapt"

Shouldn't this be named "santek,st0700i5y" instead?

Santek is the vendor of the panel and st0700i5y is the model.

Then you could add a "santek" entry in
Documentation/devicetree/bindings/vendor-prefixes.txt.

Regards,

Fabio Estevam
