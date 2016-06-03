From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 1/3] of: add common OF-based component functionality
Date: Fri, 3 Jun 2016 17:11:29 +0100
Message-ID: <20160603161129.GF1041@n2100.armlinux.org.uk>
References: <20160603141548.GC1041@n2100.armlinux.org.uk>
 <E1b8pyR-0005OJ-V3@rmk-PC.armlinux.org.uk>
 <20160603154430.GA21013@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160603154430.GA21013@ulmo.ba.sec>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 03, 2016 at 05:44:30PM +0200, Thierry Reding wrote:
> On Fri, Jun 03, 2016 at 03:21:19PM +0100, Russell King wrote:
> [...]
> > diff --git a/drivers/of/of_component.c b/drivers/of/of_component.c
> [...]
> > +static void component_compare_of(struct device *dev, void *data)
> > +{
> > +	return dev->of_node == data;
> > +}
> 
> The return statement here doesn't match the return value. Didn't GCC
> complain about this?

I didn't build-test it, because I wanted people's opinions on it first
(building means rebuilding my entire tree...)

Anyway, the patch series is dead because I'm not prepared to make the
changes which Rob mentioned, so we're back to v1 instead.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
