From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 0/4] Various fixes on STM32 RTC
Date: Thu, 19 Apr 2018 15:43:21 +0200
Message-ID: <20180419134321.GF7369@piout.net>
References: <1524144103-21432-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524144103-21432-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Both series were not sent to the correct email address. I would suggest
rebasing on top of v4.17-rc1 ;). No need to resend just for that.

On 19/04/2018 15:21:39+0200, Amelie Delaunay wrote:
> This series makes some corrections on STM32 RTC:
> - update copyright and adopt SPDX identifier
> - fix alarm interrupt flags
> - rework DBP (Disable Backup domain Protection) management.
> 
> This series is a preamble to the serie which will introduce next STM32 RTC
> version.
> 
> Amelie Delaunay (4):
>   rtc: stm32: fix copyright and adopt SPDX identifier
>   rtc: stm32: fix alarm interrupt flags by removing IRQF_TRIGGER_RISING
>   dt-bindings: rtc: update stm32-rtc documentation for st,syscfg
>     property
>   rtc: stm32: get DBP register and mask from DT st,syscfg property
> 
>  .../devicetree/bindings/rtc/st,stm32-rtc.txt       | 10 ++--
>  drivers/rtc/rtc-stm32.c                            | 68 +++++++++++++---------
>  2 files changed, 47 insertions(+), 31 deletions(-)
> 
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
