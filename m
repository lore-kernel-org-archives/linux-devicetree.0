From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 1/2] dt-bindings: marvell,mmp2: Add clock id for the
 LCDC clock
Date: Fri, 22 Feb 2019 02:56:19 +0100
Message-ID: <2a40b7e92d913705547d07b71b263c0badb33513.camel@v3.sk>
References: <20190211102050.24422-1-lkundrak@v3.sk>
         <155078650801.77512.6725660289964680903@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155078650801.77512.6725660289964680903@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-02-21 at 14:01 -0800, Stephen Boyd wrote:
> Quoting Lubomir Rintel (2019-02-11 02:20:49)
> > The peripheral clock is required for access the the LCDC registers. It
> > is in fact separate from the "AXI clock" that is optionally used to generate
> > the pixel clock and as such requires a separate clock id.
> > 
> > Link: https://lists.freedesktop.org/archives/dri-devel/2019-January/203975.html
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > ---
> 
> It's a resend? I picked up the other one.

It is. Sorry for not marking it as such -- I forgot I already sent it.
The patches are indeed the same.

Thanks for picking it up.

Lubo
