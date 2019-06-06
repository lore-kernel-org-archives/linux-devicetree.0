From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Configure BT_HOST_WAKE as wake-up
 signal on veyron
Date: Thu, 6 Jun 2019 16:34:32 -0700
Message-ID: <CAD=FV=U-BOF79yJOW7S1CRudTqDN0BA8Ur3mJfg3C-+8P6fCew@mail.gmail.com>
References: <20190605204320.22343-1-mka@chromium.org> <20190605212427.GP40515@google.com>
 <2828678.vPWIEPrON5@diego> <3394571.WlNFeu2Orz@phil> <20190606175654.GQ40515@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606175654.GQ40515@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jun 6, 2019 at 10:56 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Thu, Jun 06, 2019 at 12:46:03PM +0200, Heiko Stuebner wrote:
> > Am Mittwoch, 5. Juni 2019, 23:52:00 CEST schrieb Heiko St=C3=BCbner:
> > > Am Mittwoch, 5. Juni 2019, 23:24:27 CEST schrieb Matthias Kaehlcke:
> > > > On Wed, Jun 05, 2019 at 11:11:12PM +0200, Heiko St=C3=BCbner wrote:
> > > > > Am Mittwoch, 5. Juni 2019, 22:43:20 CEST schrieb Matthias Kaehlck=
e:
> > > > > > This enables wake up on Bluetooth activity when the device is
> > > > > > suspended. The BT_HOST_WAKE signal is only connected on devices
> > > > > > with BT module that are connected through UART.
> > > > > >
> > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > > >
> > > > > Housekeeping question, with the two Signed-off-by lines, is Doug =
the
> > > > > original author, or was this Co-developer-by?
> > > >
> > > > Good question, it's derived from Doug's patch for CrOS 3.14 and
> > > > https://crrev.com/c/1575556 also from Doug. Let's say I did the
> > > > porting to upstream, but I'm pretty sure Doug spent more time on it=
.
> > > >
> > > > Maybe I should resend it with Doug as author and include the origin=
al
> > > > commit message, which has more information.
> > >
> > > It's just that the first Signed-off should be from the original autho=
r.
> > > (And the sender the second)
> > > In the co-developed-by case (see Kernel documentation) the order
> > > doesn't matter.
> >
> > Holding off on this patch till we could clarify the authorship.
>
> I'd say let's attribute the authorship to Doug. FTR, the original
> downstream Chrome OS patch is https://crrev.com/c/278190.
>
> Not sure if the information in the commit message of the original
> patch is relevant for the upstream version, in the end it seems LPM
> was never implemented, so it should be sufficient to say what is
> actually done today.
>
> In summary, I propose to take the patch with the current commit
> message, with Doug as the author. Heiko, can you change the authorship
> or should I send a new version?
>
> Doug if you have objections or want updates in the commit message
> (yours tend to be more verbose ;-), holler.

It's fine with me.

-Doug
