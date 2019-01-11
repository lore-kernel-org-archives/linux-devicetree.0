Return-Path: <SRS0=Muqj=PT=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com> <20190103164102.31437-5-thomas.petazzoni@bootlin.com>
In-Reply-To: <20190103164102.31437-5-thomas.petazzoni@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jan 2019 11:14:49 +0100
Message-ID: <CACRpkdY4A_Yvv3cKmvYio_9w2HMw9retG-4feydn47sDQY62ig@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio: pca953x: add ->set_config implementation
Content-Type: text/plain; charset="UTF-8"
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jan 3, 2019 at 5:41 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> This commit adds a minimal implementation of the ->set_config() hook,
> with support for the PIN_CONFIG_BIAS_PULL_UP and
> PIN_CONFIG_BIAS_PULL_DOWN configurations.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This looks OK to me, but IIUC not all versions of the PCA953x supports
this?

So we need to make sure that you return -ENOTSUPP if the device
does not support setting pull up/down.

Also there are configs for debounce too, right? I suggested to add
that first but I have no strong opinion on it.

Yours,
Linus Walleij
