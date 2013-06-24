From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5] clocksource:arm_global_timer: Add ARM global timer
 support.
Date: Mon, 24 Jun 2013 13:06:32 -0700
Message-ID: <51C8A6C8.8000009@codeaurora.org>
References: <1372089195-29219-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1372089195-29219-1-git-send-email-srinivas.kandagatla@st.com>
Sender: linux-doc-owner@vger.kernel.org
To: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Cc: John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stuart Menefy <stuart.menefy@st.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robherring2@gmail.com>, Will Deacon <will.deacon@arm.com>
List-Id: devicetree@vger.kernel.org

On 06/24/13 08:53, Srinivas KANDAGATLA wrote:
> +
> +static void gt_clockevents_stop(struct clock_event_device *clk)
> +{
> +	gt_clockevent_set_mode(CLOCK_EVT_MODE_UNUSED, clk);
> +	disable_percpu_irq(clk->irq);
> +}
> +
> +static int __cpuinit gt_clockevents_setup(struct clock_event_device *clk)
> +{
> +	struct clock_event_device *evt = this_cpu_ptr(gt_evt);
> +	return evt->name ? 0 : gt_clockevents_init(evt);
> +}

How does this work? gt_clockevents_stop() is using the
clock_event_device struct from the ARM local timer layer whereas
gt_clockevents_setup() is using a driver private allocation. Please just
don't use the local timer API at all and use cpu notifiers instead.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

