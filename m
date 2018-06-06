Return-Path: <SRS0=dCaT=IY=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
In-Reply-To: <3be11aeea9cd0399837acb201f6226d9@agner.ch>
References: <1527948122-32092-1-git-send-email-festevam@gmail.com> <3be11aeea9cd0399837acb201f6226d9@agner.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 6 Jun 2018 18:56:26 -0300
Message-ID: <CAOMZO5DOBg+f4Lvh2KoMBjHDnenFh09Sy5HDWfA1Qb5Lit2mng@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clock: imx6ul: Do not change the clock
 definition order
Content-Type: text/plain; charset="UTF-8"
To: Stefan Agner <stefan@agner.ch>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Yongcai Huang <anson.huang@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi Stefan,

On Wed, Jun 6, 2018 at 1:27 PM, Stefan Agner <stefan@agner.ch> wrote:

>> +#define IMX6ULL_CLK_ESAI_SEL         236
>
> Nit: Add an empty line here?

The lack of an empty line is on purpose because I wanted to avoid
someone thinking:
"Oh, there is hole here, let me fill it with new clocks here" :-)

> Reviewed-by: Stefan Agner <stefan@agner.ch>

Thanks for reviewing!
