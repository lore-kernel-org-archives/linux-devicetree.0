From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] rtc: pcf8563: disable CLKOUT
Date: Tue, 13 Oct 2015 22:17:03 +0200
Message-ID: <20151013201703.GA3421@piout.net>
References: <1444712938-22865-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444712938-22865-1-git-send-email-hs@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Georg.Soffel@bosch-si.com, rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 13/10/2015 at 07:08:58 +0200, Heiko Schocher wrote :
> Disable the CLKOUT of the RTC after power-up.
> After power-up/reset of the RTC, CLKOUT is enabled by default,
> with CLKOUT enabled the RTC chip has 2-3 times higher power
> consumption. If you do not need CLKOUT, you can disable the
> CLKOUT with setting "disable-clkout" property.
> 

I think you can simply unconditionally disable clkout. My preferred way
of doing what you suggest is probably to register a clock in the CCF. If
the clock is not used, it will be automatically disabled.
It will also provide a generic way of setting the clkout frequency (some
RTC are able to output 32kHZ, 1kHz and 1Hz).

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
