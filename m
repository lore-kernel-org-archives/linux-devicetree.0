From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Configure BT_HOST_WAKE as
 wake-up signal on veyron
Date: Wed, 5 Jun 2019 14:24:27 -0700
Message-ID: <20190605212427.GP40515@google.com>
References: <20190605204320.22343-1-mka@chromium.org>
 <20190605204320.22343-2-mka@chromium.org>
 <3079472.D8Re4Zsj2W@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3079472.D8Re4Zsj2W@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 05, 2019 at 11:11:12PM +0200, Heiko Stübner wrote:
> Am Mittwoch, 5. Juni 2019, 22:43:20 CEST schrieb Matthias Kaehlcke:
> > This enables wake up on Bluetooth activity when the device is
> > suspended. The BT_HOST_WAKE signal is only connected on devices
> > with BT module that are connected through UART.
> > 
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Housekeeping question, with the two Signed-off-by lines, is Doug the
> original author, or was this Co-developer-by?

Good question, it's derived from Doug's patch for CrOS 3.14 and
https://crrev.com/c/1575556 also from Doug. Let's say I did the
porting to upstream, but I'm pretty sure Doug spent more time on it.

Maybe I should resend it with Doug as author and include the original
commit message, which has more information.
