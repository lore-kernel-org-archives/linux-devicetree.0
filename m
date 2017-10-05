From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/3] ARM: dts: gr-peach: Enable MTU2 timer pulse unit
Date: Thu, 5 Oct 2017 11:26:25 +0200
Message-ID: <20171005092624.GW26369@verge.net.au>
References: <1507193900-23801-1-git-send-email-jacopo+renesas@jmondi.org>
 <1507193900-23801-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdV+eXxXE-oa5mQ9h0SQg+a8hMkx+SD0HVzNhKd4sBm1cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdV+eXxXE-oa5mQ9h0SQg+a8hMkx+SD0HVzNhKd4sBm1cA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 05, 2017 at 11:02:30AM +0200, Geert Uytterhoeven wrote:
> On Thu, Oct 5, 2017 at 10:58 AM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > MTU2 multi-function/multi-channel timer/counter is not enabled for
> > GR-Peach board. The timer is used as clock event source to schedule
> > wake-ups, and without this enabled all sleeps not performed through busy
> > waiting hang the board.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
