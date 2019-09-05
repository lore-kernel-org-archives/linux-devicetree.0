From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 01/49] dt: bindings: net: add qcom,ath11k.txt
Date: Thu, 05 Sep 2019 16:18:08 +0300
Message-ID: <87o8zylw4v.fsf@kamboji.qca.qualcomm.com>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
        <1566316095-27507-2-git-send-email-kvalo@codeaurora.org>
        <20190827171307.GA23128@bogus>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20190827171307.GA23128@bogus> (Rob Herring's message of "Tue, 27
        Aug 2019 12:13:07 -0500")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Tue, Aug 20, 2019 at 06:47:27PM +0300, Kalle Valo wrote:
>
> Missing commit message and Sob (and on the other patches).

My original plan was to commit all this in one commit and use the cover
letter as my commit. But based on your comment I realised we should have
three commits:

1. devicetree bindings doc
2. ath11k itself
3. add entry to MAINTAINERS file

>> ---
>>  .../bindings/net/wireless/qcom,ath11k.txt          | 127 +++++++++++++++++++++
>>  1 file changed, 127 insertions(+)
>
> Please use the DT schema format (YAML). See writing-schema.md.

Oh, I didn't know about the new format. We'll use that.

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.txt
>> @@ -0,0 +1,127 @@
>> +* Qualcomm Technologies ath11k wireless devices
>> +
>> +Required properties:
>> +- compatible: Should be "qcom,ipq8074-wifi"
>> +
>> +AHB based ipq8074 uses most of the properties defined in this doc.
>> +
>> +Optional properties:
>> +- reg: Address and length of the register set for the device.
>> +- interrupts: List of interrupt lines. Must contain an entry
>> +	      for each entry in the interrupt-names property.
>
> Need to be explicit as to how many interrupts and what they are.

Ok, we'll add that.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
