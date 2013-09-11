From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drivers: of: fix build break if asm/dma-contiguous.h is
 missing
Date: Wed, 11 Sep 2013 08:31:54 +0200
Message-ID: <52300E5A.7010202@samsung.com>
References: <1378804400-31716-1-git-send-email-m.szyprowski@samsung.com>
 <522F76CF.6080907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <522F76CF.6080907@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Michal Nazarewicz <mina86@mina86.com>, Grant Likely <grant.likely@secretlab.ca>, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sascha Hauer <s.hauer@pengutronix.de>, Laura Abbott <lauraa@codeaurora.org>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kumar Gala <galak@codeaurora.org>, Nishanth Peethambaran <nishanth.p@gmail.com>, Marc <marc.ceeeee@gmail.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

Hello,

On 9/10/2013 9:45 PM, Rob Herring wrote:
> On 09/10/2013 04:13 AM, Marek Szyprowski wrote:
> > It is not needed to include asm/dma-contiguous.h header to compile
> > reserved memory initialization code, so remove it to avoid build break
> > on architectures without CMA support.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Acked-by: Rob Herring <rob.herring@calxeda.com>
>
> I can apply this or it can go with other CMA stuff.

I think it will be best if I push it to Linus asap to fix the build break
on arm64 and mips, introduced by my pull request. It is really strange that
I got no report from linux-next about that issue, although this patch was
there for about 2 weeks.

> Aren't there also some comments from Grant to address as well?

Right, I'm working on providing an update which will address the issues
pointed by Grant, but I got sick and had to take some days off. I still
didn't recover completely, but I hope I will manage to finish them by
the end of the week.

Best regards
-- 
Marek Szyprowski
Samsung R&D Institute Poland
