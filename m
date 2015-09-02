From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: rockchip: pull up cts lines on rk3288
Date: Wed, 2 Sep 2015 16:34:38 -0700
Message-ID: <CAD=FV=XRLnz3FTbwg1u2Jwg=a3dim6vwLk0yGc9kK=RGYDvxXw@mail.gmail.com>
References: <1441236479-4941-1-git-send-email-amstan@chromium.org>
	<1441236479-4941-2-git-send-email-amstan@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441236479-4941-2-git-send-email-amstan@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru M Stan <amstan@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Romain Perier <romain.perier@gmail.com>, FUKAUMI Naoki <naobsd@gmail.com>, Neil Hendin <nhendin@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Alex,

On Wed, Sep 2, 2015 at 4:27 PM, Alexandru M Stan <amstan@chromium.org> wrote:
> The flow control lines from a user accessible UART are optional,
> the user might not have anything connected to those pins.
> In order to prevent random interrupts happening and noise affecting
> the cts pin should be pulled up.
>
> Note that the default state for that pin on the rk3288 is pulled up,
> so this patch merely restores them.
>
> This is similar to what we're already doing with the RX pin,
> so it should be safe. At worst it might be a slightly higher power usage
> (through ~50 kohms) when the cts is low.
>
> Suggested-by: Neil Hendin <nhendin@chromium.org>
> Signed-off-by: Alexandru M Stan <amstan@chromium.org>
> ---
> Changes in v2: None

Probably not entirely true.  ;)

>  arch/arm/boot/dts/rk3288.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
