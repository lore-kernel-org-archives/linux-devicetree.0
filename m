From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3 00/13] ARM: EXYNOS: Fix Universal C210 support
Date: Sun, 28 Apr 2013 12:17:51 -0700
Message-ID: <20130428191751.GA22332@quad.lixom.net>
References: <1366731994-7478-1-git-send-email-t.figa@samsung.com>
 <201304251646.28026.arnd@arndb.de>
 <20130427003413.GA2350@quad.lixom.net>
 <517CC731.2050401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <517CC731.2050401@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, tomasz.figa@gmail.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, john.stultz@linaro.org, ben-linux@fluff.org, thomas.abraham@linaro.org, tglx@linutronix.de, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

On Sun, Apr 28, 2013 at 03:52:33PM +0900, Kukjin Kim wrote:
> On 04/27/13 09:34, Olof Johansson wrote:
> 
> [...]
> 
> >>>On Universal C210 board, both with and without DT:
> >>>
> >>>Tested-by: Tomasz Figa<t.figa@samsung.com>
> >>
> >>Reviewed-by: Arnd Bergmann<arnd@arndb.de>
> >>
> >>Olof, Kgene, I think we should have this one in 3.10 since it fixes
> >>a regression. It looks bigger than it really is because I asked Tomasz
> >>to do small patches rather than a single combined patch.
> >
> >Ok. Kukjin, I don't mind collecting this in a late/* branch even though time is
> >running late, since it's a regression. Do you want to send it to me or should
> >I just pick up the patches?
> >
> Olof, since too late, would be better if you could pick up this
> series in the late/* branch with my ack:
> 
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>

I have applied everything but 11/13 since it had heavy conflicts (I'll commment
on that patch separately).


-Olof
