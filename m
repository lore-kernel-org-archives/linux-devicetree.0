From: "Valo, Kalle" <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [PATCH 3/4] dt: bindings: add new dt entry for BTCOEX feature in
 qcom, ath10k.txt
Date: Tue, 15 Nov 2016 13:39:08 +0000
Message-ID: <87twb8q2v8.fsf@kamboji.qca.qualcomm.com>
References: <1478617462-28188-1-git-send-email-c_traja@qti.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478617462-28188-1-git-send-email-c_traja-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org> (c.
        traja's message of "Tue, 8 Nov 2016 20:34:22 +0530")
Content-Language: en-US
Content-ID: <A3614307848C1144B7EB6F0907F4D7F7-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Raja, Tamizh Chelvam" <c_traja-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>
Cc: "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "tamizhchelvam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <tamizhchelvam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(Adding devicetree list)

<c_traja-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org> writes:

> From: Tamizh chelvam <tamizhchelvam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>
> There two things done in this patch.
>
> 1) 'btcoex_support' flag for BTCOEX feature support by the hardware.
> 2) 'wlan_btcoex_gpio' is used to fill wlan priority pin number for
>    BTCOEX priority feature support.
>
> Signed-off-by: Tamizh chelvam <tamizhchelvam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          |    4 ++++
>  1 file changed, 4 insertions(+)

As this changes the device tree bindings you need to CC the device tree
list. Please resend the whole patchset (and mark it as v2).

--=20
Kalle Valo=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
