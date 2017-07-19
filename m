From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/4] gpio: davinci: Use devm_gpiochip_add_data in place
 of gpiochip_add_data
Date: Wed, 19 Jul 2017 11:37:22 +0200
Message-ID: <20170719093722.GW29638@localhost>
References: <1500375436-9435-1-git-send-email-j-keerthy@ti.com>
 <1500375436-9435-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500375436-9435-2-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: linus.walleij@linaro.org, ssantosh@kernel.org, devicetree@vger.kernel.org, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, fcooper@ti.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 04:27:13PM +0530, Keerthy wrote:
> Use the devm version of gpiochip_add_data and pass on the
> return value. Reset the static variables to 0 before returning.

You need to describe not just what you do, but also why you it. In this
case, your fixing memory leaks and the gpio chip being left registered
if this driver is unbound.

Johan
