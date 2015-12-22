From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 1/9] ARM: mvebu: ix4-300d: Add compatible property to
 "partitions" node
Date: Tue, 22 Dec 2015 13:22:25 -0800
Message-ID: <20151222212225.GE30172@localhost>
References: <1450694033-27717-1-git-send-email-geert+renesas@glider.be>
 <1450694033-27717-2-git-send-email-geert+renesas@glider.be>
 <87zix3rbm7.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87zix3rbm7.fsf@free-electrons.com>
Sender: linux-sh-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, arm@kernel.org, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Alex Smith <alex.smith@imgtec.com>, Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, linux-mips@linux-mips.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 21, 2015 at 05:48:48PM +0100, Gregory CLEMENT wrote:
> Hi Geert,
>  
>  On lun., d??c. 21 2015, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> > As of commit e488ca9f8d4f62c2 ("doc: dt: mtd: partitions: add compatible
> > property to "partitions" node"), the "partitions" subnode of an SPI
> > FLASH device node must have a compatible property. The partitions are no
> > longer detected if it is not present.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Brian Norris <computersforpeace@gmail.com>
> 
> Applied on mvebu/dt (with the hope that it is still time to push it to
> arm-soc)

I think we should just take this directly, so feel free to drop it. I'll
followup on 0/9.


-Olof

