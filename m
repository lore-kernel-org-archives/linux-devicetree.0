Return-Path: <SRS0=TUK/=JJ=googlemail.com=chf.fritz@kernel.org>
Message-ID: <1529781960.2215.2.camel@googlemail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: fix documentation of tps65911
From: Christoph Fritz <chf.fritz@googlemail.com>
Reply-To: chf.fritz@googlemail.com
Date: Sat, 23 Jun 2018 21:26:00 +0200
In-Reply-To: <20180611182734.GA17896@rob-hp-laptop>
References: <1528146863.2818.23.camel@googlemail.com>
	 <20180605070457.GF21163@dell> <1528190809.2527.5.camel@googlemail.com>
	 <20180611182734.GA17896@rob-hp-laptop>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, devicetree <devicetree@vger.kernel.org>, linux-omap@vger.kernel.org, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hey Lee

On Mon, 2018-06-11 at 12:27 -0600, Rob Herring wrote:
> On Tue, Jun 05, 2018 at 11:26:49AM +0200, Christoph Fritz wrote:
> > This patch fixes documentation of tps65911 because its list of
> > compatible regulators contains wrongly vdd3 instead of vdd2.
> > 
> > Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/tps65910.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>

any chance to get this patch queued soon?

Thanks
 -- Christoph
