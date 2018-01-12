From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: spear600: Add missing interrupt-parent of rtc
Date: Fri, 12 Jan 2018 08:52:23 +0530
Message-ID: <20180112032223.GK3626@vireshk-i7>
References: <a062d9ed0d3365b578156a780202fa533e725374.1515650104.git.viresh.kumar@linaro.org>
 <20180112020711.6gp2pnsxxjzelidq@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180112020711.6gp2pnsxxjzelidq@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11-01-18, 18:07, Olof Johansson wrote:
> On Thu, Jan 11, 2018 at 11:28:51AM +0530, Viresh Kumar wrote:
> > The interrupt-parent of rtc was missing, add it.
> > 
> > Fixes: 8113ba917dfa ("ARM: SPEAr: DT: Update device nodes")
> > Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v3.8+
> > Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Applied to next/dt. Is stable really needed on this? It's been broken since
> pretty much forever, and nobody has complained... :)

Not sure. Just thought it may be useful for someone somewhere :)

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
