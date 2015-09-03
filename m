From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: dts: Add ddc i2c reference to veyron
Date: Thu, 3 Sep 2015 14:00:26 -0700
Message-ID: <CAD=FV=WkFPitTsagQa+94DAWujzYECVqk7fO+OUdrfFq3bWTuQ@mail.gmail.com>
References: <1441229148-12095-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441229148-12095-1-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Alexandru Stan <amstan@chromium.org>, Brian Norris <briannorris@chromium.org>, Yakir Yang <ykk@rock-chips.com>, =?UTF-8?B?5aea5pm65oOF?= <mark.yao@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Sep 2, 2015 at 2:25 PM, Douglas Anderson <dianders@chromium.org> wrote:
> The ddc-i2c-bus property was missing from the veyron dtsi file since
> downstream the ddc-i2c-bus was still being specified in rk3288.dtsi and
> nobody noticed when the veyron dtsi was sent upstream.  Add it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Note: I noticed that this was wrong but I don't currently have
> graphics up and running on upstream on veyron.  Posting this anyway
> since it's pretty clear that it's needed.  If someone else wants to
> try it out that'd be nice, otherwise I'll put it on my list to figure
> out how to get myself setup for graphics upstream.  ;)

OK, I've used Heiko's "somewhat stable" branch to test this against
something very close to mainline.

Without my patch I can't read the HDMI EDID.  With my patch I can.  :)

-Doug
