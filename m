From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 2/2] ARM: dts: rockchip: Add the OTP gpio pinctrl
Date: Wed, 21 Oct 2015 06:36:12 -0700
Message-ID: <CAD=FV=WN1uuvTakn7qsLgMNGbZgREeNU65==QgS-2AeBuDPN9w@mail.gmail.com>
References: <1445395380-5365-1-git-send-email-wxt@rock-chips.com>
	<1445395380-5365-3-git-send-email-wxt@rock-chips.com>
	<CAD=FV=WbnWXD1HCON-VHfqSqtp=GFwbsj+g2G8A159CEaEiFYQ@mail.gmail.com>
	<562717CD.3040601@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <562717CD.3040601@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Caesar,

On Tue, Oct 20, 2015 at 9:42 PM, Caesar Wang <wxt@rock-chips.com> wrote:
> I think the description is right,   maybe need other decriptions.
> The tshut polarity is low in a short period of time when the TSADC
> controller is reset.
>
> In other words,
>
> If T < (setting temperature), the OTP output the High Signal. ------> if the
> otp out polarity is high, the TSHUT will work.
> If T > (setting temperature), the OTP output the Low Signal.

Ah!  I re-read the cover letter more carefully and now I see.  OK, I
think your current description is fine, then.  ;)

-Doug
