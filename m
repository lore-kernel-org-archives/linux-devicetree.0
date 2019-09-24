From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: display: imx: add bindings for DCSS
Date: Tue, 24 Sep 2019 13:53:28 -0500
Message-ID: <CAL_JsqK1egTpkqsgVUMUiYzKvVJ=nWtJu+OeujJotRCD9ADsnw@mail.gmail.com>
References: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com> <1569248002-2485-5-git-send-email-laurentiu.palcu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569248002-2485-5-git-send-email-laurentiu.palcu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Lucas Stach <l.stach@pengutronix.de>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2019 at 9:14 AM Laurentiu Palcu <laurentiu.palcu@nxp.com> wrote:
>
> Add bindings for iMX8MQ Display Controller Subsystem.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml      | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml

Fails to build with 'make dt_binding_check':

https://patchwork.ozlabs.org/patch/1166073/
