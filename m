From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: Update iProc GPIO bindings
Date: Tue, 19 Jul 2016 20:14:04 -0500
Message-ID: <20160720011404.GA5332@rob-hp-laptop>
References: <1468862418-31477-1-git-send-email-ray.jui@broadcom.com>
 <1468862418-31477-2-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468862418-31477-2-git-send-email-ray.jui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 18, 2016 at 10:20:17AM -0700, Ray Jui wrote:
> Update the iProc GPIO binding document to add new compatible strings
> "brcm,iproc-nsp-gpio" and "brcm,iproc-stingray-gpio" to support the
> iProc based GPIO controller used in the NSP and Stingray SoCs,
> respectively
> 
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> ---
>  .../devicetree/bindings/pinctrl/brcm,iproc-gpio.txt    | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
