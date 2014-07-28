From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega
 ix4-300d NAS
Date: Mon, 28 Jul 2014 13:02:47 +0200
Message-ID: <6028388.mjACYPxFta@wuerfel>
References: <1406418436-61452-1-git-send-email-yahoo@perenite.com>
 <5442226.1WCY4fjGCy@wuerfel>
 <78788908-DDB5-46F8-83C1-FAE312D7BFB2@perenite.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <78788908-DDB5-46F8-83C1-FAE312D7BFB2@perenite.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Benoit Masson <benoitm@perenite.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, jason@lakedaemon.net, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, sebastian.hesselbarth@googlemail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, gregory.clement@free-electrons.com, Benoit Masson <yahoo@perenite.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 28 July 2014 12:50:47 Benoit Masson wrote:
> > 
> > It should still list both "marvell,mv78230-i2c" and "marvell,mv64xxx-i2c",
> > as the generic name may not be enough to describe the register layout
> > correctly.
> 
> I tend to disagree since the dts include the armada-xp.dtsi, which already declare
> 
> "i2c0: i2c@11000 {
>                                 compatible = "marvell,mv78230-i2c", "marvell,mv64xxx-i2c";
>                                 reg = <0x11000 0x100>;
>                         };
> "
> 
> I tested the dts on the device and it does inherits the i2c declaration, did I miss something here ?
> 

Inheriting from armada-xp.dtsi is fine, but if you manually set
"marvell,mv64xxx-i2c", that will override the old setting
and drop the "marvell,mv78230-i2c" part, which is bad because
it may break things later if it turns out that the mv78230
variant is not completely compatible with the old
mv64xxx variant.

	Arnd
