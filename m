From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add phy-miphy28lp.c to ARCH/STI
 architecture
Date: Tue, 31 Mar 2015 18:40:11 +0100
Message-ID: <20150331174011.GA16741@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1427728632-10846-1-git-send-email-peter.griffin@linaro.org>
 <1427728632-10846-7-git-send-email-peter.griffin@linaro.org>
 <551AC831.2000108@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <551AC831.2000108@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, balbi@ti.com, lee.jones@linaro.org, devicetree@vger.kernel.org, robherring2@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On Tue, 31 Mar 2015, Kishon Vijay Abraham I wrote:
<snip>

> >diff --git a/MAINTAINERS b/MAINTAINERS
> >index 1de6afa..fa1bb4f 100644
> >--- a/MAINTAINERS
> >+++ b/MAINTAINERS
> >@@ -1469,6 +1469,7 @@ F:	drivers/clocksource/arm_global_timer.c
> >  F:	drivers/i2c/busses/i2c-st.c
> >  F:	drivers/media/rc/st_rc.c
> >  F:	drivers/mmc/host/sdhci-st.c
> >+F:	drivers/phy/phy-miphy28lp.c
> 
> add for miphy365x.c as well?

Yes we should also be adding miphy365x.c as well.

Would you like me to send a seperate patch for that?

regards,

Peter.
