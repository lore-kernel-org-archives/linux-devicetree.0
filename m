From: "Valo, Kalle" <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [PATCH] dt: bindings: add new dt entry for pre calibration in
 qcom,ath10k.txt
Date: Wed, 23 Mar 2016 11:43:45 +0000
Message-ID: <87twjxfmhb.fsf@kamboji.qca.qualcomm.com>
References: <1457604724-14378-1-git-send-email-rmani@qti.qualcomm.com>
	<20160318161823.GA5558@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160318161823.GA5558@rob-hp-laptop> (Rob Herring's message of
	"Fri, 18 Mar 2016 11:18:23 -0500")
Content-Language: en-US
Content-ID: <1E767CB5F073EA479609EB7535C9B298-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Raja Mani <rmani-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Thu, Mar 10, 2016 at 03:42:04PM +0530, Raja Mani wrote:
>> There two things done in this patch,
>> 
>> 1) Existing device tree entry 'qcom,ath10k-calibration-data' carries
>>    not only calibration data, it carries board specific data too.
>>    So, make appropriate update in doc.
>> 
>> 2) ipq4019 wifi needs new devie tree entry to carry calibration
>>    data alone (called pre cal data, it doesn't include any other info).
>>    Using 'qcom,ath10k-calibration-data' for ipq4019 would alter
>>    the purpose of it. Hence, add new device tree entry called
>>    'qcom,ath10k-pre-calibration-data' to carry only pre calibration data.
>> 
>> Signed-off-by: Raja Mani <rmani-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>
>> ---
>> 
>> Below patches covers the corresponding changes in the ath10k driver.
>> It's posted separately to ath10k and linux-wireless mailing list.
>
> Generally the series should be posted together. The rest should not be 
> merged until this patch is accepted.

I'll merge them together, this as the first patch.

>>   1) ath10k: pass cal data location as an argument to ath10k_download_cal_{file|dt}
>>   2) ath10k: move cal data len to hw_params
>>   3) ath10k: incorporate qca4019 cal data download sequence
>> 
>>  .../bindings/net/wireless/qcom,ath10k.txt          | 23 +++++++++++++++-------
>>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks.

-- 
Kalle Valo--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
