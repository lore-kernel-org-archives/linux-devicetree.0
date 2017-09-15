From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 2/2] arm: dts: stm32: remove useless clocksource nodes
Date: Fri, 15 Sep 2017 23:03:47 +0200
Message-ID: <20170915210347.GA1831@mai>
References: <1505375812-19037-1-git-send-email-benjamin.gaignard@linaro.org>
 <1505375812-19037-3-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505375812-19037-3-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, tglx@linutronix.de, ludovic.barre@st.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 14, 2017 at 09:56:52AM +0200, Benjamin Gaignard wrote:
> 16 bits timers aren't accurate enough to be used as
> clocksource, remove them from stm32f4 and stm32f7 devicetree.

Do you really want to remove the description? The timers are disabled, aren't they?
