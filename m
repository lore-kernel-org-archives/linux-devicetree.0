From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 07/12] ARM: dts: imx6qdl-aristainetos: Move display node
 out of 'soc'
Date: Sat, 2 Dec 2017 04:48:27 +0100
Message-ID: <16268a9f-aea4-4efc-02d4-37a9a9e2784a@denx.de>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
 <1512156285-18451-7-git-send-email-festevam@gmail.com>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512156285-18451-7-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Fabio,

Am 01.12.2017 um 20:24 schrieb Fabio Estevam:
> From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> 
> Move disp0 node from soc node to root node.
> 
> disp0 node does not have any register properties and thus
> shouldn't be placed on the bus.
> 
> This fixes the following build warnings with W=1:
> 
> arch/arm/boot/dts/imx6dl-aristainetos_4.dtb: Warning (simple_bus_reg): Node /soc/disp0 missing or empty reg/ranges property
> 
> Cc: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
> Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> ---
>   arch/arm/boot/dts/imx6dl-aristainetos_4.dts | 50 ++++++++++++++---------------
>   arch/arm/boot/dts/imx6dl-aristainetos_7.dts | 48 +++++++++++++--------------
>   2 files changed, 47 insertions(+), 51 deletions(-)

Thanks for fixing!

Reviewed-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Tested-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
