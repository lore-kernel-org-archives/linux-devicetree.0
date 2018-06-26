Return-Path: <SRS0=y08W=JM=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKxsY2hc9ezt77uWYNv03AFKH5=+VKkv3BcxzZmp-aNWg@mail.gmail.com>
References: <1529693129-29817-1-git-send-email-festevam@gmail.com>
 <20180625202109.GA22892@rob-hp-laptop> <CAOMZO5AAmC9_2RDu4_omCFLazV2Q083vPkCbH+_gie_jZnMp5A@mail.gmail.com>
 <CAL_JsqKxsY2hc9ezt77uWYNv03AFKH5=+VKkv3BcxzZmp-aNWg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 26 Jun 2018 20:19:28 -0300
Message-ID: <CAOMZO5CNNYVjnWECj+LDC2BAfTgVa2aPjcOzbDwi-Vp89dwF6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: fsl-imx-sahara: Add i.MX51 as a
 supported SoC
Content-Type: text/plain; charset="UTF-8"
To: Rob Herring <robh@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On Tue, Jun 26, 2018 at 11:24 AM, Rob Herring <robh@kernel.org> wrote:

>> Would it be OK to use: compatible = "fsl,imx51-sahara", "fsl,imx53-sahara"; ?
>
> Yes, but the order should be reversed as it should be most specific
> and newest first.

Thanks for the feedback. Just sent a dts patch as you suggested.
