From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 2/5] USB: host: ohci-at91: remove useless uclk clock
Date: Mon, 23 Mar 2015 13:23:30 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1503231322560.1336-100000@iolanthe.rowland.org>
References: <5510378D.9060009@atmel.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5510378D.9060009@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Douglas Gilbert <dgilbert@interlog.com>, Robert Nelson <robert.nelson@digikey.com>
List-Id: devicetree@vger.kernel.org

On Mon, 23 Mar 2015, Nicolas Ferre wrote:

> Le 17/03/2015 20:02, Alan Stern a =E9crit :
> > On Tue, 17 Mar 2015, Boris Brezillon wrote:
> >=20
> >> Now that the system clock driver is forwarding set_rate request to=
 the
> >> parent clock, we can safely call clk_set_rate on the system clk an=
d get
> >> rid of the uclk field.
> >>
> >> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com=
>
> >=20
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
>=20
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
>=20
> Hi Alan,
>=20
> As I don't have any other "drivers" patch for 4.1, would you mind tak=
ing
> this patch with your tree?
> I'll take care of the remaining ones dealing with Device Tree: they a=
re
> independent anyway.

Greg can take this patch; it's fine with me.

Alan Stern
