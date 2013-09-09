From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Mon, 9 Sep 2013 11:07:37 +0800
Message-ID: <522D3B79.3060707@freescale.com>
References: <593AEF6C47F46446852B067021A273D6D984000B@MUCSE039.lantiq.com> <20130905020435.GA3970@gmail.com> <20980858CB6D3A4BAE95CA194937D5E73EA0C7F4@DBDE04.ent.ti.com> <522817D7.1010206@freescale.com> <20980858CB6D3A4BAE95CA194937D5E73EA0C885@DBDE04.ent
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130908134725.GQ29403@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Huang Shijie <shijie8@gmail.com>, "Gupta, Pekon" <pekon@ti.com>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

=D3=DA 2013=C4=EA09=D4=C208=C8=D5 21:47, Mark Brown =D0=B4=B5=C0:
> On Thu, Sep 05, 2013 at 10:36:44PM -0400, Huang Shijie wrote:
>> On Thu, Sep 05, 2013 at 02:50:32PM +0100, Mark Brown wrote:
>>> Looking at the current header there just seem to be defines in ther=
e, no
>>> abstraction for the chips.  Perhaps that is what is missing?
>> we do not need any abstraction for this chip, we only need the SPI N=
OR=20
>> commands, such as Quad read / DDR quad read.
> So the abstraction could say what the commands are, or what's support=
ed
thanks.

I have already added the comment for what the commands are, please see
patch 3 & patch 4.
> if they're standard?
In actually, there is no standard for the SPI NOR commands now.

I added these commands just in the Spansion section now.
(Of course, other NOR vendors may also uses the same commands.)

thanks
Huang Shijie




