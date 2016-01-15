From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 24/26] devicetree: Add olimex vendor prefix
Date: Fri, 15 Jan 2016 07:41:35 +0100 (CET)
Message-ID: <1957693252.53435.d0a9f334-1bed-484f-886a-05dfab0e0dfa.open-xchange@email.1und1.de>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-25-git-send-email-maxime.ripard@free-electrons.com>
 <20160115031543.GA25640@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160115031543.GA25640@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, Rob Clark <robdclark@gmail.com>, Wynter Woods <wynter@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-sunxi@googlegroups.com, David Airlie <airlied@linux.ie>, Alexander Kaplan <alex@nextthing.co>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Mike Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> Rob Herring <robh@kernel.org> hat am 15. Januar 2016 um 04:15 geschrieben:
>
>
> On Thu, Jan 14, 2016 at 04:25:07PM +0100, Maxime Ripard wrote:
> > Olimex is an open source hardware boards vendors based in Bulgaria.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> > Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> > 1 file changed, 1 insertion(+)
>
> Acked-by: Rob Herring <robh@kernel.org>
>

I don't think we need this twice.

It's already committed:

2193377bdade ("DT: add Olimex to vendor prefixes")

Regards
Stefan
