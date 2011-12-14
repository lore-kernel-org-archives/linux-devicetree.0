From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [REPOST RFC PATCH 0/3] New "gpio-poweroff" driver to turn off
 platform devices with GPIOs
Date: Wed, 14 Dec 2011 11:59:54 +0000
Message-ID: <20111214115954.GB25088@sirena.org.uk>
References: <1323800614-12642-1-git-send-email-Kyle.D.Moffett@boeing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1323800614-12642-1-git-send-email-Kyle.D.Moffett@boeing.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kyle Moffett <Kyle.D.Moffett@boeing.com>
Cc: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2011 at 01:23:31PM -0500, Kyle Moffett wrote:

> I'm working on support for some custom hardware of ours, and part of
> the support code is the ability for the software to shutdown the power
> supply using GPIOs (via an I2C GPIO controller).

We already have the regulator API for controlling power to devices,
simple GPIO supplies are supported using fixed voltage regulators.  The
drivers that are being turned off should have regulator support added to
them.  If we have a separate method for doing GPIOs then drivers would
have to support multiple methods of controlling their power.
