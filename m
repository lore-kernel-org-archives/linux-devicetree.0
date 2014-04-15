From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] reset: Add GPIO support to reset controller
 framework
Date: Tue, 15 Apr 2014 10:35:25 +0200
Message-ID: <1397550925.3836.30.camel@paszta.hi.pengutronix.de>
References: <1397463709-19405-1-git-send-email-p.zabel@pengutronix.de>
	 <1397463709-19405-2-git-send-email-p.zabel@pengutronix.de>
	 <20140414115758.2c0c8a9d@alan.etchedpixels.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140414115758.2c0c8a9d@alan.etchedpixels.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Roger Quadros <rogerq@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hi Alan,

Am Montag, den 14.04.2014, 11:57 +0100 schrieb One Thousand Gnomes:
> > This adds support for GPIO controlled reset pins on peripheral ICs to the reset
> > controller framework. Currently there is no support for specifying a delay
> > between assertion and de-assertion of the reset signal, so this has to be
> > handled by the drivers.
> 
> Lots of GPIO controllers are doing posted writes to the fabric so surely
> your delay will be wrong ?

I haven't seen hardware yet where this is an issue, but it's a valid
point. I can also imagine boards where the GPIO is connected to some
board specific timed reset logic or where the reset length has to be
altered just due to capacitance.

regards
Philipp
