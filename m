From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [Gta04-owner] [PATCH 3/3] tty/slaves: add a driver to power
 on/off UART attached devices.
Date: Mon, 27 Apr 2015 22:35:42 +0200
Message-ID: <20150427203542.GB29351@xo-6d-61-c0.localdomain>
References: <20150321103122.23603014@notabene.brown>
 <C091D3C1-CE79-469A-BEA4-25E03F6E9164@goldelico.com>
 <20150325014543.GA967@earth>
 <6B657A35-68BD-45F6-BD55-A3D6AC1055C8@goldelico.com>
 <20150325152110.GA7903@earth>
 <E4CA3051-6004-4D7B-BF01-CE47CFEDA4EB@goldelico.com>
 <20150326180805.GA562@earth>
 <06BFF79C-F9FC-441D-BA41-7209219A912E@goldelico.com>
 <20150327163108.GA5089@earth>
 <983B007F-6DC4-4333-B383-E387E2E55AE2@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <983B007F-6DC4-4333-B383-E387E2E55AE2@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Sebastian Reichel <sre@kernel.org>, NeilBrown <neilb@suse.de>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi!

> > In my opinion making something a node in / is always the
> > last resort and in my perspective it has been handled in such a way
> > so far.
> 
> But that contradicts some documents I have found and linked. Please
> show me a document about DT that supports your view.
> 
> I agree that both views can be valid, but in lack of some ?official? guideline
> we can?t decide ourselves.

This is not how kernel development works.

We can decide ourselves, and DT people will swear at us if we decide wrongly,
and then Linus swears at them if they do too obvious mistakes.

Lets KISS.
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
