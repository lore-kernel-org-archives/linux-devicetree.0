From: Richard Zhao <richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/7] cpufreq: add clk-reg cpufreq driver
Date: Mon, 26 Dec 2011 21:44:52 +0800
Message-ID: <20111226134449.GA4259@richard-laptop>
References: <1324537753-30590-1-git-send-email-richard.zhao@linaro.org>
	<1324537753-30590-5-git-send-email-richard.zhao@linaro.org>
	<20111223131851.GB13175@sirena.org.uk>
	<20111224085539.GA1892@richard-laptop>
	<20111224122411.GA13778@sirena.org.uk>
	<20111224132831.GB1803@richard-laptop>
	<20111224134227.GA20908@opensource.wolfsonmicro.com>
	<20111224155227.GC1803@richard-laptop>
	<20111226111030.GC8722@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111226111030.GC8722-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: davej-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 26, 2011 at 11:10:30AM +0000, Mark Brown wrote:
> On Sat, Dec 24, 2011 at 11:52:29PM +0800, Richard Zhao wrote:
> > On Sat, Dec 24, 2011 at 01:42:29PM +0000, Mark Brown wrote:
> > > On Sat, Dec 24, 2011 at 09:28:33PM +0800, Richard Zhao wrote:
> 
> > > > If you think regulator thansition latency is board specific, then the board
> > > > dts can overrite it.
> 
> > > We should just query this information from the regulator subsystem
> > > (there's hooks but currently nothing implements them).  The regulators
> > > can define their own bindings if they need to read it from device tree,
> > > most of them should be able to do this as a function of knowing about
> > > the device.  None of this is specific to cpufreq so cpufreq shouldn't
> > > have to define its own support for this.
> 
> > I'd like to query the latency by call clk and regulator APIs. but as you said
> > both of them have not implemented it yet. I think, for now, we can use the
> 
> The *call* is there in the regulator subsystem, it's just that none of
> the drivers back it up with an actual implementation yet.  Which turns
> out to be a good thing as cpufreq can't currently understand variable
> latencies and the governors don't deal well with non-trivial latencies
> anyway.
but clk API don't have such calls. and many SoCs only adjust clk frequencies, using
one single voltage.
> 
> > property to get the total latency. Once I can get it at runtime, I'll remove
> > it. So the definition of trans-latency is just the same as cpufreq transition_latency,
> > people get less confused. What do you think?
> 
> The problem with device tree is that once you've defined a binding
> you're stuck with it, it's very hard to change - witness all the magic
> number based stuff with the interrupt bindings for example
So what's your suggestion? We can not set transition_latency to set random number.

Thanks
Richard
