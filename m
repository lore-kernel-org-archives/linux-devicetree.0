From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 3/3] arm: spear13xx: Fix spics gpio controller's warning
Date: Thu, 11 Jan 2018 18:07:46 -0800
Message-ID: <20180112020746.bbprwgp5cgevwjyq@localhost>
References: <a062d9ed0d3365b578156a780202fa533e725374.1515650104.git.viresh.kumar@linaro.org>
 <9d8521e3990be6789f1ed3d5757b57c65483117b.1515650104.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9d8521e3990be6789f1ed3d5757b57c65483117b.1515650104.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 11, 2018 at 11:28:53AM +0530, Viresh Kumar wrote:
> This fixes the following warning by also sending the flags argument for
> gpio controllers:
> 
> Property 'cs-gpios', cell 6 is not a phandle reference in
> /ahb/apb/spi@e0100000
> 
> Fixes: 8113ba917dfa ("ARM: SPEAr: DT: Update device nodes")
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # v3.8+
> Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---


Applied to next/dt.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
