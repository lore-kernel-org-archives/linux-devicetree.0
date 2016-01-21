From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [PATCH v3] dt: bindings: add bindings for ipq4019 wifi block
Date: Thu, 21 Jan 2016 13:46:02 +0200
Message-ID: <87y4bjyx39.fsf@kamboji.qca.qualcomm.com>
References: <1452664604-8014-1-git-send-email-rmani@qti.qualcomm.com>
	<20160115022021.GA27099@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160115022021.GA27099@rob-hp-laptop> (Rob Herring's message of
	"Thu, 14 Jan 2016 20:20:21 -0600")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Raja Mani <rmani-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Wed, Jan 13, 2016 at 11:26:44AM +0530, Raja Mani wrote:
>> Add device tree binding documentation details for wifi block present
>> in Qualcomm IPQ4019 SoC into "qcom,ath10k.txt".
>> 
>> Right now, ath10k wireless driver has support for PCI based wlan devices.
>> There is a plan to extend ath10k driver to support wifi devices which are
>> connected over AHB as well (enumeration will happen via device tree node).
>> For AHB based devices (ie, ipq4019), all wifi properties are supplied via
>> device tree (including irq, reg addr, cal data,etc).
>> 
>> Signed-off-by: Raja Mani <rmani-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>
>> ---
>> v3 changes:
>>   - Removed core-id - [Rob]
>>   - Documented which compatible string corresponds to pci devices
>>     and which corresponds to ahb devices. - [Rob]
>> 
>> v2 changes:
>>  - Improved "core-id" description - [Rob]
>>  - Removed "status" documentation - [Rob]
>>  - Added description which properties are applicable
>>    for ahb and which are applicable for pci devices - [Rob]
>>  - Improved commit msg to explain the context.
>>  - Renamed "qca,msi_addr" to "qcom,msi_addr" and
>>    "qca,msi_base" to "qcom,msi_base" to follow uniformity.
>> 
>>  .../bindings/net/wireless/qcom,ath10k.txt          | 89 ++++++++++++++++++++--
>>  1 file changed, 84 insertions(+), 5 deletions(-)
>
> A few typos, otherwise:
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob, thank you for the review. I fixed the typos in ath.git pending
branch and will properly apply this in few days.

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
