From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 4/5] gpio: of: Add support to have multiple gpios in gpio-hog
Date: Thu, 10 Mar 2016 12:16:58 +0100
Message-ID: <2337414.ntEtcfKnX0@hermes>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com> <56E05AA9.8000503@wwwdotorg.org> <56E11D34.60401@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <56E11D34.60401@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thursday 10 March 2016 12:37:32 Laxman Dewangan wrote:
> 
> On Wednesday 09 March 2016 10:47 PM, Stephen Warren wrote:
> > On 03/09/2016 06:20 AM, Laxman Dewangan wrote:
> >>
> >> On Wednesday 09 March 2016 11:58 AM, Markus Pargmann wrote:
> >>> * PGP Signed by an unknown key
> >>>
> >>> Hi,
> >>>
> >>> On Tue, Mar 08, 2016 at 05:32:07PM +0530, Laxman Dewangan wrote:
> >>>> The child node for gpio hogs under gpio controller's node
> >>>> provide the mechanism to automatic GPIO request and
> >>>> configuration as part of the gpio-controller's driver
> >>>> probe function.
> >>>>
> >>>> Currently, property "gpio" takes one gpios for such
> >>>> configuration. Add support to have multiple GPIOs in
> >>>> this property so that multiple GPIOs of gpio-controller
> >>>> can be configured by this mechanism with one child node.
> >>> So if I read this correctly you want to have multiple GPIOs with the
> >>> same line name? Why don't you use multiple child nodes with individual
> >>> line names?
> >>>
> >> There is cases on which particular functional configuration needs sets
> >> of GPIO to set. On this case, making sub node for each GPIOs creates
> >> lots of sub-nodes and  add complexity on readability, usability and
> >> maintainability.
> >> Example: for my board, I wanted to set GPIO H2 to input and H0 and H1 to
> >> be output high.
> >> Instead of three nodes, I can have two here:
> >>         gpio@0,6000d000 {
> >>                 wlan_input {
> >>                         gpio-hog;
> >>                         gpios = <TEGRA_GPIO(H, 2) 0>;
> >>                         input;
> >>                 };
> >>
> >>                 wlan_output {
> >>                         gpio-hog;
> >>                         gpios = <TEGRA_GPIO(H, 0) 0 TEGRA_GPIO(H, 1) 0>;
> >>                         output-high;
> >>                 };
> >>         };
> > >
> >> So here I am grouping the multiple output GPIO together.
> >>
> >> This looks much similar if we have many GPIOs for one type of
> >> configurations.
> >>
> >> Even it looks better if we have something:
> >>         gpio@0,6000d000 {
> >>                 wlan_control {
> >>                         gpio-hog;
> >>                         gpios-input = <TEGRA_GPIO(H, 2) 0>;
> >>                         gpios-output-high = <TEGRA_GPIO(H, 0) 0
> >> TEGRA_GPIO(H, 1) 0>;
> >>                 };
> >>         };
> >
> > The problem with that is the description used when acquiring the GPIO 
> > is just "wlan_input", "wlan_output", or "wlan_control". There's 
> > nothing to indicate what those individual pins do (perhaps one is a 
> > reset signal, one is a regulator enable, etc.?) By requiring separate 
> > nodes for each GPIO, then the node name can provide a meaningful 
> > semantic name/description for each GPIO, which provides much more 
> > information.
> >
> 
> On this case, we have already property "line-name" and passed the name 
> of the gpio via this property.
> The property names is "line-name" which is good for one string. We can 
> support other property "line-names" with multiple string per GPIO index.
> 
> line-names = "wlan-reset", "wlan-enable";

There is currently a discussion about the future bindings for subnodes in GPIO
controller nodes. Please have a look at these two mail threads:

	"Device tree binding documentation for gpio-switch"
	"gpio: of: Add support to have multiple gpios in gpio-hog"

Best Regards,

Markus

> 
> 
> > If the approach in this patch is acceptable though, I think you want 
> > to update the description of "gpios" (in the GPIO hog definition 
> > section) in Documentation/devicetree/bindings/gpio/gpio.txt to mention 
> > that multiple GPIO entries are legal. Right now it says that property 
> > much contain exactly #gpio-cells, not a multiple of #gpio-cells.
> 
> I have 5th patch for this and will rearrange series as you suggested on 
> 5th patch.
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

