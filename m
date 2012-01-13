From: "Cousson, Benoit" <b-cousson-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V6 4/7] cpufreq: add clk-reg cpufreq driver
Date: Fri, 13 Jan 2012 18:16:18 +0100
Message-ID: <4F1066E2.1020804@ti.com>
References: <1325213769-11752-1-git-send-email-richard.zhao@linaro.org>
	<1325213769-11752-5-git-send-email-richard.zhao@linaro.org>
	<87aa5t25ad.fsf@ti.com>
	<20120112082300.GF2414@b20223-02.ap.freescale.net>
	<874nw0sfdn.fsf@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <874nw0sfdn.fsf-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, eric.miao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, davej-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 1/12/2012 11:52 PM, Kevin Hilman wrote:
> Richard Zhao<richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>  writes:

[...]

>> Do you have real case to need different voltage/clk?
>
> Sure, any system with independently scalable CPUs/clusters.

AFAIK, in the ARM SoC world there is a least the MSM8660 that does 
support that today.

Regards,
Benoit
