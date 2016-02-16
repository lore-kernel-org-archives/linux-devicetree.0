From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] spi/rockchip: Add dt-binding for Rockchip rk3399 spi
Date: Tue, 16 Feb 2016 15:37:02 +0100
Message-ID: <1730751.NYv1NxJVuB@phil>
References: <1455614538-4415-1-git-send-email-jay.xu@rock-chips.com> <20160216132223.GM18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160216132223.GM18327@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "jianqun.xu" <jay.xu@rock-chips.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, jwerner@chromium.org, huangtao@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 16. Februar 2016, 13:22:23 schrieb Mark Brown:
> On Tue, Feb 16, 2016 at 05:22:18PM +0800, jianqun.xu wrote:
> >  Documentation/devicetree/bindings/spi/spi-rockchip.txt | 1 +
> >  1 file changed, 1 insertion(+)
> 
> I'd expect this to be added to both the driver and the binding document
> not just the document.

It seems the driver can still use the rk3066-variant - aka nobody has found 
specific issues in the rk3399 IP implementation.

Having the more specific IP names already in the dts before actually using 
them was suggested by devicetree people to not have to exchange everything 
once specific issues were found. 

So right now it's using the fallback-mechanism of binding to the rk3066 
name, but if some obstacle appears it will only take adding the binding in 
the driver to make it work (even with old devicetrees).
