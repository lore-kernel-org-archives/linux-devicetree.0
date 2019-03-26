From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: meson-g12a: Add missing USB2 PHY
 resets
Date: Tue, 26 Mar 2019 12:33:08 +0100
Message-ID: <1553599988.6854.5.camel@pengutronix.de>
References: <20190304104916.3937-1-narmstrong@baylibre.com>
         <1553078122.7071.6.camel@pengutronix.de> <7hbm2234i3.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hbm2234i3.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Fri, 2019-03-22 at 15:53 -0700, Kevin Hilman wrote:
[...]
> Could ou make a immtable tag for this in your tree?  This is needed for
> some upcoming DT users we'd like to queue for the next cycle.

I have just sent a reset/fixes pull request including this patch.
Once that gets merged, you can either wait for the next -rc that
includes it or pull in 
    git://git.pengutronix.de/pza/linux reset/meson-g12a
which is just the first patch of the two.

regards
Philipp
