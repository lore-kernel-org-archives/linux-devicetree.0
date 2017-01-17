From: Suzuki K Poulose <Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 3/4] arm64: dts: juno: add CoreSight support for Juno
 r1/r2 variants
Date: Tue, 17 Jan 2017 13:27:22 +0000
Message-ID: <d89b805b-cc6f-37d5-2b64-4f83fa086db6@arm.com>
References: <1484655313-9025-1-git-send-email-sudeep.holla@arm.com>
 <1484655313-9025-4-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484655313-9025-4-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17/01/17 12:15, Sudeep Holla wrote:
> From: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> The CoreSight support added for Juno is valid for only Juno r0.
> The Juno r1 and r2 variants have additional components and alternative
> connection routes between trace source and sinks.
>
> This patch builds on top of the existing r0 support and extends it to
> Juno r1/r2 variants.
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> [sudeep.holla-5wv7dgnIgG8@public.gmane.org: minor changelog update and major reorganisation of
> 	the common coresight components back into juno-base.dtsi to avoid
> 	duplication, also renamed funnel node names]
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi | 100 ++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/arm/juno-r1.dts       |   9 +++
>  arch/arm64/boot/dts/arm/juno-r2.dts       |   9 +++
>  3 files changed, 118 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
>
> diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> new file mode 100644
> index 000000000000..563463ed28c7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> @@ -0,0 +1,100 @@
> +/ {
> +	funnel@20130000 { /* cssys2 */

Typo, that should be csys1. Rest looks good to me.

Reviewed-by: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
