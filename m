From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 1/8] dt-bindings: mfd: Add Altera Arria10 System
 Resource Chip bindings
Date: Mon, 6 Jun 2016 08:28:27 -0500
Message-ID: <20160606132827.GA17802@rob-hp-laptop>
References: <1464889948-28793-1-git-send-email-tthayer@opensource.altera.com>
 <1464889948-28793-2-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464889948-28793-2-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 02, 2016 at 12:52:21PM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> The Altera Arria10 Devkit System Resource chip is a Multi-Function
> Device with a GPIO expander.
> 
> This patch adds documentation for the Altera A10-SR DT bindings.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2  Addition of IRQ controller bindings.
>     Removal of hw_mon sub-device.
> ---
>  .../devicetree/bindings/mfd/altera-a10sr.txt       |   46 ++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt

Acked-by: Rob Herring <robh@kernel.org>
