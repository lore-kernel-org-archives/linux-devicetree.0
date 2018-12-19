From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: New binding for
 Meson-G12A SoC
Date: Wed, 19 Dec 2018 08:21:59 -0600
Message-ID: <20181219142159.GA3700@bogus>
References: <20181203061324.36248-1-xingyu.chen@amlogic.com>
 <20181203061324.36248-2-xingyu.chen@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203061324.36248-2-xingyu.chen@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 3 Dec 2018 14:13:23 +0800, Xingyu Chen wrote:
> Update the dt-binding document to support new compatible string for the
> GPIO interrupt controller which found in Amlogic's Meson-G12A SoC.
> 
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt    | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
