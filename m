From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: axp20x: Add fallback for axp805
Date: Mon, 29 Apr 2019 12:40:58 -0500
Message-ID: <20190429174058.GA11425@bogus>
References: <20190409160550.1086-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190409160550.1086-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 09, 2019 at 06:05:50PM +0200, Clément Péron wrote:
> axp805 is actually compatible and used with axp806 as fallback.
> But it's actually undocumented and trig a warning with checkpatch.
> 
> DT compatible string "x-powers,axp805" appears un-documented.
> 
> Add this compatible in the dt-bindings documentation.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Rob
