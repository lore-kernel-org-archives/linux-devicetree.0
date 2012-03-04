From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/4] ARM: kirkwood: convert rtc-mv to fdt.
Date: Sun, 4 Mar 2012 16:48:17 +0000
Message-ID: <201203041648.17428.arnd@arndb.de>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <2c985a303f3b9b0cfcead25634b7e1db68d34ee3.1330625878.git.jason@lakedaemon.net>
 <201203041559.23810.michael@walle.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201203041559.23810.michael@walle.cc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Walle <michael@walle.cc>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sunday 04 March 2012, Michael Walle wrote:
> in my older patch series i flagged all converted devices with two 
> compatibility names. Eg:
> 
>        { .compatible = "marvell,orion5x-rtc", },
>        { .compatible = "marvell,kirkwood-rtc", },
> 
> IMHO marvell,rtc is i little too general, i guess marvell won't have only one 
> rtc ;)
> 
> Other opinions?

Being specific is certainly good, and it may also be a good idea to
list the first one it's compatible with in the device tree source.

So the device tree for a 88F6281 soc could list

	compatible = "marvell,88f6281-rtc", "marvell,kirkwood-rtc", "marvell,orion-rtc";

This would give the device driver the option which one to bind to. Anything that
has an rtc compatible with the one in orion should list that one, so that the driver
only has to list that one if they are truely identical, but if the driver has to
get modified later to know the difference between orion and kirkwood rtcs, it can
check the more specific value.

	Arnd
