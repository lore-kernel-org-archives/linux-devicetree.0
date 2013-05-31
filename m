From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH 2/2] rtc: omap: add rtc wakeup support to alarm events
Date: Fri, 31 May 2013 10:41:22 -0700
Message-ID: <87a9nb2gjh.fsf@linaro.org>
References: <1369982005-8572-1-git-send-email-gururaja.hebbar@ti.com>
	<1369982005-8572-3-git-send-email-gururaja.hebbar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1369982005-8572-3-git-send-email-gururaja.hebbar@ti.com> (Hebbar
	Gururaja's message of "Fri, 31 May 2013 12:03:25 +0530")
Sender: linux-doc-owner@vger.kernel.org
To: Hebbar Gururaja <gururaja.hebbar@ti.com>
Cc: akpm@linux-foundation.org, linux@arm.linux.org.uk, zonque@gmail.com, linux-arm-kernel@lists.infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, a.zummo@towertech.it, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, davinci-linux-open-source@linux.davincidsp.com, vaibhav.bedia@ti.com, sudhakar.raj@ti.com
List-Id: devicetree@vger.kernel.org

Hebbar Gururaja <gururaja.hebbar@ti.com> writes:

> On some platforms (like AM33xx), a special register (RTC_IRQWAKEEN)
> is available to enable Wakeup feature for Alarm Events.
>
> Since new platforms/Boards are now added through DT only, this feature
> is supported via DT property only.

> Platforms using such IP should add the property "ti,has_irq_wake_enb"
> in rtc DT node.

This is a property of the IP, not the board.  Can't you detect this
based on the revision of the IP?

Kevin
