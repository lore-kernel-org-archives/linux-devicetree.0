From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 1/2] drm/panel: simple: Add FriendlyELEC HD702E 800x1280
 LCD panel
Date: Tue, 7 May 2019 18:40:36 +0530
Message-ID: <CAMty3ZBpRABe4u26ZN91JRB+vVF4Z96k-LDoe37d6EdVDkfJsg@mail.gmail.com>
References: <20190501121448.3812-1-jagan@amarulasolutions.com>
 <20190501193429.GA9075@ravnborg.org> <CAMty3ZAfwVyvmAmenhrQHJcy3eq-Yb61a4WLop_8jS-7vM940A@mail.gmail.com>
 <CAL_Jsq+mYy1JF_cM7sD82aLuUSnZnwsSD6-Q-W1uTp+_oSdRmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+mYy1JF_cM7sD82aLuUSnZnwsSD6-Q-W1uTp+_oSdRmg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Heiko Stuebner <heiko@sntech.de>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula <linux-amarula@amarulasolutions.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 6, 2019 at 8:34 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, May 6, 2019 at 4:56 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Hi Sam,
> >
> > On Thu, May 2, 2019 at 1:04 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Jagan
> > >
> > > On Wed, May 01, 2019 at 05:44:47PM +0530, Jagan Teki wrote:
> > > > HD702E lcd is FriendlyELEC developed eDP LCD panel with 800x1280
> > > > resolution. It has built in Goodix, GT9271 captive touchscreen
> > > > with backlight adjustable via PWM.
> > > >
> > > > Add support for it.
> > > >
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > Please submit the binding in a separate patch as per
> > > Documentation/devicetree/bindings/submitting-patches.txt
> >
> > Hmm.. prepared like this initially but few of my patches were combined
> > earlier even-though I sent it separately. anyway let me separate it
> > again.
>
> For what subsystem? All the maintainers that I was aware of doing that
> have stopped.

May be it was recent, Dmitry combined by previous dt and driver changes.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ae97fb589648cd5558f1ceea317404a639307501
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a5f50c501321249d67611353dde6d68d48c5b959
