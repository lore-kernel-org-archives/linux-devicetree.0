From: "Valo, Kalle" <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [PATCH] dt: bindings: add new dt entry for pre calibration in
 qcom, ath10k.txt
Date: Wed, 23 Mar 2016 12:07:49 +0000
Message-ID: <87poulfld8.fsf@kamboji.qca.qualcomm.com>
References: <1457604724-14378-1-git-send-email-rmani@qti.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457604724-14378-1-git-send-email-rmani-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org> (Raja
	Mani's message of "Thu, 10 Mar 2016 15:42:04 +0530")
Content-Language: en-US
Content-ID: <58C490DB42889445B42B5F44F353681D-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raja Mani <rmani-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Raja Mani <rmani-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org> writes:

> There two things done in this patch,
>
> 1) Existing device tree entry 'qcom,ath10k-calibration-data' carries
>    not only calibration data, it carries board specific data too.
>    So, make appropriate update in doc.
>
> 2) ipq4019 wifi needs new devie tree entry to carry calibration
>    data alone (called pre cal data, it doesn't include any other info).
>    Using 'qcom,ath10k-calibration-data' for ipq4019 would alter
>    the purpose of it. Hence, add new device tree entry called
>    'qcom,ath10k-pre-calibration-data' to carry only pre calibration data.
>
> Signed-off-by: Raja Mani <rmani-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>

Applied, thanks.

-- 
Kalle Valo--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
