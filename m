From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 2/3] gpio: wm831x: Add basic device tree support
Date: Wed, 15 Mar 2017 09:41:56 +0000
Message-ID: <20170315094156.GG6986@localhost.localdomain>
References: <1488818804-9406-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1488818804-9406-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <CACRpkdYE_eOeUPaQXV3avCLxebmOjPqkjkK2PaMCa_2NOTNMpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYE_eOeUPaQXV3avCLxebmOjPqkjkK2PaMCa_2NOTNMpQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 15, 2017 at 10:18:31AM +0100, Linus Walleij wrote:
> On Mon, Mar 6, 2017 at 5:46 PM, Charles Keepax
> <ckeepax@opensource.wolfsonmicro.com> wrote:
> 
> > Now the wm831x-core has basic DT support we can update this driver to
> > allow use of the GPIOs within a device tree system.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Patch applied.
> 

This needs to go through Lee's tree with the patch above it has a
build dependency on it.

Thanks,
Charles
