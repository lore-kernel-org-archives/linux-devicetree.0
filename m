From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: correct voltage selector
 Firefly-RK3399
Date: Wed, 20 Jun 2018 07:59:34 +0200
Message-ID: <459cb125-a3e2-8f1e-b960-011020d41b3c@gmx.de>
References: <20180604171523.28454-1-xypron.glpk@gmx.de>
 <19360053.2ABrQ075F2@phil> <10782218.jfpm9omiT7@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <10782218.jfpm9omiT7@phil>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/20/2018 01:21 AM, Heiko Stuebner wrote:
> Hi Heinrich,
> 
> Am Donnerstag, 14. Juni 2018, 14:55:27 CEST schrieb Heiko Stuebner:
>> Am Montag, 4. Juni 2018, 19:15:23 CEST schrieb Heinrich Schuchardt:
>>> Without this patch the Firefly-RK3399 board boot process hangs after these
>>> lines:
>>>
>>>    fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detected!
>>>    fan53555-reg: supplied by vcc_sys
>>>    vcc1v8_s3: supplied by vcc_1v8
>>>
>>> Blacklisting driver fan53555 allows booting.
>>>
>>> The device tree uses a value of fcs,suspend-voltage-selector different to
>>> any other board.
>>>
>>> Changing this setting to the usual value is sufficient to enable booting.
>>>
>>> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>>
>> applied for 4.19.
> 
> and dropped again.
> 
> Sadly it looks like the patch causes conflicts with at least one firefly
> board in a kernelci lab. My own is currently not ready to use, so I cannot
> look myself right now.
> 
> The issue kernelci people described sounded quite a lot like the one
> in your commit message, so my current theory is that the
> suspend-voltage-selector must in some form corespond to the
> cpu_b_sleep_h gpio setting we're currently not handling at all, which
> would therefore depend on how the bootloader sets this up.
> 

Hi Heiko,

please, provide a link to the log displaying the issue and the contact
who can provide the exact setup.

I have been testing with U-Boot as boot loader.

Best regards

Heinrich
