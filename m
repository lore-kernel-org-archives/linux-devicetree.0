From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/4] ARM: dts: add RK3288 suspend support
Date: Wed, 15 Oct 2014 20:43:27 -0700
Message-ID: <CAD=FV=W-A6Kb77et+eGrkHGizW2_2VcaGH8qQRG-7YOEKcZQ1g@mail.gmail.com>
References: <1413405987-16196-1-git-send-email-zyw@rock-chips.com>
	<1413406144-16329-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413406144-16329-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris <zyw@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tony Xie <xxx@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Chris,

On Wed, Oct 15, 2014 at 1:49 PM,  <zyw@rock-chips.com> wrote:
> From: Chris Zhong <zyw@rock-chips.com>
>
> add pmu_intmem subnode for suspend, add suspend pinctrl

Maybe mention that it's expected that board files will reference the
suspend pinctrl as part of the PMIC config?
