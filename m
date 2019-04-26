From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/8] dt-bindings: gpu: mali-midgard: Add bus clock
 bindings
Date: Fri, 26 Apr 2019 17:52:02 -0500
Message-ID: <20190426225202.GA12379@bogus>
References: <20190417173031.9920-1-peron.clem@gmail.com>
 <20190417173031.9920-3-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417173031.9920-3-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2019 at 07:30:25PM +0200, Clément Péron wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> Some SoCs adds a bus clock gate to the Mali Midgard GPU.
> 
> Add the binding for the bus clock.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

The panfrost driver is merged now (to drm-misc) if you want to add 
support for the 2nd clock.

Reviewed-by: Rob Herring <robh@kernel.org>
