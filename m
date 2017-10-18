From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 3/5] clocksource: stm32: only use 32 bits timers
Date: Wed, 18 Oct 2017 20:35:51 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1710182032170.2477@nanos>
References: <1508331506-23782-1-git-send-email-benjamin.gaignard@linaro.org> <1508331506-23782-4-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508331506-23782-4-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, daniel.lezcano@linaro.org, ludovic.barre@st.com, julien.thierry@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Oct 2017, Benjamin Gaignard wrote:

> 16 bits hardware are not enough accure to be used.

That should probably read:

  16 bit counters are not accurate enough to be used.

Right?

> Do no allow them to be probed by tested max counter value.

I really do not understand why you want to do this. Accuracy is not really
a reason to dismiss working hardware right away. What you can do is to
lower the rating so other eventually available hardware will be preferred.

I might be missing something, but if so this is obviously missing in the
changelog.

Thanks,

	tglx
