From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 4/4] mmc: pwrseq-simple: add disable-post-power-on option
Date: Fri, 2 Dec 2016 08:13:42 +0100
Message-ID: <CAPDyKFpCY+LHFkJVJGHaSDODVR7_Xr2ohpdOAn9Hd3qZbDTQ6w@mail.gmail.com>
References: <1480659462-29536-1-git-send-email-matt@ranostay.consulting> <1480659462-29536-5-git-send-email-matt@ranostay.consulting>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1480659462-29536-5-git-send-email-matt@ranostay.consulting>
Sender: linux-mmc-owner@vger.kernel.org
To: Matt Ranostay <matt@ranostay.consulting>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Tony Lindgren <tony@atomide.com>
List-Id: devicetree@vger.kernel.org

On 2 December 2016 at 07:17, Matt Ranostay <matt@ranostay.consulting> wrote:
> Add optional device-post-power-on parameters to disable post_power_on
> function from being called since this breaks some device.
>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt | 2 ++
>  drivers/mmc/core/pwrseq_simple.c                            | 7 +++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt
> index bea306d772d1..09fa153f743e 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt
> +++ b/Documentation/devicetree/bindings/mmc/mmc-pwrseq-simple.txt
> @@ -24,6 +24,8 @@ Optional properties:
>         de-asserting the reset-gpios (if any)
>  - invert-off-state: Invert the power down state for the reset-gpios (if any)
>         and pwrdn-gpios (if any)
> +- disable-post-power-on : Avoid post_power_on function from being called since
> +       this breaks some devices

This is a bit weird. I would like to avoid this, if possible.

Perhaps if you simply describe the sequence in detail for your device
we can figure out the best option together.

[...]

Kind regards
Uffe
