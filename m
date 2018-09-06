Return-Path: <SRS0=JzHo=LU=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20180905132618.31274-1-vincent.whitchurch@axis.com>
 <20180905132618.31274-2-vincent.whitchurch@axis.com> <CACRpkdaOU+dumvVsrsjm5C=uo-cKLKqG2iwAwy=Xh9vbjq3UtQ@mail.gmail.com>
 <CAMRc=McbWJdaKbWnoXF7+-TTKA=dkWCnHJmZybcfQOPNcm9q+A@mail.gmail.com>
In-Reply-To: <CAMRc=McbWJdaKbWnoXF7+-TTKA=dkWCnHJmZybcfQOPNcm9q+A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Sep 2018 14:47:23 +0200
Message-ID: <CACRpkdaFsdk8LKOQcQ4pab1J_LKo8+StCF9f93+1PX_0hm+Cug@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: Add binding for gpio-mockup
Content-Type: text/plain; charset="UTF-8"
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: vincent.whitchurch@axis.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 6, 2018 at 1:09 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Do we even need DT bindings for this? Device tree bindings mean that
> we commit to a stable interface so that once a device with given DT
> blob is released, it will work on every future kernel. Also: DT should
> only include information about actual HW, not operating system
> concepts. Meanwhile this is for testing purposes only and it won't end
> up in any actual DT source file upstream.

Hm that relates to another discussion I have with the DT maintainers
about a virtualized display panel.

I do not know how the DT maintainers feel about supporting things
in the kernel that uses DT infrastructure and specially tailored
device trees but include elements with no formal device tree
bindings. Would be interesting to hear their thoughts on this.

Yours,
Linus Walleij
