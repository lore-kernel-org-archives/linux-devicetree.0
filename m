From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx
 bindings
Date: Fri, 9 Aug 2019 17:47:27 +0300
Message-ID: <20190809144727.GF864@valkosipuli.retiisi.org.uk>
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
> > +The Synopsys MIPI D-PHY controller supports MIPI-DPHY in receiver mode.
> > +Please refer to phy-bindings.txt for more information.
> > +
> > +Required properties:
> > +- compatible		: Shall be "snps,dw-dphy-rx".
> > +- #phy-cells		: Must be 1.
> > +- bus-width		: Size of the test interface data bus (8 bits->8 or
> > +			  12bits->12).
> 
> Hmm. This seems like runtime configuration as well.

And it's for the parallel busses.

I'd like to see the bindings that have the other interface described as
well if there are parameters that affect device configuration there.

-- 
Sakari Ailus
