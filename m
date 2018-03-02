From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: Add Spreadtrum EIC controller
 documentation
Date: Fri, 2 Mar 2018 16:08:57 -0600
Message-ID: <20180302220857.obqi5sju6iyepl7m@rob-hp-laptop>
References: <334505d3a13a73ad347427b408ed581832434289.1519468782.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <334505d3a13a73ad347427b408ed581832434289.1519468782.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org, andy.shevchenko@gmail.com
List-Id: devicetree@vger.kernel.org

On Sat, Feb 24, 2018 at 06:44:18PM +0800, Baolin Wang wrote:
> This patch adds the device tree bindings for the Spreadtrum EIC
> controller. The EIC can be seen as a special type of GPIO, which
> can only be used as input mode.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes since v1:
>  - Fix some typos and grammar issues.
>  - Add more explanation to make things clear.
>  - List all device nodes as examples.
> ---
>  .../devicetree/bindings/gpio/gpio-eic-sprd.txt     |   97 ++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-eic-sprd.txt

Reviewed-by: Rob Herring <robh@kernel.org>
