From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v4 18/28] ARM: dts: s500-guitar-bb-rev-b: Add fake uart3
 clock
Date: Tue, 5 Sep 2017 23:37:52 +0200
Message-ID: <5f7e0538-5cd5-6052-28bf-3cb9c07d7748@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
 <20170606005426.26446-19-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606005426.26446-19-afaerber@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, =?UTF-8?B?5byg5aSp55uK?= <tyzhang@actions-semi.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Liau <thomas.liau@actions-semi.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, =?UTF-8?B?5YiY54Kc?= <liuwei@actions-semi.com>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf@actions-semi.com>
List-Id: devicetree@vger.kernel.org

Am 06.06.2017 um 02:54 schrieb Andreas Färber:
> Add a fixed-clock for baudrate 115200.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  v2 -> v3 -> v4: unchanged
>  
>  v2: new
>  
>  arch/arm/boot/dts/s500-guitar-bb-rev-b.dts | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to v4.14/dt:

https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-actions.git/log/?h=v4.14/dt

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
