From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: SPEAr600: Add device-tree support to SPEAr600 boards
Date: Thu, 22 Mar 2012 14:20:09 +0000
Message-ID: <201203221420.10127.arnd@arndb.de>
References: <1331650032-15274-1-git-send-email-sr@denx.de>
 <201203211236.37891.arnd@arndb.de>
 <CAOh2x=k6ZfamB8DnPgVPjxZ7E1gTuHOQYg6s1Nd1ybA+TSquWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOh2x=k6ZfamB8DnPgVPjxZ7E1gTuHOQYg6s1Nd1ybA+TSquWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: viresh kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 22 March 2012, viresh kumar wrote:
> On Mar 21, 2012 6:09 PM, "Arnd Bergmann" <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > Regarding the spear3xx patches, I'm looking forward to your patches.
> > I think spear is simple and clean enough that it can serve as an example
> > for others doing DT conversion.
> 
> I was doing DT stuff for 3xx and have a doubt
> regarding DT. How are boards identified at runtime now? Earlier we had
> machine_is_*() to do that.

The direct replacement is of_machine_is_compatible(), but there are a lot
of cases where it's better to have a local property in the device node
that a driver is using.

For instance, in case of your clock driver, I would suggest you use
the "compatible" property of the clock device node, and do

/* null terminated array, turn the lookups into null termination as well */
struct of_device_id spear_clock_match = {
	{ "st,spear300-clock", &spear300_clk_lookups },
	{ "st,spear310-clock", &spear310_clk_lookups },
	{ "st,spear320-clock", &spear320_clk_lookups },
	{ },
};

void __init spear3xx_of_clk_init(void)
{
	struct device_node *np;
	struct of_device_id *match;
	struct clk_lookup *lookup;

	for_each_matching_node(np, &spear_clock_match)
		match = of_match_node(&spear_clock_match, np);

	for (lookup = match->data; lookup->clk; lookup++)
		clk_register(lookup);

	for (lookup = spear_clk_lookups; lookup->clk; lookup++)
		clk_register(lookup);
}

> Also why are both DT_MACHINE_START and MACHINE_START present on some SoC's?

This is for the transition phase where you want to be able to boot both
using ATAG and using DT.

	Arnd
