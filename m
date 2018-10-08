From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 06/36] dt-bindings: arm: zte: Move sysctrl bindings to
 their own doc
Date: Mon, 8 Oct 2018 14:30:09 +0800
Message-ID: <20181008063007.GL3587@dragon>
References: <20181005165848.3474-1-robh@kernel.org>
 <20181005165848.3474-7-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181005165848.3474-7-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <glikely@secretlab.ca>, Kumar Gala <kumar.gala@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Tom Rini <trini@konsulko.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jonathan Cameron <jic23@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jun Nie <jun.nie@linaro.org>, Baoyou Xie <baoyou.xie@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 05, 2018 at 11:58:18AM -0500, Rob Herring wrote:
> In preparation to convert board-level bindings to json-schema, move
> various misc SoC bindings out to their own file.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Baoyou Xie <baoyou.xie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/zte-sysctrl.txt   | 30 +++++++++++++++++++

zte,sysctrl.txt to be consistent with other files like
fsl,layerscape-dcfg.txt?  I'm fine with either way, but just want to
see more consistent naming convention?  Other than that,

Acked-by: Shawn Guo <shawnguo@kernel.org>
