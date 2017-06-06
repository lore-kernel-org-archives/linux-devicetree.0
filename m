From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 0/2] Add TI SCI Reset Driver
Date: Tue, 06 Jun 2017 09:51:11 +0200
Message-ID: <1496735471.2966.4.camel@pengutronix.de>
References: <20170524180930.9290-1-s-anna@ti.com>
         <04a25503-b675-8832-0323-eb7ecbaaefeb@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <04a25503-b675-8832-0323-eb7ecbaaefeb@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suman Anna <s-anna@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Andrew F. Davis" <afd@ti.com>, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, Dave Gerlach <d-gerlach@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Suman,

On Fri, 2017-06-02 at 11:45 -0500, Suman Anna wrote:
[...]
> > [1] http://marc.info/?l=devicetree&m=147976458332492&w=2
> > [2] http://marc.info/?l=linux-arm-kernel&m=149547831708124&w=2
> > [3] https://patchwork.kernel.org/patch/9744909/
> > 
> > Andrew F. Davis (2):
> >   Documentation: dt: reset: Add TI SCI reset binding
> >   reset: Add the TI SCI reset driver
> > 
> 
> Can you pick up this series for v4.13 if there are no comments. Btw, [2]
> is acked by Rob. Will appreciate if you can fixup the patch header from
> "Documentation: dt: reset: ..." to "dt-bindings: reset: ..." on the
> first patch when applying. Thanks in advance.

Thank you for the reminder, I've now applied both to the reset/next
branch. I've fixed the dt-bindings patch commit message as you suggested
and made the struct reset_control_ops const in the driver patch.

regards
Philipp
