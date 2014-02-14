From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 1/6] mailbox: add core framework
Date: Fri, 14 Feb 2014 20:48:25 +0100
Message-ID: <201402142048.25456.arnd@arndb.de>
References: <1391820619-25487-1-git-send-email-courtney.cavin@sonymobile.com> <1765844.1kjKsO2Rzo@wuerfel> <20140212183143.GD1706@sonymobile.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140212183143.GD1706@sonymobile.com>
Sender: linux-doc-owner@vger.kernel.org
To: Courtney Cavin <courtney.cavin@sonymobile.com>
Cc: Rob Herring <robherring2@gmail.com>, Josh Cartwright <joshc@codeaurora.org>, "s-anna@ti.com" <s-anna@ti.com>, Rob Herring <rob.herring@calxeda.com>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, Mark Langsdorf <mark.langsdorf@calxeda.com>, Tony Lindgren <tony@atomide.com>, "omar.ramirez@copitl.com" <omar.ramirez@copitl.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 12 February 2014, Courtney Cavin wrote:
> On Tue, Feb 11, 2014 at 09:35:01AM +0100, Arnd Bergmann wrote:
> > On Monday 10 February 2014 16:23:48 Courtney Cavin wrote:

> Then again, I think that the context management stuff is the exception as well,
> and I think that can/should also be handled in a higher level.  Regardless, I
> went ahead and drafted the async flags idea out anyway, so here's some
> pseudo-code.  I also tried to shoe-horn in 'peek', and you can see how that
> turns out.  Let me know if this is something like what you had in mind.

The async implementation looks good to me, assuming we actually need both
sync and async operations, which I can't tell for sure.

For the peek operation, it wouldn't work for the ethernet case, which
has to call it from atomic context in net_rx_action.

> 	/**
> 	 * so this is where this lock makes things difficult, as this function
> 	 * might_sleep(), but only really because of the lock.  Either we can
> 	 * remove the lock and force the adapter to do its own locking
> 	 * spinlock-style, or we can accept the sleep here, which seems a bit
> 	 * stupid in a peek function.  Neither option is good.  Additionally,
> 	 * there's no guarantee that the adapter doesn't operate over a bus
> 	 * which itself might_sleep(), exacerbating the problem.
> 	 */
> 	mutex_lock(&mbox->adapter->lock);
> 	rc = mbox->adapter->ops->peek_message(mbox->adapter, mbox->chan, msg);
> 	mutex_lock(&mbox->adapter->lock);

If we decide that peek() must not sleep, any driver that operates on a
slow bus could just always report "no data" here.
 
Moving the locking into the mbox driver here sounds appropriate.

	Arnd
