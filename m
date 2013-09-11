From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 5/8] spi: Add Freescale QuadSpi driver
Date: Wed, 11 Sep 2013 10:40:51 +0800
Message-ID: <522FD833.2060801@freescale.com>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com> <1377828449-18912-6-git-send-email-b32955@freescale.com> <20130910180923.GC29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130910180923.GC29403@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: dwmw2@infradead.org, dedekind1@gmail.com, computersforpeace@gmail.com, shawn.guo@linaro.org, kernel@pengutronix.de, b18965@freescale.com, b44548@freescale.com, lznuaa@gmail.com, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

=D3=DA 2013=C4=EA09=D4=C211=C8=D5 02:09, Mark Brown =D0=B4=B5=C0:
> On Fri, Aug 30, 2013 at 10:07:26AM +0800, Huang Shijie wrote:
>> (0) What is the Quadspi controller?
>>
>>     The Quadspi(Quad Serial Peripheral Interface) acts as an interfa=
ce to
>>     one single or two external serial flash devices, each with up to=
 4
>>     bidirectional data lines.
> For review and merge it would be much easier to send a patch which
> implements just the basic SPI support for this device then add the
> support for quad mode separately.
okay. I can remove the quad-read support in next version.

thanks
Huang Shijie

