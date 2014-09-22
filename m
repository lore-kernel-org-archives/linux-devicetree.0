From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 1/2] regulator: st-pwm: get voltage and duty table from dts
Date: Sun, 21 Sep 2014 21:18:10 -0700
Message-ID: <CAD=FV=VxqQhp8A_yGMe8U+_Z1DNzLvMp-Bsj_iEx=5mumeHpvw@mail.gmail.com>
References: <1411354380-14326-1-git-send-email-zyw@rock-chips.com>
	<1411354380-14326-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411354380-14326-2-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Chris,

On Sun, Sep 21, 2014 at 7:52 PM, Chris Zhong <zyw@rock-chips.com> wrote:
> Get voltage & duty table from device tree might be better, other platforms can also use this
> driver without any modify.
>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>

No need to re-spin, but please remember that all tags should be
bunched together (no blank lines).  In other words,

YES:

> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>

NO:

> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
