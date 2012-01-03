From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v4 4/7] cpufreq: add clk-reg cpufreq driver
Date: Tue, 3 Jan 2012 09:06:25 +0000
Message-ID: <20120103090625.GA2914@n2100.arm.linux.org.uk>
References: <1324537753-30590-1-git-send-email-richard.zhao@linaro.org>
 <1324537753-30590-5-git-send-email-richard.zhao@linaro.org>
 <20111223131851.GB13175@sirena.org.uk> <20111224085539.GA1892@richard-laptop>
 <20111224122411.GA13778@sirena.org.uk> <20111224132831.GB1803@richard-laptop>
 <20111224134227.GA20908@opensource.wolfsonmicro.com>
 <20111224155227.GC1803@richard-laptop>
 <20111226111030.GC8722@opensource.wolfsonmicro.com>
 <20111226134449.GA4259@richard-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111226134449.GA4259@richard-laptop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Richard Zhao <richard.zhao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, mark.langsdorf-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, davej-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 26, 2011 at 09:44:52PM +0800, Richard Zhao wrote:
> On Mon, Dec 26, 2011 at 11:10:30AM +0000, Mark Brown wrote:
> > The *call* is there in the regulator subsystem, it's just that none of
> > the drivers back it up with an actual implementation yet.  Which turns
> > out to be a good thing as cpufreq can't currently understand variable
> > latencies and the governors don't deal well with non-trivial latencies
> > anyway.
> but clk API don't have such calls. and many SoCs only adjust clk frequencies, using
> one single voltage.

That's because it's often not known - especially in the case of PLLs,
data sheets don't tend to specify how long it takes for the PLL to relock
after a requested change.  If it's important that the PLL be locked,
there will be a bit to poll (or they'll cause the CPU itself to stall
while the PLL is not locked.)

So, for these kinds of situations, how do you suggest that the clk API
provides this information?
