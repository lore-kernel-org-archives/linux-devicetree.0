From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] ARM: mvebu: add support for the Linksys WRT1900ACS
 (Shelby)
Date: Tue, 14 Feb 2017 17:55:33 +0000
Message-ID: <20170214175533.GF25924@io.lakedaemon.net>
References: <20170214085919.3997-1-ralph.sennhauser@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170214085919.3997-1-ralph.sennhauser@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Ralph, Imre,

On Tue, Feb 14, 2017 at 09:59:17AM +0100, Ralph Sennhauser wrote:
> The Linksys WRT1900ACS (Shelby) is another Armada 385 based router in
> the Linksys WRT AC Series which got released in October 2015.
> 
> The file armada-385-linksys-shelby.dts is taken from OpenWrt as-is and
> originally authored by Imre Kaloz.
> 
> URL: http://tinyurl.com/j8lz83a

Could you please change this to:

https://github.com/openwrt/openwrt/blob/8466384db1154a107b86bf3ca10b166a21bd81d0/target/linux/mvebu/files/arch/arm/boot/dts/armada-385-linksys-shelby.dts

Or, say 'imported from

 https://github.com/openwrt/openwrt

commit 8466384db115 "mvebu: add support for 4.1 and switch over"'

or something similar?

Other than that,

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
