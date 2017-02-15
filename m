From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: qoriq: Separate root input clock for core PLLs
 on ls1012a
Date: Wed, 15 Feb 2017 12:36:30 -0600
Message-ID: <1487183790.5636.13.camel@buserror.net>
References: <1487137656-4006-1-git-send-email-yuantian.tang@nxp.com>
         <1487137656-4006-2-git-send-email-yuantian.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487137656-4006-2-git-send-email-yuantian.tang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: yuantian.tang-3arQi8VN3Tc@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-02-15 at 13:47 +0800, yuantian.tang-3arQi8VN3Tc@public.gmane.org wrote:
> From: Tang Yuantian <Yuantian.Tang-3arQi8VN3Tc@public.gmane.org>
> 
> ls1012a has separate input root clocks for core PLLs versus the
> platform PLL, with the latter described as sysclk in the hw docs.
> If a second input clock, named "coreclk", is present, this clock will be
> used for the core PLLs.
> 
> Signed-off-by: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
> Signed-off-by: Tang Yuantian <yuantian.tang-3arQi8VN3Tc@public.gmane.org>
> ---
>  drivers/clk/clk-qoriq.c | 91 +++++++++++++++++++++++++++++++++++++++++-----

Why did you reset the author on these patches?  Have you changed anything?
 Why aren't they marked either v2 or resend?

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
