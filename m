From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 08/11] dt-bindings: mfd: Add Altera A10-SR power supply
 alarm
Date: Mon, 25 Apr 2016 07:57:13 -0500
Message-ID: <20160425125713.GA6578@rob-hp-laptop>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
 <1461339219-15255-9-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461339219-15255-9-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 22, 2016 at 10:33:36AM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add power supply alarm from the hwmon framework.

hwmon framework is a Linuxism that has nothing to do with the h/w 
description.
 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  .../devicetree/bindings/mfd/altera-a10sr.txt       |    8 ++++++++
>  1 file changed, 8 insertions(+)

Just squash this into the 1st patch.

Rob
