From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] DT binding: gpio-zynq: Document interrupt-controller
Date: Tue, 27 Oct 2015 17:03:29 +0100
Message-ID: <CACRpkdan7oFcTWSF-fE-BiOsk4Pji7DgimfMji_eb3RGjdA4RQ@mail.gmail.com>
References: <1445617532-10228-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445617532-10228-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 23, 2015 at 6:25 PM, Soren Brinkmann
<soren.brinkmann@xilinx.com> wrote:

> HW and driver support the GPIO as interrupt-controller. Document that in
> the DT binding.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

Patch subject augmented and applied.

> +- interrupt-controller : Marks the device node as an interrupt controller.
> +- #interrupt-cells     : Should be 2.  The first cell is the GPIO number.
> +                         The second cell bits[3:0] is used to specify trigger type and level flags:
> +                             1 = low-to-high edge triggered.
> +                             2 = high-to-low edge triggered.
> +                             4 = active high level-sensitive.
> +                             8 = active low level-sensitive.

If these can be or:ed together, e.g 3 = both edges, that needs to be
documented. If they can't the current patch is fine I guess.

Yours,
Linus Walleij
