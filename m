Return-Path: <grant.likely@secretlab.ca>
Return-Path: <grant.likely@secretlab.ca>
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: devicetree repository separation/migration
In-Reply-To: <88923CF8-5E0A-46A4-AAA0-AC277F5C9446@bsdimp.com>
References: <20140217180544.GU7862@titan.lakedaemon.net> <20140218155750. GS17250@pengutronix.de> <20140218181854.GB7862@titan.lakedaemon.net> < CACxGe6vU3j4-UtUtxBkT=Mf+AeLVxBcWicGqQhcGVZXnEBUkig@mail.gmail.com> < 88923CF8-5E0A-46A4-AAA0-AC277F5C9446@bsdimp.com>
Date: Thu, 20 Feb 2014 11:39:51 +0000
Message-Id: <20140220113951.612DDC4050F@trevor.secretlab.ca>
To: Warner Losh <wlosh@bsdimp.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Ian Campbell <ijc@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, devicetree-spec@vger.kernel.org, devicetree-compiler@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, 19 Feb 2014 14:43:58 -0700, Warner Losh <wlosh@bsdimp.com> wrote:
> 
> On Feb 19, 2014, at 2:09 PM, Grant Likely wrote:
> 
> > On Tue, Feb 18, 2014 at 6:18 PM, Jason Cooper <jason@lakedaemon.net> wrote:
> >> On Tue, Feb 18, 2014 at 04:57:50PM +0100, Sascha Hauer wrote:
> >>> It will be interesting to see which rules should apply for merging new
> >>> bindings. I know that devicetrees should be OS agnostic, but sometimes
> >>> they are modelled after how Linux currently works. What happens when the
> >>> *BSD guys have different ideas how a good binding looks like? How will
> >>> such conflicts be resolved?
> >> 
> >> That's more a question for Grant.  I assume we'll all put on our big-boy
> >> pants and pick the best technical solution based on their merits. :)
> > 
> > I think you've answered it pretty competently.
> 
> What, the BSDs don't get a free pass to dump junk into the process. I'm shocked :)
> 
> But we have bug-boy pants over in BSD land, so that shouldn't be a problem.

Bug-boy pants? Sounds sticky.

g.
