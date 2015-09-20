From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 6/6] mfd: arizona: Update DT binding documentation for
 jack detection
Date: Sun, 20 Sep 2015 05:17:13 +0100
Message-ID: <20150920041713.GH3039@x1>
References: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1442397404-7579-7-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442397404-7579-7-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: cw00.choi@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 16 Sep 2015, Charles Keepax wrote:

> Add additional bindings for both inverting the polarity of the jack
> detection pins and allowing the use of a second jack detection pin. N=
ote
> that the second jack detection pin is hard wired in the chip so can o=
nly
> be enabled through the binding, rather than a pin being specified.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index b98a11b..cb3a652 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -73,6 +73,12 @@ Optional properties:
>      If this node is not mentioned or if the value is unknown, then
>      headphone detection mode is set to HPDETL.
> =20
> +  - wlf,use-jd-gpio : Use GPIO input along with JD1 for dual pin jac=
k
> +    detection.
> +  - wlf,use-jd-gpio-nopull : Internal pull on GPIO is disabled when =
used for
> +    jack detection.
> +  - wlf,jd-invert : Invert the polarity of the jack detection switch

As before, I need an Ack from one of the DT guys, or perhaps Linus W.

>    - wlf,micd-software-compare : Use a software comparison to determi=
ne mic
>      presence
>    - wlf,micd-detect-debounce : Additional software microphone detect=
ion

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
