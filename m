From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 1/2 v2] ARM: dts: Add Aspeed SoC USB controllers to
 device-tree
Date: Tue, 16 Jan 2018 08:56:55 +1100
Message-ID: <1516053415.31850.137.camel@kernel.crashing.org>
References: <1515738064.31850.100.camel@kernel.crashing.org>
 <1516031982.5522.3.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1516031982.5522.3.camel@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org
Cc: Joel Stanley <joel.stanley@au1.ibm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 2018-01-15 at 09:59 -0600, Andrew Jeffery wrote:
> > +             uhci: usb@1e6b0000 {
> > +                     compatible = "aspeed,ast2400-uhci", "generic-uhci";
> > +                     reg = <0x1e6b0000 0x100>;
> > +                     interrupts = <14>;
> > +                     #ports = <3>;
> 
> I tried to find the documentation for the #ports property, but it seems
> to not exist. Couldn't find any users either, but maybe I didn't look
> broadly enough. It is tested for in drivers/usb/host/uhci-platform.c
> though, so I guess it's functional.

I added it to uhci-platform back when that was merged but forgot to
update the binding. I'll send a separate patch for that.

Cheers,
Ben.
