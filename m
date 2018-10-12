From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 04/29] clk: sunxi-ng: h6: Set video PLLs limits
Date: Fri, 12 Oct 2018 13:43:32 +0530
Message-ID: <a303145c-b123-d912-91d7-9830dec3244e@openedev.com>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
 <20181007093905.11253-5-jernej.skrabec@siol.net>
Reply-To: jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBDH5TZWAZAFBBRNPQHPAKGQETVYR2OA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181007093905.11253-5-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 07 October 2018 03:08 PM, Jernej Skrabec wrote:
> Video PLL factors can be set in a way that final PLL rate is outside
> stable range. H6 user manual specifically says that N factor should not
> be below 12. While it doesn't says anything about maximum stable rate, it

Manual says "In application, PLL_FACTOR_N should be more than or equal 
to 11" can't it be 11?

> is clear that PLL doesn't work at 6.096 GHz (254 * 24 MHz).
> 
> Set minimum allowed PLL video rate to 288 MHz (12 * 24 MHz) and maximum
> to 2.4 GHz, which is maximum in BSP driver.

Is this max freq from here [1]

[1] 
https://github.com/Allwinner-Homlet/H6-BSP4.9-linux/blob/master/drivers/clk/sunxi/clk-sun50iw6.c#L164
