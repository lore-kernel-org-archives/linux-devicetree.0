From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] New Qualcomm PMIC pin controller drivers
Date: Wed, 9 Jul 2014 11:43:00 +0200
Message-ID: <CACRpkdYcoA-nifxojO5tZUy6dL6P2PTSGW0mVLUfqG20rOg-Nw@mail.gmail.com>
References: <1404745893-6379-1-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404745893-6379-1-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 7, 2014 at 5:11 PM, Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org> wro=
te:

> This set of patches adds pin control drivers for Multi-purpose
> pin (MPP) and General-purpose pin (GPIO) controllers found
> in Qualcomm PMIC chips.
>
> MPP's are enhanced GPIO's with analog circuits, which support
> following functions in addition to digital input/output: analog
> input/output and current sinks.
>
> PMIC PM8941 have 8 MPP's and 36 GPIO's. PMIC PM8841 have 4 MPP's.
>
> Ivan T. Ivanov (4):
>   pinctrl: qpnp: Qualcomm PMIC pin controller driver
>   pinctrl: qcom: Add documentation for pinctrl-qpnp binding
>   pinctrl: qcom: Add PM8941 and PM8941 pinctrl drivers
>   ARM: dts: qcom: Add PM8941 and PM8841 pinctrl nodes

Oh, I just spent some 45 minutes reviewing an 8xxx pinctrl driver from
Bj=C3=B6rn Andersson
that *seems* to be doing exactly the same thing.

Now I have two drivers from people outside Qualcomm :-)

Some of my review comments on Bj=C3=B6rn's driver (like using SI units =
with the pin
config) are actually adressed in this patch set. The idea to split in s=
ubdrivers
per-ASIC may be good? I don't really know.

Can you two guys *PLEASE* join efforts and combine your drivers into on=
e?

If we do this efficiently it should be possible to get one single real
nice driver
in the end.

If you start arguing about nittt gritty stuff like who's going to be au=
thor on
the commit I'll get really disappointed ;-)

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
