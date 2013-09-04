From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Wed, 4 Sep 2013 18:29:34 +0800
Message-ID: <52270B8E.5080402@freescale.com>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com> <522697E9.1050208@freescale.com> <20130904095523.GT3084@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130904095523.GT3084@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: dwmw2@infradead.org, dedekind1@gmail.com, computersforpeace@gmail.com, shawn.guo@linaro.org, kernel@pengutronix.de, b18965@freescale.com, b44548@freescale.com, lznuaa@gmail.com, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

=D3=DA 2013=C4=EA09=D4=C204=C8=D5 17:55, Mark Brown =D0=B4=B5=C0:
> On Wed, Sep 04, 2013 at 10:16:09AM +0800, Huang Shijie wrote:
>
>> Since this quadspi driver depends on the mtd code, could this driver
>> goes to the kernel by
>> the l2-mtd tree?
> Why would a SPI driver depend on MTD?
The patch 1-4 are for m25p80.c, and this quadspi controller drivers
depends on the
patch 1-4.



thanks
Huang Shijie

