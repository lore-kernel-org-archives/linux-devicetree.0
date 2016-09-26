From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v7 2/2] clocksource: add J-Core timer/clocksource driver
Date: Mon, 26 Sep 2016 23:27:14 +0200
Message-ID: <4b02ba7d-4a31-297a-bbbd-be26da615e7b@linaro.org>
References: <cover.1474693319.git.dalias@libc.org>
 <22c1ee0f908fe3bf8b70f5e87d659ceb29af1434.1474693319.git.dalias@libc.org>
 <20160926210716.GA12855@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160926210716.GA12855@brightrain.aerifal.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Rich Felker <dalias@libc.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Mark Rutland <Mark.Rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 26/09/2016 23:07, Rich Felker wrote:
> Ping. Is there anything that still needs to be changed for this driver
> to be acceptable?
> 

It is on my radar. I'm reviewing it.

Can you elaborate the workaround mentioned in the changelog. I have been
digging into the lkml@ thread but it is not clear if the issue is
related to the time framework, the driver itself or whatever else. Can
you clarify that ?

Regarding the previous version, did you reach a consensus regarding
per_cpu irq with Mark Rutland ?

Thanks.

  -- Daniel

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
