From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: mt8183: add thermal zone node
Date: Thu, 30 May 2019 09:08:25 -0700
Message-ID: <20190530160825.GM40515@google.com>
References: <1557494826-6044-1-git-send-email-michael.kao@mediatek.com>
 <1557494826-6044-2-git-send-email-michael.kao@mediatek.com>
 <CAJMQK-giJTeERnqjxoSMjF-JXxW9SPmeARWf3f9ZyRgBsYN5fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJMQK-giJTeERnqjxoSMjF-JXxW9SPmeARWf3f9ZyRgBsYN5fg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "michael.kao" <michael.kao@mediatek.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2019 at 02:27:28PM +0800, Hsin-Yi Wang wrote:
> On Fri, May 10, 2019 at 9:27 PM michael.kao <michael.kao@mediatek.com> wrote:
> 
> > +
> > +                       tzts1: tzts1 {
> > +                               polling-delay-passive = <0>;
> > +                               polling-delay = <0>;
> > +                               thermal-sensors = <&thermal 1>;
> > +                               sustainable-power = <0>;
> > +                               trips {};
> > +                               cooling-maps {};
> > +                       };
> > +
> Is 0 a valid initial sustainable-power setting? Since we'll still get
> warning[1] about this, though it might not be harmful.
> 
> If 0 is a valid setting, maybe we should consider showing the warning
> of not setting this property in [2]?
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/thermal/power_allocator.c#L570
> [2] https://elixir.bootlin.com/linux/latest/source/drivers/thermal/of-thermal.c#L1049

IIUC a value of 0 is pointless, the thermal framework will still use
an estimated value:

https://elixir.bootlin.com/linux/v5.1.5/source/drivers/thermal/power_allocator.c#L203

As commented on v1 (https://patchwork.kernel.org/patch/10926519/#22620905)
the value of the property may depend on the thermal characteristics of
the device, there is not one correct value per SoC/core. If it is
specified at SoC level device makers should be aware that they might
have to override it for 'optimal' behavior on their device.
