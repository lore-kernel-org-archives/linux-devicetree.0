From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Configure BT_HOST_WAKE as wake-up signal on veyron
Date: Wed, 05 Jun 2019 23:52:00 +0200
Message-ID: <2828678.vPWIEPrON5@diego>
References: <20190605204320.22343-1-mka@chromium.org> <3079472.D8Re4Zsj2W@diego> <20190605212427.GP40515@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605212427.GP40515@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 5. Juni 2019, 23:24:27 CEST schrieb Matthias Kaehlcke:
> On Wed, Jun 05, 2019 at 11:11:12PM +0200, Heiko Stübner wrote:
> > Am Mittwoch, 5. Juni 2019, 22:43:20 CEST schrieb Matthias Kaehlcke:
> > > This enables wake up on Bluetooth activity when the device is
> > > suspended. The BT_HOST_WAKE signal is only connected on devices
> > > with BT module that are connected through UART.
> > > 
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > 
> > Housekeeping question, with the two Signed-off-by lines, is Doug the
> > original author, or was this Co-developer-by?
> 
> Good question, it's derived from Doug's patch for CrOS 3.14 and
> https://crrev.com/c/1575556 also from Doug. Let's say I did the
> porting to upstream, but I'm pretty sure Doug spent more time on it.
> 
> Maybe I should resend it with Doug as author and include the original
> commit message, which has more information.

It's just that the first Signed-off should be from the original author.
(And the sender the second)
In the co-developed-by case (see Kernel documentation) the order
doesn't matter.
