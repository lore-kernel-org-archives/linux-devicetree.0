From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 6/6] mfd: arizona: Update DT binding documentation for jack
 detection
Date: Fri, 11 Sep 2015 17:09:04 +0900
Message-ID: <55F28C20.2080800@samsung.com>
References: <1441885307-24499-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1441885307-24499-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1441885307-24499-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, lee.jones@linaro.org
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 09=EC=9B=94 10=EC=9D=BC 20:41, Charles Keepax wrote:
> Add additional bindings for both inverting the polarity of the jack
> detection pins and allowing the use of a second jack detection pin. N=
ote
> that the second jack detection pin is hard wired in the chip so can o=
nly
> be enabled through the binding, rather than a pin being specified.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index b98a11b..48bca6a 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -73,6 +73,12 @@ Optional properties:
>      If this node is not mentioned or if the value is unknown, then
>      headphone detection mode is set to HPDETL.
> =20
> +  - wlf,use-jd-gpio : Use GPIO input alongwith JD1 for dual pin jack

s/alongwith/along with

> +    detection.
> +  - wlf,use-jd-gpio-nopull : Internal pull on GPIO is disabled when =
used for
> +    jack detection.
> +  - wlf,jd-invert : Invert the polarity of the jack detection switch
> +
>    - wlf,micd-software-compare : Use a software comparison to determi=
ne mic
>      presence
>    - wlf,micd-detect-debounce : Additional software microphone detect=
ion
>=20

If you fixes the minor typo, looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
