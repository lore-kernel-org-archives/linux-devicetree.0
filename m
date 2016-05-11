From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/2] Additional iProc GPIO support
Date: Wed, 11 May 2016 11:29:54 +0200
Message-ID: <CACRpkdb-4bE6kBcesqpmqrHJ2gnn6BaKrYKtD6v-H-WZn3P6qQ@mail.gmail.com>
References: <1462222308-4869-1-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1462222308-4869-1-git-send-email-ray.jui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 2, 2016 at 10:51 PM, Ray Jui <ray.jui@broadcom.com> wrote:

> Add support to the iProc GPIO driver for v2 and v3 revisions of the iProc GPIO
> controllers. The v2 revision is used on NSP with drive strength pinconf
> feature disabled and the v3 revision is used on Stingray with all pinconf
> features disabled
>
> Changes from v1:
>  - Changed to use compatible strings "brcm,iproc-gpio-v2" and
> "brcm,iproc-gpio-v3" to deal with differences among various iProc based SoCs
>  - Removed DT header "include/dt-bindings/pinctrl/brcm,iproc-gpio.h"
>
> Patch series is developed based on Linux v4.6-rc1 and available at:
> https://github.com/Broadcom/cygnus-linux/tree/iproc-gpio-v2

I'm waiting for the discussion about the compatible strings
to resolve.

Yours,
Linus Walleij
