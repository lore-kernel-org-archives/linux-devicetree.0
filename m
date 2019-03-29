From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH 1/4] arm64: dts: imx8mq: Fix the fsl,imx8mq-sdma  compatible string
Date: Fri, 29 Mar 2019 07:09:26 -0700
Message-ID: <bc7d4617cf7f29fa05f823f48b8ba4d6@www.akkea.ca>
References: <20190328133828.20999-1-angus@akkea.ca>
 <20190328133828.20999-2-angus@akkea.ca>
 <AM0PR04MB421112C3EE79B279953A9252805A0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <CAEnQRZCjCAhi2OqpSGN8rmGYCqyOmLP=+=L0djcq2C6ksk29LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEnQRZCjCAhi2OqpSGN8rmGYCqyOmLP=+=L0djcq2C6ksk29LQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-03-29 04:20, Daniel Baluta wrote:
> On Fri, Mar 29, 2019 at 11:11 AM Aisheng Dong <aisheng.dong@nxp.com> 
> wrote:
>> 
>> > From: Angus Ainslie (Purism) [mailto:angus@akkea.ca]
>> > Sent: Thursday, March 28, 2019 9:38 PM
>> >
>> > Fix a typo in the compatible string
>> >
>> > Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
>> > ---
>> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> > b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> > index 81d5ce1b1ec1..07099f82965e 100644
>> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> > @@ -720,7 +720,7 @@
>> >                       };
>> >
>> >                       sdma1: sdma@30bd0000 {
>> > -                             compatible = "fsl, imx8mq-sdma","fsl,imx7d-sdma";
>> > +                             compatible = "fsl,mx8mq-sdma","fsl,imx7d-sdma";
>> 
>> This is a bit strange.
>> If binding doc says like that, probably we'd better fix the typo in 
>> binding doc
>> to use the same style.
> 
> Oh, indeed.
> 
> Angus, shouldn't this be fsl,imx8mq-sdma instead of fsl,mx8mq-sdma. I
> was just paying
> attention to the extra space in my patch.

Correct I took too many characters when I dropped the space. I'll fix it 
for v2.

Angus
