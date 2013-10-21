From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V5 3/3] drivers/rtc/rtc-as3722: add RTC driver
Date: Mon, 21 Oct 2013 16:44:58 +0530
Message-ID: <52650CB2.9030409@nvidia.com>
References: <1381321761-8898-1-git-send-email-ldewangan@nvidia.com> <1381321761-8898-4-git-send-email-ldewangan@nvidia.com> <20131010152446.1715e64b70ddd0281a3971e9@linux-foundation.org> <20131010224748.GW21581@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131010224748.GW21581@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "rob@landley.net" <rob@landley.net>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Florian Lobmaier <florian.lobmaier@ams.com>
List-Id: devicetree@vger.kernel.org

On Friday 11 October 2013 04:17 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Thu, Oct 10, 2013 at 03:24:46PM -0700, Andrew Morton wrote:
>
>>> +#ifdef CONFIG_PM
>> Most (but not all!) rtc drivers use CONFIG_PM_SLEEP.  People have madly
>> mucked with CONFIG_PM* and I don't know the difference and I don't know
>> what's going on and I don't know of a convenient place to go to find
>> out.  If you work it out, please be sure to tell me!  But as soon as I
>> figure it out I'm sure they'll go and madly muck with it again.
> The two effective options for this stuff are PM_SLEEP (for system
> suspend) and PM_RUNTIME (for runtime suspend which RTCs are unlikely to
> use I guess).  PM mostly just enables selection of the other two.

I think, correct defs is  CONFIG_PM_SLEEP here. I will re-spin this patch.
