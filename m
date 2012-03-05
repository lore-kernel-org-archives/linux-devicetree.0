From: Jason <jason@lakedaemon.net>
Subject: Re: [GIT PULL v3] ARM: kirkwood: fdt: convert kirkwood init funcs
 to fdt
Date: Mon, 5 Mar 2012 08:32:42 -0500
Message-ID: <20120305133242.GD5050@titan.lakedaemon.net>
References: <20120305034113.GB5050@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20120305034113.GB5050@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, michael@walle.cc, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 04, 2012 at 10:41:13PM -0500, Jason Cooper wrote:
> 	rtc-mv: more accurate compatible strings
> 	orion-wdt: more accurate compatible strings
...
>  arch/arm/boot/dts/kirkwood-dreamplug.dts |   34 +++++++++++++++
>  arch/arm/boot/dts/kirkwood.dtsi          |   12 +++++

This is still bugging me.  If, say, orion_wdt.c is common to all of
plat-orion/ shouldn't it be in an 'orion.dtsi'?  With compatible =
"marvell,orion-wdt"?  Then, if hypothetically, kirkwood used the same
driver but had a small tweak, then kirkwood.dtsi would have
"marvell,kirkwood-wdt"?  Which would let the driver know that it needed
to apply the tweak because it was kirkwood.

In this scenario, since kirkwood and dreamplug currently need no
modifications to the default wdt driver, they would just inherit
orion.dtsi's "marvell,orion-wdt", right?

On the driver side, since it currently has no subarch or board specific
tweaks, then it is *only* good for the generic case,
"marvell,orion-wdt", and thus should only match it for now.

If the above is correct, then I should create orion.dtsi, which is
included by kirkwood.dtsi.  orion.dtsi should hold "marvell,orion-wdt"
and "marvell,orion-rtc".  The corresponding drivers should only match
those generic strings, since there are no specific tweaks.

I hate to keep kicking this horse, but I want to make sure I grok it.

thx,

Jason.
