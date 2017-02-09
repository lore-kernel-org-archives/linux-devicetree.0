From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: armada-385-linksys: fix DSA compatible property
Date: Thu, 9 Feb 2017 16:51:55 +0100
Message-ID: <20170209155155.GA29882@lunn.ch>
References: <20170209152702.23036-1-ralph.sennhauser@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170209152702.23036-1-ralph.sennhauser@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, "moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,
 ..." <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 09, 2017 at 04:27:02PM +0100, Ralph Sennhauser wrote:
> The switch to the new DSA binding used "marvell,mv88e6095" for the
> compatible property which doesn't exist, use "marvell,mv88e6085"
> instead.
> 
> Fixes: 455b82f03f52 ("ARM: dts: armada-385-linksys: Utilize new DSA binding")
> Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>

Hi Ralph

Good catch.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Gregory, this is in the mvebu dt branch and need fixing there.

[Goes away to look at the other dts files]

O.K. Florian only made this typ0 once in the patchset.

     Andrew
