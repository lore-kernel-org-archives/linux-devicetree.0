From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Tue, 13 Oct 2015 09:08:00 +0100
Message-ID: <20151013080800.GY17172@x1>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: cw00.choi@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Fri, 02 Oct 2015, Charles Keepax wrote:

> Add additional bindings to allow configuration of the system specific
> microphone detection settings.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt |   21 +++++++++++=
++++++++++
>  include/dt-bindings/mfd/arizona.h                 |    5 +++++
>  2 files changed, 26 insertions(+), 0 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index a8fee60..b98a11b 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -73,6 +73,27 @@ Optional properties:
>      If this node is not mentioned or if the value is unknown, then
>      headphone detection mode is set to HPDETL.
> =20
> +  - wlf,micd-software-compare : Use a software comparison to determi=
ne mic
> +    presence
> +  - wlf,micd-detect-debounce : Additional software microphone detect=
ion
> +    debounce specified in milliseconds.
> +  - wlf,micd-pol-gpio : GPIO specifier for the GPIO controlling the =
headset
> +    polarity if one exists.
> +  - wlf,micd-bias-start-time : Time allowed for MICBIAS to startup p=
rior to
> +    performing microphone detection, specified as per the ARIZONA_MI=
CD_TIME_XXX
> +    defines.
> +  - wlf,micd-rate : Delay between successive microphone detection me=
asurements,
> +    specified as per the ARIZONA_MICD_TIME_XXX defines.
> +  - wlf,micd-dbtime : Microphone detection hardware debounces specif=
ied as the
> +    number of measurements to take, valid values being 2 and 4.
> +  - wlf,micd-timeout : Timeout for microphone detection, specified i=
n
> +    milliseconds.
> +  - wlf,micd-force-micbias : Force MICBIAS continuously on during mi=
crophone
> +    detection.
> +
> +  - wlf,gpsw : Settings for the general purpose switch, set as one o=
f the
> +    ARIZONA_GPSW_XXX defines.

Where are all of these bindings to be consumed?

>    - DCVDD-supply, MICVDD-supply : Power supplies, only need to be sp=
ecified if
>      they are being externally supplied. As covered in
>      Documentation/devicetree/bindings/regulator/regulator.txt
> diff --git a/include/dt-bindings/mfd/arizona.h b/include/dt-bindings/=
mfd/arizona.h
> index c40f665..dedf46f 100644
> --- a/include/dt-bindings/mfd/arizona.h
> +++ b/include/dt-bindings/mfd/arizona.h
> @@ -110,4 +110,9 @@
>  #define ARIZONA_ACCDET_MODE_HPM 4
>  #define ARIZONA_ACCDET_MODE_ADC 7
> =20
> +#define ARIZONA_GPSW_OPEN           0
> +#define ARIZONA_GPSW_CLOSED         1
> +#define ARIZONA_GPSW_CLAMP_ENABLED  2
> +#define ARIZONA_GPSW_CLAMP_DISABLED 3
> +
>  #endif

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
