From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] arm64: dts: rockchip: use canonical compatible for touchpad/touchscreen
Date: Wed, 2 May 2018 09:53:00 -0700
Message-ID: <CA+ASDXOFEQwfis9ziXcG1BTH2muWPTZh-fZX9xPU4KgyNeWCPA@mail.gmail.com>
References: <20180501224628.GA150745@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180501224628.GA150745@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Kaehlcke <mka@chromium.org>, Emil Renner Berthing <kernel@esmil.dk>, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 1, 2018 at 3:46 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> "atmel,atmel_mxt_tp" and "atmel,atmel_mxt_ts" are ChromeOS inventions,
> let's replace them with canonical compatible string "atmel,maxtouch".
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

I guess the other IDs are in the driver just for non-DT usage? Anyway,
seems fine:

Reviewed-by: Brian Norris <briannorris@chromium.org>
