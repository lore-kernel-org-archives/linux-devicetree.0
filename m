From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 0/8] gnss: add new GNSS subsystem
Date: Fri, 29 Jun 2018 14:26:00 -0400
Message-ID: <20180629182600.GA17562@kroah.com>
References: <20180601082259.17563-1-johan@kernel.org>
 <20180628120103.GA28131@kroah.com>
 <20180629094607.GC31718@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180629094607.GC31718@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, alan@linux.intel.com, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 29, 2018 at 11:46:07AM +0200, Pavel Machek wrote:
> 
> > > Finally, note that documentation (including kerneldoc) remains to be
> > > written, but hopefully this will not hinder review given that the
> > > current interfaces are fairly self-describing.
> > 
> > This all looks great.  Thanks for doing this work and adding a new
> > subsystem for something that has been asked for for many years.
> > 
> > All now merged in my tree, nice job!
> 
> I don't think discussion was finished on this one.

It looked done to me as there was only a single set of patches, with no
other working patches submitted from anyone else.

If this turns out to be a "bad" api, then we can deal with it then, but
for now let's try this out.

thanks,

greg k-h
