From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 6/6] extcon: arizona: Update DT binding documentation
 for jack detection
Date: Fri, 20 Nov 2015 11:06:25 +0900
Message-ID: <564E8021.80406@samsung.com>
References: <1447947940-3054-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1447947940-3054-7-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1447947940-3054-7-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Charles,

On 2015=EB=85=84 11=EC=9B=94 20=EC=9D=BC 00:45, Charles Keepax wrote:
> Add additional bindings for both inverting the polarity of the jack
> detection pins and allowing the use of a second jack detection pin. N=
ote
> that the second jack detection pin is hard wired in the chip so can o=
nly
> be enabled through the binding, rather than a pin being specified.
>=20
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> Reviewed-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/extcon/extcon-arizona.txt  |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.=
txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> index d661811..7640a35 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -14,6 +14,12 @@ Optional properties:
>      If this node is not mentioned or if the value is unknown, then
>      headphone detection mode is set to HPDETL.
> =20
> +  - wlf,use-jd-gpio : Use GPIO input along with JD1 for dual pin jac=
k
> +    detection.

This property naming might cause the confusion.
If some don't know the knowledge of extcon-arizona,
it seems like the specific GPIO pin.

But I'll apply the all patches of this patchset
because these patchest take the too long time for review.

I'd like you to modify the this property name on later patch.

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
