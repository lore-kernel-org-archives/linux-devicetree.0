Return-Path: <SRS0=a92g=NC=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20181018152916.9355-1-marek.behun@nic.cz>
References: <20181018152916.9355-1-marek.behun@nic.cz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 22 Oct 2018 14:23:04 +0200
Message-ID: <CAPDyKFpUsOi3V05DrbB8rU9O1dj4uP7GkV-Cq+U5WU1Uy8ysyw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: Document no-uhs-voltage MMC property
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 18 October 2018 at 17:29, Marek Beh=C3=BAn <marek.behun@nic.cz> wrote:
> Add documentation for no-uhs-voltage MMC property.
>
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/mmc/mmc.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentatio=
n/devicetree/bindings/mmc/mmc.txt
> index f5a0923b34ca..0506dcbc2070 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/mmc.txt
> @@ -55,6 +55,7 @@ Optional properties:
>  - no-sdio: controller is limited to send sdio cmd during initialization
>  - no-sd: controller is limited to send sd cmd during initialization
>  - no-mmc: controller is limited to send mmc cmd during initialization
> +- no-uhs-voltage: controller does not support switching to UHS voltage

We already have bindings for telling which UHS modes that are supported.

It doesn't make sense to me, to also have a binding saying that UHS
mode isn't supported, as that information is already available.

>  - fixed-emmc-driver-type: for non-removable eMMC, enforce this driver ty=
pe.
>    The value <n> is the driver type as specified in the eMMC specificatio=
n
>    (table 206 in spec version 5.1).
> --
> 2.18.1
>

Kind regards
Uffe
