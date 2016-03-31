From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] doc: dt: mtd: add a DT property to enable the use
 of 4byte-address op codes
Date: Thu, 31 Mar 2016 09:19:49 -0500
Message-ID: <20160331141949.GA20345@rob-hp-laptop>
References: <cover.1459251929.git.cyrille.pitchen@atmel.com>
 <320899457d15b85eb0b71edd566cae035d7e1f55.1459251929.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <320899457d15b85eb0b71edd566cae035d7e1f55.1459251929.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org, nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, marex@denx.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 29, 2016 at 02:24:13PM +0200, Cyrille Pitchen wrote:
> This patch adds a new optional DT property which enables an alternative
> way of supporting memory size above 16MiB (128Mib). This new mechanism
> translates the regular 3byte-address op codes into their 4byte-address
> version whereas the old/default mecanism makes the SPI memory enter its
> 4byte-address mode, which has annoying side effects for early bootloaders.
> 
> We cannot discover at run time whether the SPI NOR memory supports the
> 4byte-address op codes. For instance both Macronix MX25L25635E and
> MX25L25673G share the same JEDEC ID (C22019 without any extension byte).
> However the first one doesn't support 4byte-address op codes whereas the
> second one does.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
