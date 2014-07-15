From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] Input: Add driver for Microchip's CAP1106
Date: Tue, 15 Jul 2014 09:41:49 -0700
Message-ID: <20140715164149.GA40351@core.coreip.homeip.net>
References: <1405073193-21448-1-git-send-email-zonque@gmail.com>
 <20140714095247.GB4980@leverpostej>
 <53C3AEE1.4030805@zonque.org>
 <20140715085138.GR26465@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140715085138.GR26465@leverpostej>
Sender: linux-input-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Mack <daniel@zonque.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, "dh.herrmann@gmail.com" <dh.herrmann@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Tue, Jul 15, 2014 at 09:51:38AM +0100, Mark Rutland wrote:
> On Mon, Jul 14, 2014 at 11:20:17AM +0100, Daniel Mack wrote:
> > 
> > linux,keycode feels a bit overkill here though, so I'd rather go for a
> > fixed-size linux,keycodes property. The number of entries is fixed,
> > anyway. Would you be fine with that?
> 
> Assuming no-one's likely to want a sparse keymap (i.e. one where some
> keys do nothing) then that's probably ok.


For such a small keymap, if one does not want to use some of the
buttons, setting corresponding entries to KEY_RESERVED should work well.

> > 
> > I took that from the gpio-keys driver. Is there a better way to denote
> > such a feature?
> 
> Unfortunately not, given current practice. My gripe is that it's a Linux
> detail that were describing rather than a property of the device. We can
> forget about that for now.

I prefer looking at it as user expressing the desired behavior of the
driver; it is up to OS to deliver such behavior ;)

Thanks.

-- 
Dmitry
