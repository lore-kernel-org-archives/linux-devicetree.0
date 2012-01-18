From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V2 1/4] cpufreq: add arm soc generic cpufreq driver
Date: Wed, 18 Jan 2012 11:42:28 +0000
Message-ID: <20120118114228.GB22977@sirena.org.uk>
References: <1324031462-24961-1-git-send-email-richard.zhao@linaro.org>
 <1324031462-24961-2-git-send-email-richard.zhao@linaro.org>
 <20120118113949.GA22977@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120118113949.GA22977@sirena.org.uk>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, mark.langsdorf@calxeda.com, patches@linaro.org, eric.miao@linaro.org, kernel@pengutronix.de, davej@redhat.com, linaro-dev@lists.linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2012 at 11:39:50AM +0000, Mark Brown wrote:

> This appears to reintroduce the setting of an exact voltage which I'm
> sure was fixed in previous versions of the patch.

Erk, sorry - it looks like the device tree list has quite a bit of lag
in moderation and sent out some old patches which I didn't notice.  All
this has been fixed in subsequent verisons.
