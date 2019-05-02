From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V2 0/3] watchdog: stm32: add dynamic prescaler support
Date: Thu, 2 May 2019 13:37:46 -0700
Message-ID: <20190502203746.GB29063@roeck-us.net>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Thu, May 02, 2019 at 04:08:43PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch series updates stm32 watchdog driver on:
> -use devm_watchdog_register_device
> -Guenter's recommendation about return value:
> set_timeout return 0 on succes, -EINVAL for "parameter out of range"
> and -EIO for "could not write value to the watchdog".

No, sorry, that is not what I meant.

set_timeout() should set ->timeout either to the requested value
if equal to or larger than the maximum timeout supported by the
hardware, and to the actually selected timeout otherwise.

Guenter

> Set of reload and prescaler registers are stay in start function,
> because the stm32 watchdog must be enabled to write these registers.
> -adds dynamic prescaler support
> 
> Ludovic Barre (3):
>   watchdog: stm32: update to devm_watchdog_register_device
>   watchdog: stm32: update return values recommended by watchdog kernel
>     api
>   watchdog: stm32: add dynamic prescaler support
> 
>  drivers/watchdog/stm32_iwdg.c | 96 ++++++++++++++++++++++++-------------------
>  1 file changed, 54 insertions(+), 42 deletions(-)
> 
> -- 
> 2.7.4
> 
