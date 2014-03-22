From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 3/3] ARM: dts: socfpga: add gpio pieces
Date: Sat, 22 Mar 2014 12:28:17 +0100
Message-ID: <532D73D1.7020408@linutronix.de>
References: <1395345324-18299-1-git-send-email-bigeasy@linutronix.de>	<1395345324-18299-4-git-send-email-bigeasy@linutronix.de>	<CANk1AXRa4V1ADNaT+T3pYF4zyxni9Y8rmU9UYRoA_7NxW8KWEg@mail.gmail.com> <CANk1AXSQVFZvRmvYt+JF+TDVpfX-_RLiUcQXotGzpHoTMUVymQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CANk1AXSQVFZvRmvYt+JF+TDVpfX-_RLiUcQXotGzpHoTMUVymQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: delicious quinoa <delicious.quinoa@gmail.com>
Cc: Alan Tull <atull@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/21/2014 11:15 PM, delicious quinoa wrote:
> snps,nr-gpios = <27>;
> 
> As noted on other thread, gpio2 is 27 wide, despite what the
> documentation says.  When I made that change and remove your other two
> patches the gpios worked for me on a cyclone5 devkit board.
> 
> So if you fix the "#gpio-cells = <2>;" for all 3 gpios and fix
> "snps,nr-gpios = <27>;" for gpio2, then this one patch looks good to
> me.  With these changes,

Okay will do. And I also add a note that  the reference manual is wrong
here.

> 
> Acked-by: Alan Tull <atull@altera.com>
> 
> Alan Tull
> aka
> delicous quinoa

Sebastian
