From: Matthew McClintock <mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 09/17] watchdog: qcom: add kpss-standalone to device tree binding
Date: Mon, 28 Mar 2016 17:22:33 -0500
Message-ID: <5E6274D4-B437-4ABD-B5A7-CCB38F282309@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org> <1458770712-10880-10-git-send-email-mmcclint@codeaurora.org> <20160325141521.GA12357@rob-hp-laptop> <0F389D09-1165-4686-98DF-0265351A086A@codeaurora.org> <20160328181544.GB29820@roeck-us.net>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160328181544.GB29820-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qca-upstream.external-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mar 28, 2016, at 1:15 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>=20
>>> What SoC(s) is this in. Use SoC specific compatible strings please.
>>=20
>> So ipq4019 wins the race because we are the first to try to enable w=
atchdog for this block?
>>=20
>> qcom,kpss-ipq4019 ?
>>=20
> It is a dedicated watchdog block, isn't it ? "qcom,kpss-ipq4019" woul=
d not
> refer to a specific block. Devicetree maintainers may have a better i=
dea,
> but it seems to me that there should be 'wdt' or 'watchdog' in the pr=
operty
> name.

Sounds fine to me, if no one has any other comments I=E2=80=99ll use th=
is one in the next spin of the patch.

-M--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
