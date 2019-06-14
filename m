From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 01/12] dt-bindings: media: sunxi-ir: add A31 compatible
Date: Fri, 14 Jun 2019 14:18:42 -0600
Message-ID: <20190614201842.GA6768@bogus>
References: <20190528161440.27172-1-peron.clem@gmail.com>
 <20190528161440.27172-2-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190528161440.27172-2-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, 28 May 2019 18:14:29 +0200, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= wrote:
> Allwinner A31 has introduced a new memory mapping and a
> reset line.
> 
> The difference in memory mapping are :
> 
> - In the configure register there is a new sample bit
>   and Allwinner has introduced the active threshold feature.
> 
> - In the status register a new STAT bit is present.
> 
> Note: CGPO and DRQ_EN bits are removed on A31 but present on A13
> and on new SoCs like A64/H6.
> This is actually not an issue as these bits are togglable and new
> SoCs have a dedicated bindings.
> 
> Introduce this bindings to make a difference since this generation.
> And declare the reset line required since A31.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/sunxi-ir.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
