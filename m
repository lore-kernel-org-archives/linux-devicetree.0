From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arm: dts: rockchip: add reset node for the exist
 saradc SoCs
Date: Tue, 23 Aug 2016 19:09:59 +0100
Message-ID: <bd4ebfaa-27e2-5e6c-64f3-62290a8ba3de@kernel.org>
References: <1469629447-544-1-git-send-email-wxt@rock-chips.com>
 <1469629447-544-4-git-send-email-wxt@rock-chips.com>
 <2485357.yNPXRzbCnj@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2485357.yNPXRzbCnj@phil>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/08/16 18:20, Heiko Stuebner wrote:
> Am Mittwoch, 27. Juli 2016, 22:24:07 CEST schrieb Caesar Wang:
>> SARADC controller needs to be reset before programming it, otherwise
>> it will not function properly.
>>
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Acked-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Cc: <Stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> 
Applied to the fixes-togreg branch of iio.git

I'll probably get the pull request done tonight to get this on it's
way.

Jonathan
