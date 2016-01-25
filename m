From: Yao Yuan <yao.yuan@nxp.com>
Subject: RE: [PATCH v3 1/4] Documentation: fsl-quadspi: Add fsl,ls2080a-dspi
 compatible string
Date: Mon, 25 Jan 2016 10:55:04 +0000
Message-ID: <AM2PR04MB0722D3252CA3058B3523731889C70@AM2PR04MB0722.eurprd04.prod.outlook.com>
References: <1453360158-34236-1-git-send-email-yao.yuan@freescale.com>
 <20160121231254.GA4356@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160121231254.GA4356@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Yuan Yao <yao.yuan@freescale.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 22, 2016 at 07:13 AM, Rob Herring wrote:
> On Thu, Jan 21, 2016 at 03:09:15PM +0800, Yuan Yao wrote:
> > new compatible string: "fsl,ls2080a-qspi".
> >
> > Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> > ---
> > Changed in v3:
> > Add the modifier for new compatible string like:
> > "fsl,ls2080a-dspi" followed by "fsl,ls2085a-dspi"
> >
> > Changed in v2:
> > Update my email to <yao.yuan@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>

Hi Rob,

Thanks for your review and help.

How about this rest:
[PATCH v3 3/4] dts/ls2080a: update the DTS for QSPI and DSPI support

And I also want to send some patches for SPI driver soon.
But those patches depend on this four dts binging patches.
So I should also send this four patches to the SPI driver maintainers.
And they can refer to review my patch for SPI driver.

Can I also send this "dts/ls2080a: update the DTS for QSPI and DSPI support" patch with your Acked-by?
Or can you give me a ACK for this patch?

Thanks.

Yuan Yao.
