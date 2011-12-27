From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v4 4/7] cpufreq: add clk-reg cpufreq driver
Date: Tue, 27 Dec 2011 10:53:46 +0000
Message-ID: <20111227105345.GF2870@opensource.wolfsonmicro.com>
References: <20111223131851.GB13175@sirena.org.uk>
	<20111224085539.GA1892@richard-laptop>
	<20111224122411.GA13778@sirena.org.uk>
	<20111224132831.GB1803@richard-laptop>
	<20111224134227.GA20908@opensource.wolfsonmicro.com>
	<20111224155227.GC1803@richard-laptop>
	<20111226111030.GC8722@opensource.wolfsonmicro.com>
	<20111226134449.GA4259@richard-laptop>
	<20111226142234.GH8722@opensource.wolfsonmicro.com>
	<20111227015109.GJ15863@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111227015109.GJ15863-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org, davej-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 27, 2011 at 09:51:10AM +0800, Richard Zhao wrote:
> On Mon, Dec 26, 2011 at 02:22:34PM +0000, Mark Brown wrote:

> > Fix your mailer to word wrap properly please.

> If you mean last mail I sent, I didn't see anything wrong. I use
> mutt.

It's wrapping at a bit more than 80 columns a lot of the time.

> > > So what's your suggestion? We can not set transition_latency to set
> > > random number.

> > As I've repeatedly said I think you should define it to be the latency
> > for the SoC only, not for the regulators.

> Sometimes, regulators are in SoC too. To avoid confusion, I'll use below:
> clk-trans-latency = <61036>;

Makes sense.
