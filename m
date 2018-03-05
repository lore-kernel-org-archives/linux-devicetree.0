Return-Path: <SRS0=PZ0u=F3=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180305222100.29351-2-vz@mleia.com>
References: <20180305222100.29351-1-vz@mleia.com> <20180305222100.29351-2-vz@mleia.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Mar 2018 20:53:22 -0300
Message-ID: <CAOMZO5CwEzL2=gjeopT=iacY5Ly8DYTo+UVvR9xuTMF5Zk-QEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rng: Document Freescale i.MX21 and
 i.MX31 RNGA compatibles
Content-Type: text/plain; charset="UTF-8"
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 5, 2018 at 7:20 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:
> Freescale i.MX21 and i.MX31 SoCs contain a Random Number Generator
> Accelerator module (RNGA), which is replaced by RNGB and RNGC modules
> on later i.MX SoC series, the change adds a new compatible property
> to describe the controller.
>
> Since all versions of Freescale RNG modules are legacy, apparently
> the documentation file has no more potential for further extensions,
> nevertheless generalize it by removing explicit RNGC specifics.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
