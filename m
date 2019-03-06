From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: device tree binding for poly-phased regulators
Date: Wed, 6 Mar 2019 11:47:47 +0800
Message-ID: <CAGb2v66GQUzp1oz-J_Boea_S_mWAkBaiZ=A5uSqEb3pNNvaCzA@mail.gmail.com>
References: <20190222112151.GA23266@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222112151.GA23266@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Torsten Duwe <duwe@lst.de>
Cc: Carlo Caione <carlo@caione.org>, Olliver Schinagl <oliver@schinagl.nl>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jagan Teki <jagan@amarulasolutions.com>, Icenowy Zheng <icenowy@aosc.io>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 7:21 PM Torsten Duwe <duwe@lst.de> wrote:
>
> Hi!
>
> Documentation/devicetree/bindings/mfd/axp20x.txt nicely describes the
> capabilities of the X-powers PMICs; however, it seems polyphasing is
> left to comments only.
>
> May I suggest to add a property "poly-phased", just to get the discussion
> started? It could be a simple property in the current case for the axp803
> and axp806 ("poly-phased with you-know-which") or a phandle in the future.

These PMICs are customized in a way that the outputs are poly-phased by
default. They are customized to match a specific SoC, and that is about
the only use for them. As such, there's really no way to test whether a
poly-phase property and implementation works or not. If you get it wrong
you risk frying your device.

A poly-phase property in genernal would be nice, however I don't think
this is the right device to start with.

> BTW the axp803 datasheet is quite terse in that respect: is there one
> "master" reulator whose settings are copied or does a driver have to keep
> them in sync.

The datasheet says, when outputs are poly-phased, only the settings of the
first phase applies, i.e. the other settings are ignored, not even copied.

ChenYu
