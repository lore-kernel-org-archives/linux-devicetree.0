From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: use canonical compatible for touchpad/touchscreen
Date: Thu, 03 May 2018 14:36:13 +0200
Message-ID: <3507285.Efm3MEd05V@phil>
References: <20180501224628.GA150745@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180501224628.GA150745@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Kaehlcke <mka@chromium.org>, Brian Norris <briannorris@chromium.org>, Emil Renner Berthing <kernel@esmil.dk>, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 2. Mai 2018, 00:46:28 CEST schrieb Dmitry Torokhov:
> "atmel,atmel_mxt_tp" and "atmel,atmel_mxt_ts" are ChromeOS inventions,
> let's replace them with canonical compatible string "atmel,maxtouch".
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

I've amended the patch subject with a "on gru-kevin" and applied
it for 4.18 with Brian's Reviewed-by


Thanks
Heiko
