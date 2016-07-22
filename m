From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] pinctrl: iproc: Add NSP and Stingray GPIO support
Date: Fri, 22 Jul 2016 16:48:35 +0200
Message-ID: <CACRpkda7RC6mpLgXLk46PxPFH1SJii-2RHFTyt9EZJWm2OHJTA@mail.gmail.com>
References: <1468862418-31477-1-git-send-email-ray.jui@broadcom.com> <1468862418-31477-3-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468862418-31477-3-git-send-email-ray.jui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pramod Kumar <pramodku@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 18, 2016 at 7:20 PM, Ray Jui <ray.jui@broadcom.com> wrote:

> The iProc GPIO controller is shared among multiple iProc based SoCs.
> In the NSP integration, the drive strength pinctrl function is
> disabled. In the integration of Stingray, pinctrl is handled by another
> block and this GPIO controller is solely used as a GPIO controller, and
> therefore should not be registered to the pinconf framework
>
> This patch introduces new SoC specific compatible strings
> "brcm,iproc-nsp-gpio" for NSP with drive strength feature disabled and
> "brcm,iproc-stingray-gpio" for Stingray with all PINCONF features
> disabled
>
> This patch is developed based on the initial work from Yendapally
> Reddy Dhananjaya <yendapally.reddy@broadcom.com> who attempted to
> disable drive strength configuration for the iProc based NSP chip. In
> addition, Pramod Kumar <pramod.kumar@broadcom.com> also contributed to
> make the support more generic across all currently supported PINCONF
> functions in the iProc GPIO/PINCONF driver
>
> Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>

Patch applied. I see no reason to hold it back, if it survives the
test builds.

Yours,
Linus Walleij
