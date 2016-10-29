From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v4 6/8] dt-bindings: Add support for Amlogic GXBB SCPI Interface
Date: Sat, 29 Oct 2016 11:39:05 -0700
Message-ID: <CAOesGMjY5_ibP7E9+DBf30nuV+2z2kecLv_ddnHjp3txuq+Kdg@mail.gmail.com>
References: <1475652814-30619-1-git-send-email-narmstrong@baylibre.com> <1475652814-30619-7-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475652814-30619-7-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,


On Wed, Oct 5, 2016 at 12:33 AM, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/arm,scpi.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
> index faa4b44..04bc171 100644
> --- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
> +++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
> @@ -7,7 +7,7 @@ by Linux to initiate various system control and power operations.
>
>  Required properties:
>
> -- compatible : should be "arm,scpi"
> +- compatible : should be "arm,scpi" or "amlogic,meson-gxbb-scpi"

This doesn't seem right to document here. If anything you might want
to have a table of more-specific-compatibles for specific
implementations, but "arm,scpi" should still be the compatible of the
node (just not the most specific one).

Also, documenting it here indiciates that non-amlogic implementations
can/should use that compatible, which is misleading.

>  - mboxes: List of phandle and mailbox channel specifiers
>           All the channels reserved by remote SCP firmware for use by
>           SCPI message protocol should be specified in any order
> @@ -60,7 +60,8 @@ A small area of SRAM is reserved for SCPI communication between application
>  processors and SCP.
>
>  Required properties:
> -- compatible : should be "arm,juno-sram-ns" for Non-secure SRAM on Juno
> +- compatible : should be "arm,juno-sram-ns" for Non-secure SRAM on Juno,
> +               or "amlogic,meson-gxbb-sram" for Amlogic GXBB SoC.

Maybe you'd be better of with a meson-specific document that refers to
these but with different compatible values.

Come to think of it, the Juno-specific one maybe shouldn't be in
arm,scpi at all, since that adds confusion here.

It's somewhat confusing that ARM is both a platform, architecture and
in some cases implementer of specific systems. :)

>  The rest of the properties should follow the generic mmio-sram description
>  found in ../../sram/sram.txt
> @@ -70,7 +71,8 @@ Each sub-node represents the reserved area for SCPI.
>  Required sub-node properties:
>  - reg : The base offset and size of the reserved area with the SRAM
>  - compatible : should be "arm,juno-scp-shmem" for Non-secure SRAM based
> -              shared memory on Juno platforms
> +              shared memory on Juno platforms or
> +              "amlogic,meson-gxbb-scp-shmem" for Amlogic GXBB SoC.

Same here. It won't scale if all vendors are expected to add an entry here.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
