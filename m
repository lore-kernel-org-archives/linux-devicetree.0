From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: Add Spreadtrum GPIO controller
 documentation
Date: Wed, 7 Feb 2018 15:19:18 -0600
Message-ID: <20180207211918.whcxq2not7elokae@rob-hp-laptop>
References: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517795460.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2834309f69a1ec37b84a33f153a3d0b90336bcc6.1517795460.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org, andy.shevchenko@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Feb 05, 2018 at 09:55:10AM +0800, Baolin Wang wrote:
> This patch adds the device tree bindings for the Spreadtrum
> GPIO controller. The gpios will be supported by the GPIO
> generic library.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes since v1:
>  - No updates.
> ---
>  .../devicetree/bindings/gpio/gpio-sprd.txt         |   28 ++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sprd.txt

Please add acks/reviews when posting new versions.

Rob
