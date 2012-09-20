From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 00/11] pinctrl: mvebu: pinctrl driver
Date: Thu, 20 Sep 2012 12:02:54 +0200
Message-ID: <20120920100254.GE21928@lunn.ch>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <CACRpkda+Kav6RGstSQ9+BCgVV+pR6ca_HmoueODYubX_xYM8Jw@mail.gmail.com>
 <505AD103.8050004@gmail.com>
 <20120920110424.3cb4daff@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120920110424.3cb4daff@skate>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Thomas

> Hum, which patches are stalling the integration into the Marvell tree?

l2 cache, I think.

The trees Jason built for pull requests in the direction of arm-soc
had the l2 cache patch as the very first in the series. Now that these
patches have run into some trouble, its blocking all the patches that
followed.

Jason is re-building his trees, throwing out l2 cache for the
moment. That should allow Olof/Arnd to pull these trees into arm-soc,
and then Jason will work on integrating the remaining patches not
already in his trees.

	Andrew
