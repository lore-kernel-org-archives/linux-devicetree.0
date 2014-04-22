From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] pinctrl: qcom: Add IPQ8064 pinctrl support
Date: Tue, 22 Apr 2014 17:11:40 +0200
Message-ID: <CACRpkdZ_TgS2XFHyEhkWTHsgdv-Yw2jj9342nDihiJjjGPh7Bw@mail.gmail.com>
References: <1397531437-9104-1-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397531437-9104-1-git-send-email-agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bryan Huntsman <bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 15, 2014 at 5:10 AM, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wro=
te:

> This set of patches adds pinctrl support for the Qualcomm IPQ8064 pla=
tform.
> The IPQ8064 uses the same TLMM block as the APQ8064, but has a differ=
ent number
> of pins, functions, and function assignments.  The second patch conta=
ins the
> devicetree documentation.  The last patch selects PINCTRL for all ARC=
H_QCOM
> platforms.  This allows for selection of pinctrl support via a make m=
enuconfig.
>
> Andy Gross (3):
>   pinctrl: qcom: Add definitions for IPQ8064
>   dt: Document Qualcomm IPQ8064 pinctrl binding
>   ARM: qcom: Select PINCTRL by default for ARCH_QCOM

Bj=C3=B6rn can you look at this series?

David/Bryan: can either of you ACK the changes hitting
arch/arm/mach-qcom/Kconfig
so I can merge this through the pinctrl tree?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
