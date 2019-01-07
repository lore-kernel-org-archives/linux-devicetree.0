From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/4] Add driver for globaltop GNSS receivers
Date: Mon, 7 Jan 2019 17:37:12 +0100
Message-ID: <20190107163712.GF14782@localhost>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
 <86bm4x6830.fsf@baylibre.com>
 <20190104091937.GA4737@localhost>
 <86ftu41lqx.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <86ftu41lqx.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 07, 2019 at 05:21:58PM +0100, Loys Ollivier wrote:
> 
> On Fri 04 Jan 2019 at 09:19, Johan Hovold wrote:
> 
> > On Thu, Jan 03, 2019 at 05:04:35PM +0100, Loys Ollivier wrote:
> >> 
> >> As suggested by Neil Armstrong - this GNSS device seems to behave like
> >> most generic GNSS receivers.
> >> I'll send a v2 with a generic driver that works for both GlobalTop and
> >> u-blox.
> >
> > That doesn't sound right to me. Judging from a quick look, this device
> > appears to be based on a mediatek chipset, so I suggest reworking
> > (renaming) this as a Mediatek driver (gnss type would be MTK, reflecting
> > the vendor protocol) even if it happens to look a lot like the current
> > u-blox driver.
> >
> OK, agreed - will rename the driver as Mediatek.
> Would you recommend keeping any reference to Globaltop ? Such as in the
> devicetree gnss bindings.
> Or only keep "mediatek,mt3339" for any solution based on that chipset.

Yes, I suggest keeping the globaltop compatible (cf. the sirf driver for
devices based on sirf chipsets).

Thanks,
Johan
