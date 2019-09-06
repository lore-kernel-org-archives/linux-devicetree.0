Return-Path: <SRS0=UWh6=XB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from forward105p.mail.yandex.net ([77.88.28.108]:55189 "EHLO
        forward105p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388655AbfIFO3P (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Sep 2019 10:29:15 -0400
Date: Fri, 6 Sep 2019 17:29:09 +0300
From: "<Vitaly Gaiduk>" <vitaly.gaiduk@cloudbear.ru>
Subject: Re: [PATCH 1/2] net: phy: dp83867: Add documentation for SGMII mode
 type
Message-ID: <20190906142909.GA16695@asus-X750JA>
References: <1567700761-14195-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
 <1567703176.6344.4.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567703176.6344.4.camel@impinj.com>
Sender: devicetree-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: davem@davemloft.net, f.fainelli@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Oh, sorry for delayed reply.
This value means chosen sgmii type mode and can be 0 or 1 only.
Idea with phy-mode adds some work with dts because this field
is placed in mac node usually. Maybe just use "sgmii-clk" boolean 
instead of my?

P.S. It's my first experience with LKML so I'm apologize in advance
if something is wrong with CC field or other.

On Thu, Sep 05, 2019 at 05:06:17PM +0000, Trent Piepho wrote:
> On Thu, 2019-09-05 at 19:26 +0300, Vitaly Gaiduk wrote:
> > Add documentation of ti,sgmii-type which can be used to select
> > SGMII mode type (4 or 6-wire).
> > 
> > Signed-off-by: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
> > ---
> >  Documentation/devicetree/bindings/net/ti,dp83867.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.txt b/Documentation/devicetree/bindings/net/ti,dp83867.txt
> > index db6aa3f2215b..18e7fd52897f 100644
> > --- a/Documentation/devicetree/bindings/net/ti,dp83867.txt
> > +++ b/Documentation/devicetree/bindings/net/ti,dp83867.txt
> > @@ -37,6 +37,7 @@ Optional property:
> >  			      for applicable values.  The CLK_OUT pin can also
> >  			      be disabled by this property.  When omitted, the
> >  			      PHY's default will be left as is.
> > +	- ti,sgmii-type - This denotes the fact which SGMII mode is used (4 or 6-wire).
> 
> Really should explain what kind of value it is and what the values
> mean.  I.e., should this be ti,sgimii-type = <4> to select 4 wire?
> 
> Maybe a boolean, "sgmii-clock", to indicate the presence of sgmii rx
> clock lines, would make more sense?
> 
> I also wonder if phy-mode = "sgmii-clk" or "sgmii-6wire", vs the
> existing phy-mode = "sgmii", might also be a better way to describe
> this instead of a new property.
