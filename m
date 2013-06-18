From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v7 0/3] SH pinctrl DT support
Date: Tue, 18 Jun 2013 10:53:35 +0200
Message-ID: <201306181053.36823.heiko@sntech.de>
References: <1371495003-11185-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CACRpkdZh709J3pFsfbReQ20LU5W0Q1HacE0ZpssWXofKTJJ6pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZh709J3pFsfbReQ20LU5W0Q1HacE0ZpssWXofKTJJ6pQ@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, James Hogan <james.hogan@imgtec.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Magnus Damm <damm@opensource.se>, Simon Horman <horms@verge.net.au>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 18. Juni 2013, 10:05:30 schrieb Linus Walleij:
> On Mon, Jun 17, 2013 at 8:50 PM, Laurent Pinchart
> 
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > Hello,
> > 
> > Here's the seventh (and hopefully final) version of the SuperH and SH
> > Mobile pin controllers (PFC) DT support patch set.
> > 
> > The patches have been rebased on the for-next branch of the pinctrl
> > repository. All ARM-specific patches have been dropped and will be pushed
> > through to ARM SoC tree in v3.12. This series thus only contains DT
> > support for the sh-pfc driver.
> > 
> > I've tried merging Simon's latest tag (renesas-next-20130617v3) with
> > these patches and no conflict occurred. Linus, would it finally be
> > possible to get this applied for v3.11 ?
> > 
> > Changes since v6:
> > 
> > - Added generic pinconf support back
> > - Dropped all ARM-specific patches
> 
> Thanks, this looks really nice and I've applied all three.
> 
> Heiko, James can you have a look from a generic pinconf
> point of view so we are sure we get this right? (Looks right
> to me atleast.)

the pinconfig handling looks nice to me.

Acked-by: Heiko Stuebner <heiko@sntech.de>
