From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v9 4/6] clocksource: stm32: add clocksource support
Date: Fri, 8 Dec 2017 14:46:34 +0100
Message-ID: <ac396fdb-1658-d2f3-bd92-b2b9fe04f201@linaro.org>
References: <20171208113250.359-1-benjamin.gaignard@st.com>
 <20171208113250.359-5-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171208113250.359-5-benjamin.gaignard@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, tglx@linutronix.de, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On 08/12/2017 12:32, Benjamin Gaignard wrote:
> The stm32 timer hardware is currently only used as a clock event device,
> but it can be utilized as a clocksource as well.
> 
> Implement this by enabling the free running counter in the hardware block
> and converting the clock event part from a count down event timer to a
> comparator based timer.


Split this patch in two:
 - periodic support
 - clocksource support




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
