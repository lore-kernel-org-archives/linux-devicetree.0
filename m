From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 bus+gpio 5/5] dt-bindings: gpio: Document GPIOs via
 Moxtet bus
Date: Mon, 4 Mar 2019 10:53:26 +0100
Message-ID: <CACRpkdYqRzRSdu+xhO2NAt7NYovvkxoE6SCJCq5_UqfD4bY-zg@mail.gmail.com>
References: <20190301035852.26780-1-marek.behun@nic.cz> <20190301035852.26780-6-marek.behun@nic.cz>
 <CACRpkdYpjjpVNUXRgT=XY758FGtDYow2fvwpah37T_GjTvLauQ@mail.gmail.com> <20190304001701.0b1b9986@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304001701.0b1b9986@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Behun <marek.behun@nic.cz>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 4, 2019 at 12:17 AM Marek Behun <marek.behun@nic.cz> wrote:

> do you know who is responsible for merging into drivers/bus?

Usually the ARM SoC maintainers arm@kernel.org merge drivers
there. You should just send them a pull request and explain the
situation I think. Else they know who should deal with it.

Yours,
Linus Walleij
