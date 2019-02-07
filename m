Return-Path: <SRS0=K5hT=QO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55123 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfBGOoN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Feb 2019 09:44:13 -0500
Date: Thu, 7 Feb 2019 15:44:09 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 4/4] gpio: pca953x: add ->set_config implementation
Message-ID: <20190207154409.7ed02a1d@windsurf>
In-Reply-To: <CACRpkdY4A_Yvv3cKmvYio_9w2HMw9retG-4feydn47sDQY62ig@mail.gmail.com>
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
        <20190103164102.31437-5-thomas.petazzoni@bootlin.com>
        <CACRpkdY4A_Yvv3cKmvYio_9w2HMw9retG-4feydn47sDQY62ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hello Linus,

On Fri, 11 Jan 2019 11:14:49 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> > This commit adds a minimal implementation of the ->set_config() hook,
> > with support for the PIN_CONFIG_BIAS_PULL_UP and
> > PIN_CONFIG_BIAS_PULL_DOWN configurations.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> This looks OK to me, but IIUC not all versions of the PCA953x supports
> this?
> 
> So we need to make sure that you return -ENOTSUPP if the device
> does not support setting pull up/down.

Indeed, I've added a check for this.

> Also there are configs for debounce too, right? I suggested to add
> that first but I have no strong opinion on it.

The particular PCA variant that I have does not have any debounce
related capability it seems, so I won't be able to implement this
aspect.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
