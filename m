MIME-Version: 1.0
Date: Tue, 26 Jun 2018 08:24:01 -0600
References: <1529693129-29817-1-git-send-email-festevam@gmail.com>
	<20180625202109.GA22892@rob-hp-laptop>
	<CAOMZO5AAmC9_2RDu4_omCFLazV2Q083vPkCbH+_gie_jZnMp5A@mail.gmail.com>
In-Reply-To: <CAOMZO5AAmC9_2RDu4_omCFLazV2Q083vPkCbH+_gie_jZnMp5A@mail.gmail.com>
Message-ID: <CAL_JsqKxsY2hc9ezt77uWYNv03AFKH5=+VKkv3BcxzZmp-aNWg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: fsl-imx-sahara: Add i.MX51 as a
 supported SoC
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Fabio Estevam <festevam@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, devicetree@vger.kernel.org, =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jun 25, 2018 at 2:27 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Rob,
>
> On Mon, Jun 25, 2018 at 5:21 PM, Rob Herring <robh@kernel.org> wrote:
>
> > Looks like imx51 should be a fallback and you can drop the driver
> > change.
>
> I thought about that too.
>
> If I do like this in imx51.dtsi:
>
> compatible = "fsl,imx51-sahara", "fsl,imx53-sahara";
>
> Then the driver works just fine.
>
> I was not sure if this was OK or not because imx51 was introduced
> prior than imx53 was launched.
>
> Would it be OK to use: compatible = "fsl,imx51-sahara", "fsl,imx53-sahara"; ?

Yes, but the order should be reversed as it should be most specific
and newest first.

Rob
