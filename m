From: Philipp Zabel <pza@pengutronix.de>
Subject: Re: [PATCH v2 0/2] reset: meson-audio-arb: add sm1 support
Date: Thu, 3 Oct 2019 20:03:11 +0200
Message-ID: <20191003180311.hlv7s32twzcaxj3x@pengutronix.de>
References: <20190905135040.6635-1-jbrunet@baylibre.com>
 <1567693618.3958.4.camel@pengutronix.de>
 <1jk19oregr.fsf@starbuckisacylon.baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1jk19oregr.fsf@starbuckisacylon.baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

On Tue, Oct 01, 2019 at 11:40:20AM +0200, Jerome Brunet wrote:
[...]
> Looks like this patchset missed v5.4-rc1.
> Could you provide a tag with the bindings to Kevin so we can use the IDs
> in DT until the next merge window ?

Does

  git://git.pengutronix.de/git/pza/linux.git reset/meson-sm1-bindings

work for you?

regards
Philipp
