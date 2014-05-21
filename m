From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v1 4/4] ARM: debug: qcom: Add APQ8084 DEBUG_LL UART
 support
Date: Wed, 21 May 2014 18:28:06 +0300
Message-ID: <1400686086.856.15.camel@iivanov-dev>
References: <1400684225-21381-1-git-send-email-gdjakov@mm-sol.com>
	 <1400684225-21381-5-git-send-email-gdjakov@mm-sol.com>
	 <4365639.JcFl1cP048@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <4365639.JcFl1cP048@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Georgi Djakov <gdjakov@mm-sol.com>, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sboyd@codeaurora.org, rvaswani@codeaurora.org, davidb@codeaurora.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi, 

On Wed, 2014-05-21 at 17:18 +0200, Arnd Bergmann wrote:
> On Wednesday 21 May 2014 17:57:05 Georgi Djakov wrote:

> >  
> > +#ifdef CONFIG_DEBUG_APQ8084_UART
> > +#define MSM_DEBUG_UART_BASE    0xFA75E000
> > +#define MSM_DEBUG_UART_PHYS    0xF995E000
> > +#endif
> > +

> Maybe we should move debug/msm.S over to use
> CONFIG_DEBUG_UART_PHYS/CONFIG_DEBUG_UART_VIRT now?
> 

There is patch which do this [1]. It was reviewed 
by Stephen Boyd [2].

Regards,
Ivan


[1] https://lkml.org/lkml/2014/4/14/312
[2] https://lkml.org/lkml/2014/4/14/542
