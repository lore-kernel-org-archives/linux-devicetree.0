From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] i2c: rk3x: Give the tuning value 0 during rk3x_i2c_v0_calc_timings
Date: Mon, 24 Oct 2016 11:29:54 -0700
Message-ID: <CAD=FV=VKJhaZtfT7CZBN1UE0-aHpJrMPYUDicO6vAcNUvfOP5g@mail.gmail.com>
References: <1477125822-30644-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1477125822-30644-1-git-send-email-david.wu@rock-chips.com>
Sender: linux-i2c-owner@vger.kernel.org
To: David Wu <david.wu@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Wolfram Sang <wsa@the-dreams.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Oct 22, 2016 at 1:43 AM, David Wu <david.wu@rock-chips.com> wrote:
> We found a bug that i2c transfer sometimes failed on 3066a board with
> stabel-4.8, the con register would be updated by uninitialized tuning
> value, it made the i2c transfer failed.
>
> So give the tuning value to be zero during rk3x_i2c_v0_calc_timings.
>
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> ---
>  drivers/i2c/busses/i2c-rk3x.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
