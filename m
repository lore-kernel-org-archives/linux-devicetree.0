From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: syscon: Add support for the Xylon LogiCVC GPIOs
Date: Fri, 4 Oct 2019 23:24:04 +0200
Message-ID: <CACRpkdbtFQWJK_RtdHrh8hr9HTq4Pmnd9VXC11H45w9XvGCU2w@mail.gmail.com>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
 <20190910152855.111588-3-paul.kocialkowski@bootlin.com> <CACRpkdY40PZc9R-yFwooR4-WMgn3LH7K+yTx00ZNxyq6OOnw6A@mail.gmail.com>
 <20190923133325.GA57525@aptenodytes>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190923133325.GA57525@aptenodytes>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2019 at 3:33 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> Maybe a first step would be to introduce Kconfig options for each device and
> ifdef around in the code, as to solve the "built unconditionally" aspect?

ifdefs is something we try to avoid using too much, better for things
to have their own files and use a library, usually, it's cleaner.

Yours,
Linus Walleij
