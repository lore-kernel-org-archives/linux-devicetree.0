From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: document the berlin enable-method
 property
Date: Thu, 3 Apr 2014 16:22:02 +0800
Message-ID: <20140403162202.79b63729@xhacker>
References: <1396512496-8030-1-git-send-email-antoine.tenart@free-electrons.com>
	<1396512496-8030-3-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396512496-8030-3-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jimmy Xu <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 3 Apr 2014 01:08:15 -0700
Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt
> b/Documentation/devicetree/bindings/arm/cpus.txt index
> 333f4aea3029..a9e42a2dbc99 100644 ---
> a/Documentation/devicetree/bindings/arm/cpus.txt +++
> b/Documentation/devicetree/bindings/arm/cpus.txt @@ -185,6 +185,8 @@ =
nodes
> to be present and contain the properties described below. "qcom,gcc-m=
sm8660"
>  			    "qcom,kpss-acc-v1"
>  			    "qcom,kpss-acc-v2"
> +			    "marvell,88de31-smp" - cpu-core handling for

why not "marvell,berlin-smp"?=20

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
