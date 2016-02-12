From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V2] regulator: max8973: add support for junction thermal warning
Date: Fri, 12 Feb 2016 07:36:28 -0600
Message-ID: <CAL_JsqL1=WjdsXHNyKWxfAoe+8_4GjNzuKMKHpArR_ypppJ0Tw@mail.gmail.com>
References: <1452096440-6476-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452096440-6476-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 6, 2016 at 10:07 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> The driver MAX8973 supports the driver for Maxim PMIC MAX77621.
> MAX77621 supports the  junction temp warning at 120 degC and
> 140 degC which is configurable. It generates alert signal when
> junction temperature crosses these threshold.

Sorry, this one fell thru the cracks.

> MAX77621 does not support the continuous temp monitoring of
> junction temperature. It just report whether junction temperature
> crossed the threshold or not.
>
> Add support to
> - Configure junction temp warning threshold via DT property
>   to generate alert when it crosses the threshold.
> - Add support to interrupt the host from this device when alert
>   occurred.
> - read the junction temp via thermal framework.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> Changes from v1:
> - Remove irq flags from DT
> - More details about supported temp by MAX77621
>
>  .../bindings/regulator/max8973-regulator.txt       |   5 +
>  drivers/regulator/max8973-regulator.c              | 140 ++++++++++++++++++++-
>  include/linux/regulator/max8973-regulator.h        |   4 +
>  3 files changed, 147 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
> index f80ea2f..93f9939 100644
> --- a/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/max8973-regulator.txt
> @@ -31,6 +31,11 @@ Optional properties:
>                 property is available then etr will be enable default.
>
>  Enhanced transient response (ETR) will affect the configuration of CKADV.
> +-maxim,junction-temp-warning: Junction temp warning on which device generates
> +               warning interrupts. This is in millicelcius.

Please append units: maxim,junction-temp-warning-millicelsius or
perhaps maxim,junction-warn-millicelsius to shorten it a bit.

> +
> +Please note that thermal functionality is only supported on MAX77621. The
> +threshold warning supported by MAX77621 are 120 degC and 140 degC.
>
>  Example:
>
