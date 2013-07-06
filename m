From: Ulrich Prinz <ulrich.prinz@googlemail.com>
Subject: Re: [PATCH 9/9] clocksource: dw_apb_timer: special variant for rockchip
 rk3188 timers
Date: Sat, 06 Jul 2013 22:28:52 +0200
Message-ID: <51D87E04.3060704@googlemail.com>
References: <201307060051.09716.heiko@sntech.de> <201307060056.29370.heiko@sntech.de> <alpine.DEB.2.02.1307060153110.32106@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1307060153110.32106@ionos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, John Stultz <john.stultz@linaro.org>, Jamie Iles <jamie@jamieiles.com>, Dinh Nguyen <dinguyen@altera.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

Ok, ok...

I got the message. With modifying the existing driver to support more
function pointers in its system struct and assigning them at the
beginning, and using them on runtime, these quirks are obsolete.

Again, this is the first time I provide code to the kernel officially
and I learned from others that I should try it by modifying not too much
code if not needed.

Adding more function pointers to a system relevant structure, doubling
the number of functions and such didn't look non-invasive to me.

But, I totally agree with your argumentation and I even wanted to do it
in the way you explained in your replies. Just the courage was missing I
guess :)

Regards,
	Ulrich
