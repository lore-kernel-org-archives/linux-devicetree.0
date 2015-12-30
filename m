From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] Documentation: fsl-quadspi: Add fsl,ls2080a-dspi
 compatible string
Date: Wed, 30 Dec 2015 09:19:30 -0600
Message-ID: <CAL_Jsq+fsqJkN+5859rLm56Ch1k48LRDsRMP6KFHywnCNyf=kA@mail.gmail.com>
References: <1450954863-7540-1-git-send-email-yao.yuan@freescale.com>
 <20151229183501.GH12450@rob-hp-laptop> <AM2PR04MB07228C97A751DA40EEDD231489FD0@AM2PR04MB0722.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM2PR04MB07228C97A751DA40EEDD231489FD0@AM2PR04MB0722.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yao Yuan <yao.yuan@nxp.com>
Cc: Yuan Yao <yao.yuan@freescale.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 29, 2015 at 9:17 PM, Yao Yuan <yao.yuan@nxp.com> wrote:
> Hi Rob,
>
> Thanks for your review.
> So you mean that I should add the commit message for why I add this new compatible?

Please don't top post on the lists.

No, the binding doc should explain what are valid combinations of
compatible strings and the order when the dts can have multiple
strings. For example, is this valid:

compatible = "fsl,vf610-dspi", "fsl,ls2080a-dspi";

In other words, I should be able to check a dts file against what the
binding doc says.

Rob

> On Wed, Dec 30, 2015 at 02:35AM, Rob Herring wrote:
>> On Thu, Dec 24, 2015 at 07:01:00PM +0800, Yuan Yao wrote:
>> > new compatible string: "fsl,ls2080a-qspi".
>> >
>> > Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
>> > ---
>> > Changed in v2:
>> > Update my email to <yao.yuan@nxp.com>
>> > ---
>> >  Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
>> b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
>> > index fa77f87..2fe51d6 100644
>> > --- a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
>> > +++ b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
>> > @@ -1,7 +1,8 @@
>> >  ARM Freescale DSPI controller
>> >
>> >  Required properties:
>> > -- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi", "fsl,ls2085a-dspi"
>> > +- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi",
>> > +           "fsl,ls2085a-dspi", "fsl,ls2080a-dspi"
>>
>> You should explain what combinations of compatible strings are valid.
>>
>> Rob
