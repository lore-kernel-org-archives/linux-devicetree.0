From: Jason <jason@lakedaemon.net>
Subject: Re: [PULL REQUEST v2] ARM: kirkwood: fdt: convert kirkwood init
 funcs to fdt
Date: Mon, 5 Mar 2012 17:25:36 -0500
Message-ID: <20120305222536.GP5050@titan.lakedaemon.net>
References: <20120305214126.GA18513@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20120305214126.GA18513@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nicolas.pitre@linaro.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 05, 2012 at 10:41:26PM +0100, Andrew Lunn wrote:
> > > If the drivers want to use it, I think it has to be orion_find_tclk for
> > > drivers that are shared between multiple plat-orion platforms.
> > 
> > That's pretty much all of them  :-)
> > 
> > I'll rename it and move it to plat-orion/common.c.  This'll be fun.

This is old, see Nico's reply and my response.

> We have overlapping work going on. My adoption of Mike's generic clk
> framework overlaps a lot with your DT tclk problems. If you introduce
> orion_find_tclk() into all the drivers, we are probably going to rip
> it all out again once my patches go in. Plus we are going to have
> horrible merging conflicts between your code and my code

I'd love to deconflict but I haven't seen your RFC patches, yet.

thx,

Jason.
