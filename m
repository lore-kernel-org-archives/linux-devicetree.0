From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2 v2] mfd: arizona: Add DT binding documentation for
 DMIC reference voltages
Date: Mon, 9 Mar 2015 09:38:20 +0000
Message-ID: <20150309093820.GK3427@x1>
References: <1425395094-22397-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1425395094-22397-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425395094-22397-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: sameo@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, 03 Mar 2015, Charles Keepax wrote:

> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index bfef000..f1b9b7a 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -49,6 +49,12 @@ Optional properties:
>      input singals. If values less than the number of input signals, =
elements
>      that has not been specifed are set to 0 by default.
> =20
> +  - wlf,dmic-ref : DMIC reference voltage source for each input, can=
 be
> +    selected from either MICVDD or one of the MICBIAS's, defines
> +    (ARIZONA_DMIC_xxxx) are provided in <dt-bindings/mfd/arizona.txt=
>. If
> +    present, the number of values should be less than or equal to th=
e
> +    number of inputs, unspecified inputs will use the chip default.
> +
>    - DCVDD-supply, MICVDD-supply : Power supplies, only need to be sp=
ecified if
>      they are being externally supplied. As covered in
>      Documentation/devicetree/bindings/regulator/regulator.txt

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
