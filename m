From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM: dts: sunxi: h3-h5: Add Bananapi M2+ v1.2 device
 trees
Date: Thu, 27 Sep 2018 19:28:37 +0200
Message-ID: <20180927172837.ucxmqfhazt4xwfh2@flea>
References: <20180926132339.24737-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180926132339.24737-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 26, 2018 at 09:23:39PM +0800, Chen-Yu Tsai wrote:
> Bananapi released an updated revision of the H3/H5 based Bananapi M2+.
> Version 1.2 enables voltage control for the CPU's regulator by using
> a GPIO line to toggle a MOSFET that can change the effective resistance
> value in the regulator's feedback network.
> 
> This patch adds a common .dtsi file for this new revision, which
> includes the original common sunxi-bananapi-m2-plus.dtsi file, and
> adds the GPIO-controlled regulator and a cpu-supply reference. H3
> and H5 variant dts files are added as well.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
