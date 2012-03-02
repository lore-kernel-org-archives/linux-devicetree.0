From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/4] ARM: kirkwood: convert orion-wdt to fdt.
Date: Fri, 2 Mar 2012 16:48:51 +0000
Message-ID: <201203021648.52523.arnd@arndb.de>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <201203021456.47896.arnd@arndb.de>
 <20120302153614.GG11986@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120302153614.GG11986@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason <jason@lakedaemon.net>, mturquette@linaro.org
Cc: grant.likely@secretlab.ca, Andrew Lunn <andrew@lunn.ch>, devicetree-discuss@lists.ozlabs.org, Simon Guinot <simon@sequanux.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 02 March 2012, Jason wrote:
> > 
> > That would make wdt@fed20300/clock-frequency a phandle pointing to the
> > root property, which is not what we want here.
> 
> The 200000000 value is not the actual value used in most drivers [1],
> but rather the speed of the system clock [2] (hence, my inclination to
> make it a root property), the drivers have been pulling this number from
> a global variable [3] and dividing/rounding it as needed for their own needs
> [1].

Ah, I see. If you put a "clock-frequency" property into a device node,
it should definitely be the frequency used by that device, not the system
clock that it is derived from.

> Since it's derived from the SoC core [2], it would seem to make sense to
> have a root "clock-frequency" in the board dts.  Am I missing something?
> Is there a better way to do this?

The correct solution would be to use the clock binding, but I'm not sure
how far we are in making that final or usable.

> > > In any case, the simplest answer is to set clock-frequency in
> > > kirkwood-dreamplug.dts as a root node property, and then each driver
> > > that needs tclk, requests the clock-frequency from the root node.
> > > Hopefully, Grant can chime in on this one.
> > 
> > I think you can just pick a reasonable default value for
> > wdt@fed20300/clock-frequency, and let the board override that
> > by setting it to something else if necessary.
> 
> True, for now, I can just set clock-frequency for each device to the
> exact same value and we'll polish later once we have a better idea of
> the pattern it's following.
> 
> > I suppose this will also change a bit when kirkwood gets moved over to
> > generic clk support in the future and starts using the clk binding
> > instead of what you do now.
> 
> Yes, I don't want to over-think it, but I would like to make sure it's
> in the correct place, since it is a global property of the board.

Andrew Lunn said that he has a patch for plat-orion to use the generic
clock framework. I think we should look at that before introducing
a hack that will have to be removed again very soon.

Kirkwood/orion is probably not a bad platform to add to the initial
set of platforms for which we use the common clk infrastructure,
so maybe the best way forward for you is to take Andrews patches
and build on top of that. It might mean that your follow-on patches
get delayed until v3.5 instead of going into v3.4, but the initial
code you have in arm-soc is working already and you can work on
getting it the clock code right in the initial code.

	Arnd
