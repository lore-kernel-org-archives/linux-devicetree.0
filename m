From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 0/8] Ingenic JZ47xx Timer/Counter Unit drivers
Date: Sun, 18 Mar 2018 23:13:13 +0100
Message-ID: <aeb57b92-6932-9774-dc50-7563d30846bf@linaro.org>
References: <20180110224838.16711-2-paul@crapouillou.net>
 <20180317232901.14129-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180317232901.14129-1-paul@crapouillou.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>
Cc: James Hogan <jhogan@kernel.org>, Maarten ter Huurne <maarten@treewalker.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 18/03/2018 00:28, Paul Cercueil wrote:
> Hi,
> 
> This is the 4th version of my TCU patchset.
> 
> The major change is a greatly improved documentation, both in-code
> and as separate text files, to describe how the hardware works and
> how the devicetree bindings should be used.
> 
> There are also cosmetic changes in the irqchip driver, and the
> clocksource driver will now use as timers all TCU channels not
> requested by the TCU PWM driver.

Hi Paul,

I don't know why but you series appears in reply to [PATCH v3 2/9]. Not
sure if it is my mailer or how you are sending the patches but if it is
the latter can you in the future, when resending a new version, not use
the in-reply-to option. It will be easier to follow the versions.

Thanks.

 -- Daniel



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
