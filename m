From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Define values for the IPA
 governor for rock960
Date: Sat, 8 Jun 2019 00:18:20 +0200
Message-ID: <CACRpkdazSvjt0G58dQOr=cw6mJTptNd3ZmEXduXVh4=01YHNvQ@mail.gmail.com>
References: <20190604165802.7338-1-daniel.lezcano@linaro.org> <20190604165802.7338-2-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604165802.7338-2-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 4, 2019 at 6:58 PM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:

> The intelligent power allocator PID coefficient to be set in sysfs
> are:
>
>     k_d: 0
>     k_po: 79
>     k_i: 10
>     k_pu: 50

With all the other interesting parametrization in the device tree
I kind of wonder why the PID regulator constants defaults are
not set up from device tree?

Any specific reason?

To me it seems like the kind of stuff userpace will invariably just
get wrong or forget about (somebody just runs a different
distribution without the extra magic to set sysfs right) unless
we supply good defaults.

Yours,
Linus Walleij
