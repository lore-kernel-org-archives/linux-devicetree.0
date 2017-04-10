From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/9] pinctrl: generic: Add bi-directional and
 output-enable
Date: Mon, 10 Apr 2017 13:06:06 -0500
Message-ID: <20170410180606.jb4tkwipj4rruwsr@rob-hp-laptop>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
 <1491401247-7030-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491401247-7030-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, mark.rutland@arm.com, linux@armlinux.org.uk, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 05, 2017 at 04:07:19PM +0200, Jacopo Mondi wrote:
> Add bi-directional and output-enable pin configuration properties.
> 
> bi-directional allows to specify when a pin shall operate in input and
> output mode at the same time. This is particularly useful in platforms
> where input and output buffers have to be manually enabled.
> 
> output-enable is just syntactic sugar to specify that a pin shall
> operate in output mode, ignoring the provided argument.
> This pairs with input-enable pin configuration option.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 2 ++
>  drivers/pinctrl/pinconf-generic.c                              | 3 +++
>  include/linux/pinctrl/pinconf-generic.h                        | 3 +++
>  3 files changed, 8 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
