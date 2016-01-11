From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/2] mfd: arizona: Update binding docs for selecting
 mono/stereo outputs
Date: Mon, 11 Jan 2016 07:32:10 +0000
Message-ID: <20160111073210.GZ3331@x1>
References: <1450088352-10470-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1450088352-10470-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450088352-10470-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, robh@kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 14 Dec 2015, Charles Keepax wrote:

> Update the device tree binding documentation to include the wlf,out-m=
ono
> property that is used to specify whether each output is a mono or ste=
reo
> output.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>=20
> Changes since v1:
>  - Clarify which outputs correspond to which entry in the out-mono li=
st.
>=20
> Thanks,
> Charles
>=20
>  Documentation/devicetree/bindings/mfd/arizona.txt | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index 2b6ccdb..069e31d 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -65,6 +65,12 @@ Optional properties:
>      that have not been specified are set to 0 by default. Entries ar=
e:
>      <IN1, IN2, IN3, IN4> (wm5102, wm5110, wm8280, wm8997)
>      <IN1A, IN2A, IN1B, IN2B> (wm8998, wm1814)
> +  - wlf,out-mono : A list of boolean values indicating whether each =
output is
> +    mono or stereo. Position within the list indicates the output af=
fected
> +    (eg. First entry in the list corresponds to output 1). A non-zer=
o value
> +    indicates a mono output. If present, the number of values should=
 be less
> +    than or equal to the number of outputs, if less values are suppl=
ied the
> +    additional outputs will be treated as stereo.
> =20
>    - wlf,dmic-ref : DMIC reference voltage source for each input, can=
 be
>      selected from either MICVDD or one of the MICBIAS's, defines

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
