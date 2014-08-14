From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/5] ARM: shmobile: r8a7740: document MSTP clock
 support
Date: Fri, 15 Aug 2014 07:37:10 +0900
Message-ID: <20140814223710.GB9938@verge.net.au>
References: <1407507792-8121-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1407507792-8121-2-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20140811011214.GI26570@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140811011214.GI26570@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-sh@vger.kernel.org, mturquette@linaro.org, devicetree@vger.kernel.org, magnus.damm@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 11, 2014 at 10:12:14AM +0900, Simon Horman wrote:
> On Fri, Aug 08, 2014 at 04:23:08PM +0200, Ulrich Hecht wrote:
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> 
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Mike, could you consider taking this?

Ping

> > ---
> >  Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> > index 8a92b5f..b3c0617 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> > @@ -11,6 +11,7 @@ Required Properties:
> >  
> >    - compatible: Must be one of the following
> >      - "renesas,r7s72100-mstp-clocks" for R7S72100 (RZ) MSTP gate clocks
> > +    - "renesas,r8a7740-mstp-clocks" for R8A7740 (R-Mobile A1) MSTP gate clocks
> >      - "renesas,r8a7779-mstp-clocks" for R8A7779 (R-Car H1) MSTP gate clocks
> >      - "renesas,r8a7790-mstp-clocks" for R8A7790 (R-Car H2) MSTP gate clocks
> >      - "renesas,r8a7791-mstp-clocks" for R8A7791 (R-Car M2) MSTP gate clocks
> > -- 
> > 1.8.4.5
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-sh" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sh" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
