From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: vendor-prefixes: Add Admatec AG
Date: Fri, 26 Jul 2019 12:02:25 +0200
Message-ID: <CAJKOXPdbBXEy0zzjZ1ytts0y5STQ5x9xQVBmU1vn46tmu8uCGg@mail.gmail.com>
References: <20190726061705.14764-1-krzk@kernel.org> <963ba555-dde0-9c3c-1e15-740ca200853f@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <963ba555-dde0-9c3c-1e15-740ca200853f@kontron.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 26 Jul 2019 at 11:48, Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> On 26.07.19 08:17, Krzysztof Kozlowski wrote:
> > Add vendor prefix for Admatec AG.
>
> We get the displays used with the Kontron eval kits from "admatec GmbH"
> in Hamburg, not "Admatec AG" in Switzerland. I think we have to
> differentiate here.
>
> I will review patch 2/2 soon...

What a coincidence... they have so similar portfolio. After looking at
vendor prefixes that would be the first duplication of name.

To avoid conflict, how about: "admatecde"?

Best regards,
Krzysztof
