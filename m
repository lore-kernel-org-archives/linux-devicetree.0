From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 2/5] clocksource: stm32: convert driver to timer_of
Date: Wed, 18 Oct 2017 20:31:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1710182028080.2477@nanos>
References: <1508331506-23782-1-git-send-email-benjamin.gaignard@linaro.org> <1508331506-23782-3-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508331506-23782-3-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, daniel.lezcano@linaro.org, ludovic.barre@st.com, julien.thierry@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Oct 2017, Benjamin Gaignard wrote:

> Convert driver to use timer_of helpers. This allow to remove
> custom proprietary structure.
> 
> Increase min delta value because if it is too small it could
> generate too much interrupts and the system will not be able
> to catch them all.

This does two completely independent changes at once. What the heck has
increasing min delta to do with converting it to timer_of() helpers?

Nothing at all. So please split this into two distinct patches. Each doing
ONE thing.

See Documentation/process/submitting-patches.rst:

  3) Separate your changes
  ------------------------

  Separate each **logical change** into a separate patch.

Reading, understanding and complying with that document is not optional.

Thanks,

	tglx
