From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] Documentation: fsl-quadspi: Add fsl,ls2080a-dspi
 compatible string
Date: Tue, 12 Jan 2016 16:13:29 -0600
Message-ID: <CAL_Jsq+FVonqh8EbY4FFqHzxGZ_kDWGoC2jKNiGioEV96FXD+w@mail.gmail.com>
References: <1450954863-7540-1-git-send-email-yao.yuan@freescale.com>
 <20151229183501.GH12450@rob-hp-laptop> <AM2PR04MB07228C97A751DA40EEDD231489FD0@AM2PR04MB0722.eurprd04.prod.outlook.com>
 <CAL_Jsq+fsqJkN+5859rLm56Ch1k48LRDsRMP6KFHywnCNyf=kA@mail.gmail.com> <AM2PR04MB07220B81AE758762CB6B13D489CA0@AM2PR04MB0722.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM2PR04MB07220B81AE758762CB6B13D489CA0@AM2PR04MB0722.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yao Yuan <yao.yuan@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 11, 2016 at 10:36 PM, Yao Yuan <yao.yuan@nxp.com> wrote:
> On Thu, Dec 31, 2015 at 10:35PM, Yao Yuan <yao.yuan@nxp.com> wrote:
>> On Wed, Dec 30, 2015 at 11:20 PM, Rob Herring wrote:
>> > On Tue, Dec 29, 2015 at 9:17 PM, Yao Yuan <yao.yuan@nxp.com> wrote:
>> > > Hi Rob,
>> > >
>> > > Thanks for your review.
>> > > So you mean that I should add the commit message for why I add this
>> > > new
>> > compatible?
>> >
>> > Please don't top post on the lists.
>> >
>> > No, the binding doc should explain what are valid combinations of
>> > compatible strings and the order when the dts can have multiple
>> > strings. For example, is this valid:
>> >
>> > compatible = "fsl,vf610-dspi", "fsl,ls2080a-dspi";
>> >
>> > In other words, I should be able to check a dts file against what the
>> > binding doc says.
>> >
>> > Rob
>>
>> OK, I got it.
>> The "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi", "fsl,ls2085a-dspi" is valid and used
>> in driver.
>> But "fsl,ls2080a-dspi" is just used for platform flag.
>> Could you help to give an example that how can I explain it in Documents?
>> Or should I not write this compatible in Document.
>>
>> I find that many compatible strings like this (not valid just a platform flag) for
>> other driver are not record in document.

Well, things sneak in without getting documented. Also, lots of PPC
bindings predate our documentation requirement.

>>
>> Thanks.
>>
>> Yuan Yao
>
> Hi Rob,
> How about like this:
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> index 00c587b..7a9a523 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> @@ -4,6 +4,8 @@ Required properties:
>    - compatible : Should be "fsl,vf610-qspi", "fsl,imx6sx-qspi",
>                  "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
>                  "fsl,ls1021-qspi"
> +       Invalid compatible just for SOC flag:
> +               "fsl,ls2080a-qspi"

This doesn't make sense to me. Typically, we see something like:

Should be one of:
  "vendor,soc1-device"
  "vendor,soc2-device"
Followed by "vendor,soc0-device"

Sometime the last entry is a generic string. Here soc0 is the first
SOC with the block. Later SOCs have "the same" block, but new
compatible strings in addition in case any changes or errata are found
that the driver needs to deal with.

Rob
