From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v4 2/2] reset: Add GPIO support to reset controller
 framework
Date: Mon, 14 Apr 2014 11:57:58 +0100
Message-ID: <20140414115758.2c0c8a9d@alan.etchedpixels.co.uk>
References: <1397463709-19405-1-git-send-email-p.zabel@pengutronix.de>
	<1397463709-19405-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397463709-19405-2-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Roger Quadros <rogerq@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

> This adds support for GPIO controlled reset pins on peripheral ICs to the reset
> controller framework. Currently there is no support for specifying a delay
> between assertion and de-assertion of the reset signal, so this has to be
> handled by the drivers.

Lots of GPIO controllers are doing posted writes to the fabric so surely
your delay will be wrong ?


Alan
