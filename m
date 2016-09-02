From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [v10,2/2] PCI: Rockchip: Add Rockchip PCIe controller support
Date: Fri, 02 Sep 2016 18:28:29 +0200
Message-ID: <2006737.sL15e15fY3@diego>
References: <1471570498-3284-1-git-send-email-shawn.lin@rock-chips.com>
 <20160901174852.GC9471@localhost> <20160902154409.GA8370@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160902154409.GA8370@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 2. September 2016, 10:44:09 schrieb Bjorn Helgaas:
> On Thu, Sep 01, 2016 at 12:48:52PM -0500, Bjorn Helgaas wrote:
> > On Thu, Sep 01, 2016 at 10:14:01AM -0700, Brian Norris wrote:
> > > The use of HIWORD_UPDATE can indeed be a bit confusing, IMO, but this is
> > > really a common Rockchip-ism that, once you read several of their
> > > drivers, can make a little more sense. If you grep around, it's in at
> > > least their clock, ethernet, SDHCI, PHY, and DP/DRM drivers. I might
> > > defer to Heiko (upstream maintainer of Rockchip code) for a decision.
> > > Maybe there's some intermediate ground where we keep the HIWORK_UPDATE()
> > > logic (it does make sure we get the 16-bit shift right, I think) while
> > > still refactoring a few other bits (like PCIE_CLIENT_CONF_LANE_NUM() and
> > > PCIE_CLIENT_GEN_SEL() for wrapping HIWORK_UPDATE()?).
> 
> Here's a second proposal.  It retains HIWORD_UPDATE (though the structure
> is different) so grep finds it along with the other Rockchip ones.
> 
> I'll post updated actual patches; this is just to give the idea:
> 
> -/*
> -  * The higher 16-bit of this register is used for write protection
> -  * only if BIT(x + 16) set to 1 the BIT(x) can be written.
> -  */
> -#define HIWORD_UPDATE(val, mask, shift) \
> -	((val) << (shift) | (mask) << ((shift) + 16))
> 
> -#define PCIE_CLIENT_CONF_ENABLE			BIT(0)
> -#define PCIE_CLIENT_CONF_ENABLE_SHIFT		0
> -#define PCIE_CLIENT_CONF_ENABLE_MASK		0x1
> -#define PCIE_CLIENT_LINK_TRAIN_ENABLE		1
> -#define PCIE_CLIENT_LINK_TRAIN_SHIFT		1
> -#define PCIE_CLIENT_LINK_TRAIN_MASK		0x1
> -#define PCIE_CLIENT_ARI_ENABLE			BIT(0)
> -#define PCIE_CLIENT_ARI_ENABLE_SHIFT		3
> -#define PCIE_CLIENT_ARI_ENABLE_MASK		0x1
> -#define PCIE_CLIENT_CONF_LANE_NUM(x)		(x / 2)
> -#define PCIE_CLIENT_CONF_LANE_NUM_SHIFT		4
> -#define PCIE_CLIENT_CONF_LANE_NUM_MASK		0x3
> -#define PCIE_CLIENT_MODE_RC			BIT(0)
> -#define PCIE_CLIENT_MODE_SHIFT			6
> -#define PCIE_CLIENT_MODE_MASK			0x1
> -#define PCIE_CLIENT_GEN_SEL_2			1
> -#define PCIE_CLIENT_GEN_SEL_SHIFT		7
> -#define PCIE_CLIENT_GEN_SEL_MASK		0x1
> 
> +/*
> + * The upper 16 bits of the PCIE_CLIENT registers are a write mask for the
> + * lower 16 bits.  This allows atomic updates of the register without
> + * locking.
> + */
> +#define HIWORD_UPDATE(mask, val)	((mask << 16) | val)
> +
> +#define ENCODE_LANES(x)			(((x >> 1) & 3) << 4)
> +
> +#define PCIE_CLIENT_CONF_ENABLE		HIWORD_UPDATE(0x0001, 0x0001)
> +#define PCIE_CLIENT_LINK_TRAIN_ENABLE	HIWORD_UPDATE(0x0002, 0x0002)
> +#define PCIE_CLIENT_CONF_LANE_NUM(x)	HIWORD_UPDATE(0x0030, ENCODE_LANES(x))
> +#define PCIE_CLIENT_GEN_SEL_2		HIWORD_UPDATE(0x0040, 0x0040)
> 
>  	rockchip_pcie_write(rockchip,
> -		   HIWORD_UPDATE(PCIE_CLIENT_CONF_ENABLE,
> -				 PCIE_CLIENT_CONF_ENABLE_MASK,
> -				 PCIE_CLIENT_CONF_ENABLE_SHIFT) |
> -		   HIWORD_UPDATE(PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes),
> -				 PCIE_CLIENT_CONF_LANE_NUM_MASK,
> -				 PCIE_CLIENT_CONF_LANE_NUM_SHIFT) |
> -		   HIWORD_UPDATE(PCIE_CLIENT_MODE_RC,
> -				 PCIE_CLIENT_MODE_MASK,
> -				 PCIE_CLIENT_MODE_SHIFT) |
> -		   HIWORD_UPDATE(PCIE_CLIENT_ARI_ENABLE,
> -				 PCIE_CLIENT_ARI_ENABLE_MASK,
> -				 PCIE_CLIENT_ARI_ENABLE_SHIFT) |
> -		   HIWORD_UPDATE(PCIE_CLIENT_GEN_SEL_2,
> -				 PCIE_CLIENT_GEN_SEL_MASK,
> -				 PCIE_CLIENT_GEN_SEL_SHIFT),
> -		   PCIE_CLIENT_BASE);
> +			    PCIE_CLIENT_CONF_ENABLE |
> +			    PCIE_CLIENT_LINK_TRAIN_ENABLE |
> +			    PCIE_CLIENT_ARI_ENABLE |
> +			    PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes) |
> +			    PCIE_CLIENT_MODE_RC |
> +			    PCIE_CLIENT_GEN_SEL_2,
> +				PCIE_CLIENT_BASE);

I like this new approach :-)
Improves the readability in the code but also future readability of the defined 
constants, when comparing with register descriptions


Thanks
Heiko
