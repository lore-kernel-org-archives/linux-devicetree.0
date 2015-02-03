From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH 0/3] Add initial DT support for Qualcomm SPMI PMIC devices
Date: Tue, 3 Feb 2015 12:38:48 -0800
Message-ID: <CAJAp7OjL6+QLs45LM8pEsZ4tHQ2jgM9z2tg8pb6A=xAxBO7pGA@mail.gmail.com>
References: <1422965880-11047-1-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422965880-11047-1-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 3, 2015 at 4:17 AM, Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org> wrote:
> Following set of patches add initial DT support for PMIC devices
> found on recent Quqalcomm chipsets. Details for SPMI bus and PMIC arbiter
> could be found here [1].
>
> Regards,
> Ivan
>
> [1] http://lwn.net/Articles/564637/
>
> Ivan T. Ivanov (3):
>   ARM: dts: qcom: Add SPMI PMIC Arbiter nodes for APQ8084 and MSM8974
>   ARM: dts: qcom: Add 8x74 chipset SPMI PMIC's nodes
>   ARM: dts: qcom: Add APQ8084 chipset SPMI PMIC's nodes
>

Looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
