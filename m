From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: mvebu: Add core-divider clock
Date: Thu, 26 Sep 2013 17:56:56 +0200
Message-ID: <20130926155656.GF18244@lunn.ch>
References: <1380144502-24109-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130925213730.GA19371@localhost>
 <20130926082404.GA18244@lunn.ch>
 <20130926151240.GB4583@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130926151240.GB4583@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > > +	/* Valid ratio are 1:4, 1:5, 1:6 and 1:8 */
> > > +	u32 div;
> > > +
> > > +	div = *parent_rate / rate;
> > > +	if (div <= 4)
> > > +	   div = 4;
> > > +	   else if (div <= 5)
> > > +	   	div = 5;
> > > +		else if (div <= 6)
> > > +		     div = 6;
> > > +		     else
> > > +			div = 8;
> > > +
> > > +	return *parent_rate / div;
> > > +}
> > 
> > This looks odd. Is not the following clearer?
> > 
> > 	div = *parent_rate / rate;
> > 	if (div < 5)
> > 	   div = 4;
> > 	   else if (div > 6)
> > 		div = 8;
> > 
> 
> Mmmm... no, it's not at all clearer to me.
> IMHO, the original construction explicitly show the possible ratios:
> 
> 	/* If it's smaller than or equal to 4, set to 4 */
> 	if (div <= 4)
> 		div = 4;
> 
> 	/* Otherwise, if it's between 4 and 5, set to 5 */
> 	else if (div <= 5)
> 	 	div = 5;

If div was a float or double, i would probably agree. But its a u32.
It cannot be between 4 and 5. It must be 5. So it becomes

 	if (div <= 4)
 		div = 4;
        else if (div == 5)
	        div = 5;
        else if (div == 6)
                div = 6
        else 
	    div = 8

Those two middle statements look odd to me...

      Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
