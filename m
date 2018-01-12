From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/3] arm: spear13xx: Fix dmas cells
Date: Thu, 11 Jan 2018 18:07:35 -0800
Message-ID: <20180112020735.67vndge2vfy6rtpk@localhost>
References: <a062d9ed0d3365b578156a780202fa533e725374.1515650104.git.viresh.kumar@linaro.org>
 <6183c13fd3abcb2a6834a537a4809b6527204f10.1515650104.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6183c13fd3abcb2a6834a537a4809b6527204f10.1515650104.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 11, 2018 at 11:28:52AM +0530, Viresh Kumar wrote:
> The "dmas" cells for the designware DMA controller need to have only 3
> properties apart from the phandle: request line, src master and
> destination master. But the commit 6e8887f60f60 updated it incorrectly
> while moving from platform code to DT. Fix it.
> 
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v3.10+
> Fixes: 6e8887f60f60 ("ARM: SPEAr13xx: Pass generic DW DMAC platform data from DT")
> Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied to next/dt.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
