From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: pca953x: fix vendor prefix for PCA9654
Date: Mon, 20 Nov 2017 12:59:37 -0600
Message-ID: <20171120185936.fu7avfqwjzl2q4wm@rob-hp-laptop>
References: <20171116201842.006310882@cogentembedded.com>
 <CAMuHMdVAD5saFjnkMViTeCm2vDYfEraq9DdHqNLet3YHjo0UeQ@mail.gmail.com>
 <7232ae40-189b-9ec5-87ef-7933e161422f@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7232ae40-189b-9ec5-87ef-7933e161422f@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 17, 2017 at 01:47:04PM +0300, Sergei Shtylyov wrote:
> On 11/17/2017 12:06 PM, Geert Uytterhoeven wrote:
> 
> > > Despite commit 55020c8056a8 ("of: Add vendor prefix for ON Semiconductor
> > > Corp.") was made long ago, the latter commit 9f49f6dd0473 ("gpio: pca953x:
> > > add onsemi,pca9654 id") made use of another, undocumented vendor prefix.
> > 
> > Ouch...
> > 
> > > Since such prefix doesn't seem to be used in any device trees, I think we
> > > can just fix the "compatible" string in the driver and the bindings and be
> > > done with that...
> > > 
> > > Fixes: 9f49f6dd0473 ("gpio: pca953x: add onsemi,pca9654 id")
> > > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > > 
> > > ---
> > > The patch is against the 'fixes' branch of LinusW's 'linux-gpio.git' repo.
> > > 
> > >   Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |    2 +-
> > >   drivers/gpio/gpio-pca953x.c                             |    2 +-
> > 
> > There's another (different) one in
> > Documentation/devicetree/bindings/misc/idt_89hpesx.txt
> 
>    Saw that. Do you think it also should be fixed (in this patch)?

IMO, separate.
