From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] pinctrl: qcom: Add msm8998 pinctrl driver
Date: Tue, 9 Jan 2018 15:32:39 +0100
Message-ID: <CACRpkdZJmDdPj25NuB1XWoe9FQmDmHvRb4q5N7DtY_SF9eznsw@mail.gmail.com>
References: <20180108021530.10063-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180108021530.10063-1-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 8, 2018 at 3:15 AM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> From: "Khan, Imran" <kimran-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>
> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for msm8998.
>
> Signed-off-by: Imran Khan <kimran-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> [bjorn: Consolidated function groups]
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>
> This was never resubmitted after my review a year ago, so fixing up the f=
ew
> comments I had and posting it again.

Den som v=C3=A4ntar p=C3=A5 n=C3=A5got gott v=C3=A4ntar aldrig f=C3=B6r l=
=C3=A4nge.

> Changes since v1:
> - Consolidated phase_flag and gdss function groups
> - Corrected ngpios
> - Changed to SPDX license header

Patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
