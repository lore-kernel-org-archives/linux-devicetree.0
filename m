From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 2/2] clocksource: sprd: Add timer driver for Spreadtrum
 SC9860 platform
Date: Tue, 2 Jan 2018 10:32:23 +0100
Message-ID: <3eac45c7-e11f-7054-4e3c-2a8800947b96@linaro.org>
References: <346a731ce967b56514b0838bbbd8b4f500cea040.1513075872.git.baolin.wang@spreadtrum.com>
 <c5948e4bec5b281fd61d8168bad8d35eb254476d.1513075872.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c5948e4bec5b281fd61d8168bad8d35eb254476d.1513075872.git.baolin.wang@spreadtrum.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

On 12/12/2017 12:28, Baolin Wang wrote:
> The Spreadtrum SC9860 platform will use the architected timers as local
> clock events, but we also need a broadcast timer device to wakeup the
> cpus when the cpus are in sleep mode.
> 
> The Spreadtrum timer can support 32bit or 64bit counter, as well as
> supporting period mode or one-shot mode.
> 
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> ---
Applied. Thanks.

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
