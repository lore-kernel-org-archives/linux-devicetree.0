From: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/3] ARC: get frequency via clock driver instead of
 reading device tree
Date: Sat, 4 Mar 2017 16:07:24 -0800
Message-ID: <2e9840bb-fdf4-84c3-0520-695977a46c53@synopsys.com>
References: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488540602-11438-1-git-send-email-vzakhar-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vlad Zakharov <Vladislav.Zakharov-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet Gupta <vgupta-RMTDnbAGPQdBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/03/2017 03:29 AM, Vlad Zakharov wrote:
> This patch series replaces reading device tree with getting CPU
> clock frequency via clock driver in show_cpuinfo function.
> 
> In order to achieve this we also add cpu nodes to device tree which
> describes SMP system and add "clocks" properties to all ARC cpu nodes. 

Series seems sane to me - will give it a spin next week before adding for 4.11

Thx,
-Vieet


> Vlad Zakharov (3):
>   ARC: [dts] add input clocks for cpu nodes
>   ARC: [dts] add cpu nodes to ARCHS SMP device tree
>   arc: get rate from clk driver instead of reading device tree
> 
>  arch/arc/boot/dts/skeleton.dtsi        |  1 +
>  arch/arc/boot/dts/skeleton_hs.dtsi     |  1 +
>  arch/arc/boot/dts/skeleton_hs_idu.dtsi | 21 ++++++++++++++++++++-
>  arch/arc/kernel/setup.c                | 17 +++++++++++++----
>  4 files changed, 35 insertions(+), 5 deletions(-)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
