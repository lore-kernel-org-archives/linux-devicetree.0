From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH V3 2/3] clocksource: mmp: support CLOCKSOURCE OF DECLARE
Date: Tue, 9 Jul 2013 18:14:34 +0200
Message-ID: <20130709181434.76f6216d@skate>
References: <1373352166-10064-1-git-send-email-zhangwm@marvell.com>
	<1373352166-10064-3-git-send-email-zhangwm@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1373352166-10064-3-git-send-email-zhangwm@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Zhang <zhangwm@marvell.com>
Cc: grant.likely@linaro.org, haojian.zhuang@gmail.com, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dear Neil Zhang,

On Tue, 9 Jul 2013 14:42:45 +0800, Neil Zhang wrote:
> support CLOCKSOURCE OF DECLARE for mmp timer.
> 
> Signed-off-by: Neil Zhang <zhangwm@marvell.com>
> ---
>  arch/arm/mach-mmp/mmp-dt.c  |    5 ++---
>  arch/arm/mach-mmp/mmp2-dt.c |    3 +--
>  arch/arm/mach-mmp/time.c    |   15 ++-------------
>  3 files changed, 5 insertions(+), 18 deletions(-)

Maybe it would be good to take this opportunity to move
arch/arm/mach-mmp/time.c into drivers/clocksource/.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
