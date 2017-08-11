From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/2] reset: uniphier: remove sLD3 SoC support
Date: Fri, 11 Aug 2017 09:43:12 +0200
Message-ID: <1502437392.2310.6.camel@pengutronix.de>
References: <1501987442-2583-1-git-send-email-yamada.masahiro@socionext.com>
         <1501987442-2583-2-git-send-email-yamada.masahiro@socionext.com>
         <20170810203059.abbmh4zhrk36shxb@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170810203059.abbmh4zhrk36shxb@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-08-10 at 15:30 -0500, Rob Herring wrote:
> On Sun, Aug 06, 2017 at 11:44:01AM +0900, Masahiro Yamada wrote:
> > This SoC is too old.  It is difficult to maintain any longer.
> > 
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> > 
> >  .../devicetree/bindings/reset/uniphier-reset.txt   |  2 -
> >  drivers/reset/reset-uniphier.c                     | 48 ++++++++
> > --------------
> >  2 files changed, 16 insertions(+), 34 deletions(-)
> 
> Acked-by: Rob Herring <robh@kernel.org>

Added to the patch, thank you.

regards
Philipp
