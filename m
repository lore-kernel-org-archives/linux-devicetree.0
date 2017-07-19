From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 1/4] gpio: davinci: Use devm_gpiochip_add_data in place of
 gpiochip_add_data
Date: Wed, 19 Jul 2017 15:28:21 +0530
Message-ID: <32f70ccc-e52e-af86-87ec-f7a243d518b0@ti.com>
References: <1500375436-9435-1-git-send-email-j-keerthy@ti.com>
 <1500375436-9435-2-git-send-email-j-keerthy@ti.com>
 <20170719093722.GW29638@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170719093722.GW29638@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Johan Hovold <johan@kernel.org>
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, fcooper@ti.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Wednesday 19 July 2017 03:07 PM, Johan Hovold wrote:
> On Tue, Jul 18, 2017 at 04:27:13PM +0530, Keerthy wrote:
>> Use the devm version of gpiochip_add_data and pass on the
>> return value. Reset the static variables to 0 before returning.
> 
> You need to describe not just what you do, but also why you it. In this
> case, your fixing memory leaks and the gpio chip being left registered
> if this driver is unbound.

Sure i can add more description as mentioned above.

> 
> Johan
> 
