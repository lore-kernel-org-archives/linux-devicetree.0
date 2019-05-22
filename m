From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: rockchip: disable GPU 500 MHz OPP for veyron
Date: Wed, 22 May 2019 11:13:45 -0700
Message-ID: <CAD=FV=Ww5pYOdknESUC4S06FvPzZ03Z-tW098r2N+9tbHNx7Vw@mail.gmail.com>
References: <20190520220051.54847-1-mka@chromium.org> <3108277.JP5bvJISVS@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3108277.JP5bvJISVS@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 22, 2019 at 2:14 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Dienstag, 21. Mai 2019, 00:00:49 CEST schrieb Matthias Kaehlcke:
> > The NPLL is the only safe way to generate 500 MHz for the GPU. The
> > downstream Chrome OS 3.14 kernel ('official' kernel for veyron
> > devices) re-purposes NPLL to HDMI and hence disables the OPP for
> > the GPU (see https://crrev.com/c/1574579). Disable it here as well
> > to keep in sync and avoid problems in case someone decides to
> > re-purpose NPLL.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>
> I was actually expecting to just drop the 500MHz opp from all
> of rk3288 ;-) .
>
> To not have to respin, I just modified your patch accordingly,
> see [0] and please holler if you disagree :-D .

Seems fine to me, thanks!

-Doug
