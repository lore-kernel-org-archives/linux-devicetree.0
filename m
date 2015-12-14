From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: r8a7795: Add pmu device nodes
Date: Mon, 14 Dec 2015 14:36:05 +0000
Message-ID: <566ED3D5.1080301@arm.com>
References: <1449236333-4410-1-git-send-email-dirk.behme@gmail.com>
 <1449236333-4410-3-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449236333-4410-3-git-send-email-dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yoshifumi Hosoya <yoshifumi.hosoya.wj-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Masaru Nagai <masaru.nagai.vx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 04/12/15 13:38, Dirk Behme wrote:
> From: Yoshifumi Hosoya <yoshifumi.hosoya.wj-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>
> Enabling the performance monitor unit on r8a7795.
>
> Signed-off-by: Masaru Nagai <masaru.nagai.vx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Yoshifumi Hosoya <yoshifumi.hosoya.wj-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Sigend-off-by: Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Note: This patch picked from
>
> https://git.kernel.org/cgit/linux/kernel/git/horms/renesas-bsp.git/log/?h=v4.2/rcar-3.0.x
>
> and rebased against
>
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/gen3-latest renesas-drivers-2015-12-01-v4.4-rc3
>
>   arch/arm64/boot/dts/renesas/r8a7795.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 946a5bb..8113b71 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -247,6 +247,18 @@
>   			power-domains = <&cpg>;
>   		};
>
> +		pmu {
> +			compatible = "arm,armv8-pmuv3";

You can add more specific compatible "arm,cortex-a57-pmu" if it's Cortex
A57.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
