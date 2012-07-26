From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Thu, 26 Jul 2012 14:11:21 +0100
Message-ID: <20120726131121.GB7306@sirena.org.uk>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1342713281-31114-4-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 19, 2012 at 11:54:41PM +0800, Shawn Guo wrote:

> +Optional properties:
> +- transition-latency: Specify the possible maximum transition latency,
> +  in unit of nanoseconds.

This should make it clear that the transition latency being documented
here is just that for the core clock change itself, there may be other
sources of latency like the regulator ramp time or reprogramming PLLs.

> +	if (cpu_reg) {
> +		opp = opp_find_freq_ceil(cpu_dev, &freq_Hz);
> +		if (IS_ERR(opp)) {
> +			pr_err("failed to find OPP for %ld\n", freq_Hz);
> +			return PTR_ERR(opp);
> +		}
> +		volt = opp_get_voltage(opp);
> +		tol = volt * voltage_tolerance / 100;
> +		volt_old = regulator_get_voltage(cpu_reg);

regulator_get_voltage() might be a bit expensive, many regulators will
query the hardware every time.  Since it's just for diagnostic purposes
it'd be better to not bother and let people read the historical
information from the logs.

> +	/* scaling up?  scale voltage before frequency */
> +	if (cpu_reg && freqs.new > freqs.old) {
> +		if (regulator_set_voltage(cpu_reg, volt - tol, volt + tol)) {

This is a totally sane and sensible use case for specifying a voltage
range, we should move it into the regulator core for other users so you
can just specify the voltage and the tolerance directly.

It is a little sad here as it means that we loose the ability to do
frequency only scaling if there's no regulator which is nice.
