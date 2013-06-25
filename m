From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v6] clocksource:arm_global_timer: Add ARM global timer
 support.
Date: Tue, 25 Jun 2013 15:17:40 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1306251459160.4013@ionos.tec.linutronix.de>
References: <1372152678-29530-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372152678-29530-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 25 Jun 2013, Srinivas KANDAGATLA wrote:
> If its not too late can this patch be considered for 3.11 via clocksource tree?

Sure. No worry, though I noticed a little detail when reading through it
again. See below.

> +/**
> + * To ensure that updates to comparator value register do not set the
> + * Interrupt Status Register proceed as follows:
> + * 1. Clear the Comp Enable bit in the Timer Control Register.
> + * 2. Write the lower 32-bit Comparator Value Register.
> + * 3. Write the upper 32-bit Comparator Value Register.
> + * 4. Set the Comp Enable bit and, if necessary, the IRQ enable bit.
> + */
> +static void gt_compare_set(unsigned long delta, int periodic)
> +{
> +	u64 counter = gt_counter_read();
> +	unsigned long ctrl = readl(gt_base + GT_CONTROL);

Why are you reading the control register back over and over? All you
need to preserve is the GT_CONTROL_TIMER_ENABLE bit. So you can spare
that read out and just do

	ctrl = GT_CONTROL_TIMER_ENABLE;
	writel(ctrl, gt_base + GT_CONTROL);

> +static irqreturn_t gt_clockevent_interrupt(int irq, void *dev_id)
> +{
> +	struct clock_event_device *evt = dev_id;
> +
> +	if (readl_relaxed(gt_base + GT_INT_STATUS) &
> +				GT_INT_STATUS_EVENT_FLAG) {

If you negate the check and return IRQ_NONE, you save one indent level
for the real code.

> +		/**
> +		 * ERRATA 740657( Global Timer can send 2 interrupts for
> +		 * the same event in single-shot mode)
> +		 * Workaround:
> +		 *	Either disable single-shot mode.
> +		 *	Or
> +		 *	Modify the Interrupt Handler to avoid the
> +		 *	offending sequence. This is achieved by clearing
> +		 *	the Global Timer flag _after_ having incremented
> +		 *	the Comparator register	value to a higher value.
> +		 */
> +		if (!(readl_relaxed(gt_base + GT_CONTROL) &
> +						GT_CONTROL_AUTO_INC))

Again, no need to read from the hardware.

       if (evt->mode == CLOCK_EVT_MODE_ONESHOT)

tells you what you need to know.

Thanks,

	tglx
