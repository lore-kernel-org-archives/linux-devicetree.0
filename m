From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx
 bindings
Date: Fri, 9 Aug 2019 17:45:25 +0300
Message-ID: <20190809144525.GE864@valkosipuli.retiisi.org.uk>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
 <20190809144252.GD864@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809144252.GD864@valkosipuli.retiisi.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Oliveira <Luis.Oliveira@synopsys.com>
Cc: mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com, robh@kernel.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Joao.Pinto@synopsys.com
List-Id: devicetree@vger.kernel.org

On Fri, Aug 09, 2019 at 05:42:52PM +0300, Sakari Ailus wrote:
> Hi Luis,
> 
> On Tue, Jun 11, 2019 at 09:20:53PM +0200, Luis Oliveira wrote:
> > Add device-tree bindings documentation for SNPS DesignWare MIPI D-PHY in
> > RX mode.
> > 
> > Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
> > ---
> > Changelog
> > v3-v4
> > - @Laurent I know I told you I could remove the snps,dphy-frequency on V3 but
> >   it is really useful for me here. I removed all other the proprietary
> >   properties except this one. Do you still think it must be removed?
> 
> Yes. DT is the wrong place for runtime configuration. You get that
> information using the V4L2_CID_LINK_FREQ control on the upstream
> sub-device.

And the PHY driver itself gets that in its configuration (struct
phy_configure_opts_mipi_dphy through the configure op).

-- 
Sakari Ailus
