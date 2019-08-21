From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
Date: Wed, 21 Aug 2019 12:43:49 -0500
Message-ID: <CAL_JsqJoMAHWDonXVik=y1D=_sx20OAzueBtB+YuSwzwU6iVFw@mail.gmail.com>
References: <20190820195959.6126-1-robh@kernel.org> <174045783.D6yh98NvXX@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <174045783.D6yh98NvXX@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Neil Armstrong <narmstrong@baylibre.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 12:24 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Dienstag, 20. August 2019, 21:59:56 CEST schrieb Rob Herring:
> > This series converts the various Arm Mali GPU bindings to use the DT
> > schema format.
> >
> > The Midgard and Bifrost bindings generate warnings on 'interrupt-names'
> > because there's all different ordering. The Utgard binding generates
> > warnings on Rockchip platforms because 'clock-names' order is reversed.
>
> Are you planning on sending fixes for these, should I just change the
> ordering myself?

I wasn't planning on it. I just add warnings. :)

>
> > Rob Herring (3):
> >   dt-bindings: Convert Arm Mali Midgard GPU to DT schema
> >   dt-bindings: Convert Arm Mali Bifrost GPU to DT schema
> >   dt-bindings: Convert Arm Mali Utgard GPU to DT schema
>
> Acked-by: Heiko Stuebner <heiko@sntech.de>

Thanks.

Rob
