From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/9] arm64: dts: hi3660: enable idle states
Date: Fri, 11 Aug 2017 09:50:21 +0800
Message-ID: <20170811015020.GF3819@leoy-ThinkPad-T440>
References: <20170810022615.19204-1-guodong.xu@linaro.org>
 <20170810022615.19204-2-guodong.xu@linaro.org>
 <b3d8f55b-3d70-9b3a-a4c6-474a933a13a9@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b3d8f55b-3d70-9b3a-a4c6-474a933a13a9-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kevin Wang <jean.wangtao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Thu, Aug 10, 2017 at 12:07:07PM +0200, Daniel Lezcano wrote:
> 
> Hi Guodong, Leo,
> 
> there are several typos in the patch description. I *humbly* propose an
> alternate description to make it a bit more English friendly.
> 
> """
> 
> There are two clusters on the Hi3660, the first one is Cortex-A53 based
> and the other one is Cortex-A73 based. These two clusters have different
> idle states.
> 
> Thanks to Daniel Lezcano's recent changes, the generic ARM cpuidle
> driver can now support several clusters with different idle states, thus
> supporting the big.Little architecture.
> 
> In addition to the WFI idle state which is the default shallowest state
> for all ARM cpus, the Hi3660 supports the following states:
> 
>  - CA53 CPUs:
> 	- CPU_SLEEP:       CPU power off state
> 	- CLUSTER_SLEEP_0: Cluster power off state
> 
>  - CA73 CPUs:
> 	- CPU_NAP:         CPU retention state
> 	- CPU_SLEEP:       CPU power off state
> 	- CLUSTER_SLEEP_1: Cluster power off state
> 
> This patch adds the idle states description for the Hi3660 to the device
> tree.
> 
> """
> 
> 
> Other than that.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks a lot for proposing commit log, it's much better :)

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
