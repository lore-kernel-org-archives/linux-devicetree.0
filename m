From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] DT: mfd: pm8xxx: Add new compatible string
Date: Wed, 24 Sep 2014 09:56:21 +0100
Message-ID: <20140924085621.GJ17801@lee--X1>
References: <1411480360-18091-1-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1411480360-18091-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

On Tue, 23 Sep 2014, Stanimir Varbanov wrote:

> The rtc driver now supports PM8941 PMIC device, reflect this
> in the binding document.
>=20
> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8xxx.txt        |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt b/=
Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
> index 03518dc..f24f334 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
> @@ -61,6 +61,7 @@ The below bindings specify the set of valid subnode=
s.
>  	Definition: must be one of:
>  		    "qcom,pm8058-rtc"
>  		    "qcom,pm8921-rtc"
> +		    "qcom,pm8941-rtc"
> =20
>  - reg:
>  	Usage: required

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
