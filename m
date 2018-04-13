From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: fix the double
 quotes
Date: Fri, 13 Apr 2018 12:18:53 -0500
Message-ID: <20180413171853.5blruiakambnzsgr@rob-hp-laptop>
References: <20180408145700.23520-1-yixun.lan@amlogic.com>
 <20180408145700.23520-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180408145700.23520-2-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 08, 2018 at 02:56:58PM +0000, Yixun Lan wrote:
> The double quotes seems not ASCII type, fix it here.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt  | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
