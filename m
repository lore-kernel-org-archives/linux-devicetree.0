From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/11] dt-bindings: mfd: Add Altera Arria10 System
 Resource Chip bindings
Date: Mon, 25 Apr 2016 07:55:14 -0500
Message-ID: <20160425125514.GA5100@rob-hp-laptop>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
 <1461339219-15255-2-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461339219-15255-2-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 22, 2016 at 10:33:29AM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> The Altera Arria10 Devkit System Resource chip is a Multi-Function
> Device with a GPIO expander and power supply alarm.

An alarm with no interrupt? Are the GPIOs interrupt capable?
 
> This patch adds documentation for the Altera A10-SR DT bindings.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 ++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> 
