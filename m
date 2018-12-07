Return-Path: <SRS0=EvMS=OQ=linux.intel.com=andriy.shevchenko@kernel.org>
Date: Fri, 7 Dec 2018 16:21:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: sc16is7xx: Add alternative
 clock-frequence property
Message-ID: <20181207142140.GJ10650@smile.fi.intel.com>
References: <20181205141133.9305-1-andriy.shevchenko@linux.intel.com>
 <ff94d003-6636-169b-7a89-fdc4bf9c39b5@mentor.com>
 <20181207134844.GH10650@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181207134844.GH10650@smile.fi.intel.com>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org, Georgii Staroselskii <georgii.staroselskii@emlid.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Dec 07, 2018 at 03:48:44PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 07, 2018 at 10:18:26AM +0200, Vladimir Zapolskiy wrote:
> > On 12/05/2018 04:11 PM, Andy Shevchenko wrote:
> > > For the platforms which have no clock provider for the sc16is7xx type of UART,
> > > introduce an alternative clock-frequency property which would be used instead.
> > 
> > the subject has a typo in 'clock-frequence', then can you please tell me more,
> > how is it possible that an SC16IS7xx IC has no clock provider connected to it?
> 
> I better ask Grigorii about this, since I have no hardware at my possession.

My apologizes, I meant Georgii!

-- 
With Best Regards,
Andy Shevchenko
