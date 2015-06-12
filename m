From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] regulator: qcom-spmi: Add vendor specific configuration
Date: Thu, 11 Jun 2015 22:13:21 -0500
Message-ID: <CAL_JsqL6R5jz1Xhgav0a0SeWqcRT200sofP-G_zQLfDVeqwarA@mail.gmail.com>
References: <1434069427-3642-1-git-send-email-sboyd@codeaurora.org> <1434069427-3642-7-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434069427-3642-7-git-send-email-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, David Collins <collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 11, 2015 at 7:37 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> Add support for over current protection (OCP), pin control
> selection, soft start and soft start strength, auto-mode, input
> current limiting, and pull down.
>
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>
> Changes from v1:
> * New patch split from original SPMI regulator driver
>
>  .../bindings/regulator/qcom,spmi-regulator.txt     |  62 +++++
>  drivers/regulator/qcom_spmi-regulator.c            | 298 ++++++++++++++++++++-
>  2 files changed, 358 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> index 75b4604bad07..ab01a152e930 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> @@ -99,6 +99,68 @@ see regulator.txt - with additional custom properties described below:
>                     soft start are active all the time. 0 = Set initial mode to
>                     low power mode (LPM).
>
> +- qcom,auto-mode-enable:

Auto regulator modes are fairly common. Can't we have a common property here?

> +       Usage: optional
> +       Value type: <u32>

This can be bool. Unless we want to have a mode property with "auto"
being one possible value.

> +       Description: 1 = Enable automatic hardware selection of regulator
> +                        mode (HPM vs LPM); not available on boost type
> +                        regulators. 0 = Disable auto mode selection.
> +
> +- qcom,ocp-enable:
> +       Usage: optional
> +       Value type: <u32>
> +       Description: 1 = Allow over current protection (OCP) to be enabled for
> +                    voltage switch type regulators so that they latch off
> +                    automatically when over current is detected. OCP is
> +                    enabled when in HPM or auto mode.  0 = Disable OCP.

This seems common too.

> +
> +- qcom,ocp-max-retries:
> +       Usage: optional
> +       Value type: <u32>
> +       Description: Maximum number of times to try toggling a voltage switch
> +                    off and back on as a result of consecutive over current
> +                    events.
> +
> +- qcom,ocp-retry-delay:
> +       Usage: optional
> +       Value type: <u32>
> +       Description: Time to delay in milliseconds between each voltage switch
> +                    toggle after an over current event takes place.

These 2 are perhaps less common. I hope I don't have a device that does this. :)

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
