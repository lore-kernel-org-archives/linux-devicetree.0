From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH 3/4] clk: Provide always-on clock support
Date: Sat, 28 Feb 2015 08:52:23 +0100
Message-ID: <54F173B7.9030305@st.com>
References: <1425071674-16995-1-git-send-email-lee.jones@linaro.org> <1425071674-16995-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425071674-16995-4-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 02/27/2015 10:14 PM, Lee Jones wrote:
> Lots of platforms contain clocks which if turned off would prove fatal.
> The only way to recover from these catastrophic failures is to restart
> the board(s).  Now, when a clock is registered with the framework it is
> compared against a list of provided always-on clock names which must be
> kept ungated.  If it matches, we enable the existing CLK_IGNORE_UNUSED
> flag, which will prevent the common clk framework from attempting to
> gate it during the clk_disable_unused() procedure.

Please correct me if I'm wrong, but your patch does not fix the issue 
you had initially.
Let's take an example:
A clock is critical for the system, and should never be gated, so you 
add the CLK_IGNORE_UNUSED
flag so that it is not disabled by clk_disable_unused() procedure.
The same clock is also used by other IPs, for example spi 0 instance.
When starting a spi transfer, clk_enable() is called on this clock, so 
its usecount becomes 1.
Once transfer done, clk_disable() is called, usecount becomes 0 and the 
clock gets disabled: system freeze.

BR,
Maxime


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
