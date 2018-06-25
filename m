Return-Path: <SRS0=WUQW=JL=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180625202109.GA22892@rob-hp-laptop>
References: <1529693129-29817-1-git-send-email-festevam@gmail.com> <20180625202109.GA22892@rob-hp-laptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 Jun 2018 17:27:51 -0300
Message-ID: <CAOMZO5AAmC9_2RDu4_omCFLazV2Q083vPkCbH+_gie_jZnMp5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: fsl-imx-sahara: Add i.MX51 as a
 supported SoC
Content-Type: text/plain; charset="UTF-8"
To: Rob Herring <robh@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Horia Geanta Neag <horia.geanta@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On Mon, Jun 25, 2018 at 5:21 PM, Rob Herring <robh@kernel.org> wrote:

> Looks like imx51 should be a fallback and you can drop the driver
> change.

I thought about that too.

If I do like this in imx51.dtsi:

compatible = "fsl,imx51-sahara", "fsl,imx53-sahara";

Then the driver works just fine.

I was not sure if this was OK or not because imx51 was introduced
prior than imx53 was launched.

Would it be OK to use: compatible = "fsl,imx51-sahara", "fsl,imx53-sahara"; ?

Thanks
