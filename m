From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: gcc-msm8960: add child devices support.
Date: Fri, 30 Jan 2015 14:00:25 -0800
Message-ID: <CAJAp7Og5eJkKVoaizNd4MxY9SK3kAg8=4rxS3Gm0iYeQKk8vUA@mail.gmail.com>
References: <1422613004-29802-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1422613060-29886-1-git-send-email-srinivas.kandagatla@linaro.org>
	<CAJAp7Oi_nxEyBZ0bTaQr6d-8sy8M4dFLJxOWCrniX6Pd9+_AGQ@mail.gmail.com>
	<54CBC82D.2050003@linaro.org>
	<54CBF4B4.6080208@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54CBF4B4.6080208-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nrajan-sgV2jX0FEOLY0TyS/+Ba5Q@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 30, 2015 at 1:16 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 01/30/15 10:06, Srinivas Kandagatla wrote:
[..]
>> Stephen Any comments?
>
> I don't understand any of this. We should be making a specific tsens
> device directly in the gcc driver probe and not doing any sort of
> of_platform_populate(). This is what I had, but it probably could be
> done better so that we can assign the struct device's of_node pointer
> before registering on the platform bus.
>
>         platform_device_register_data(&pdev->dev, "tsens8960-tm", -1,
>                         &pdev->dev.of_node, sizeof(&pdev->dev.of_node));
>
> Then if we need to add any properties like #sensor-cells or coefficients
> the tsens driver can use the same of_node that gcc is using.
>

That makes sense and the dt will describe the hardware nicely, but how
do you get access to the register space from the tsens driver?

Will dev_get_regmap(pdev->dev.parent, NULL); find the mmio regmap of
gcc perhaps?

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
