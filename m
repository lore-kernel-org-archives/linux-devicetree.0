From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: dts: dove: add DT LCD controllers
Date: Wed, 19 Nov 2014 16:47:13 +0000
Message-ID: <20141119164713.GJ4042@n2100.arm.linux.org.uk>
References: <E1Xr3Ur-0005Qx-Fx@rmk-PC.arm.linux.org.uk>
 <20141119174050.122a0cc0@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20141119174050.122a0cc0@armhf>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 19, 2014 at 05:40:50PM +0100, Jean-Francois Moine wrote:
> On Wed, 19 Nov 2014 11:32:29 +0000
> Russell King <rmk+kernel@arm.linux.org.uk> wrote:
> 
> > +			lcd1: lcd-controller@810000 {
> > +				compatible = "marvell,dove-lcd";
> > +				reg = <0x810000 0x1000>;
> > +				interrupts = <46>;
> > +				status = "disabled";
> > +			};
> 
> The I/O range of the LCDs is only 0x1c8. Why do you set it 0x1000?

Actually, a more correct value would be 0x10000, if you read table 145.
Yes, the device may onlny have documented registers from 0x84 to 0x1c8,
but that isn't to say that we should say that the device resources
start at 0x810084 and have a size of 0x144, when the bus level decodes
a 64K chunk of memory.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
