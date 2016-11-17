From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH] mfd: dt: Add Aspeed LPC binding
Date: Thu, 17 Nov 2016 10:16:15 +0100
Message-ID: <4751029.AudB7s5avo@wuerfel>
References: <20161117060633.3837-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161117060633.3837-1-andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: devicetree@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday, November 17, 2016 4:36:33 PM CET Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> 
> I'd like to start a discussion about how to handle the LPC register space in
> the Aspeed SoC. There are a number of issues, largely concerned with the layout
> of the registers but also with the fact that LPC register state is used by the
> pinmux to determine some pin functionality.
...
> 
> What is the recommended approach to managing such hardware?

Can you clarify which side of the LPC bus this is? We are currently having
a discussion for how to integrate the LPC master on an ARM64 server that
uses LPC to access an Aspeed LPC slave. For this one we want to use the
traditional ISA DT binding.

I'm guessing that you are interesting in the other side here, for mapping
the registers of the LPC slave on the Aspeed BMC, but that's not clear from
your email, as I'm assuming that the same chip has both master and slave
interfaces.

	Arnd
