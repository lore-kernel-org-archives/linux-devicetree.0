From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/2] mfd: dt-bindings: add the description about dvs
 gpio for rk808
Date: Thu, 11 Dec 2014 14:05:24 -0800
Message-ID: <CAD=FV=XWPhQgt6xwC4C3=Bv4HbEXM=RpKSqFUWMp1UT7N0XvdA@mail.gmail.com>
References: <1418267802-13159-1-git-send-email-zyw@rock-chips.com>
	<1418267802-13159-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418267802-13159-2-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "broonie@kernel.org" <broonie@kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Zhang Qing <zhangqing@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Chris,

On Wed, Dec 10, 2014 at 7:16 PM, Chris Zhong <zyw@rock-chips.com> wrote:
> +- dvs-gpios:  buck1/2 can be controlled by gpio dvs, this is GPIO specifiers
> +  for 2 host gpio's used for dvs. The format of the gpio specifier depends in
> +  the gpio controller. If DVS GPIOs aren't present, voltage changes will happen
> +  without being very quickly with no slow ramp time.

Remove the words "without being"

I assume Mark would rather make that change himself instead of getting
a respin, so probably don't send out a new version unless other
changes are needed.

Reviewed-by: Doug Anderson <dianders@chromium.org>
