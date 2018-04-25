From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/7] gnss: add generic serial driver
Date: Wed, 25 Apr 2018 13:05:11 +0200
Message-ID: <20180425110511.GR4615@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180424163458.11947-4-johan@kernel.org>
 <20180425090031.GD13295@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180425090031.GD13295@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 25, 2018 at 11:00:31AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 24, 2018 at 06:34:54PM +0200, Johan Hovold wrote:
> > +static inline void *gnss_serial_get_drvdata(struct gnss_serial *gserial)
> > +{
> > +	return &gserial[1];
> > +}
> 
> Oh that's the best hack I have seen in a long time.  I need to remember
> that one for next time.
> 
> Anyway, in reading this driver, I don't think the module reference
> counting is being handled here, so you might want to add that to the
> gnss core to keep things from going south if modules are unloaded.

As I just mentioned in my reply to your comment about module references
in core, I think I got this covered through the hotplug support. Devices
can go away at anytime, including through a module unload.

Thanks,
Johan
