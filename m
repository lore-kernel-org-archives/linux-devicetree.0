From: Willy Tarreau <w@1wt.eu>
Subject: Re: ARM: dts: rockchip: add the MiQi board's fan definition
Date: Sun, 12 Feb 2017 08:17:01 +0100
Message-ID: <20170212071701.GA18263@1wt.eu>
References: <1486803415-14680-1-git-send-email-w@1wt.eu>
 <3614963.WjR2ddleWK@phil>
 <20170211174554.GA14513@1wt.eu>
 <1552549.5mxCAWQDxc@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1552549.5mxCAWQDxc@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 12, 2017 at 02:41:35AM +0100, Heiko Stuebner wrote:
> > I find it sad to waste all the performance
> > of a 3288 that way, otherwise it's easier to use something like a dirt
> > a much slower and cheaper cortex A5. But I agree with the point regarding
> > the gpio-pwm.
> 
> Even with the gpio-fan you should see results if you simply add the fan as 
> active trip point somewhere before the cpufreq trip points. So let the fan get 
> activated at 50/60° or so.

Better not do it as-is, the small fan is extremely noisy. That was the
benefit of the heartbeat mode, it was a poor man's pwm. I'll see what I
can do with the gpio-pwm. BTW, on all my MiQi, I have raised the critical
points to 90 degrees, one of my workplace build farm made of 4 MiQi, I
have connected a large slow fan which start to run above 85 degrees and
it's enough to prevent the critical point from ever being reached. The
dissipate heat is very low and the heatsink small so with minimal air
flow, the temperature drops very quickly.

Thanks,
Willy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
