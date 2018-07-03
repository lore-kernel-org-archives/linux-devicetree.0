From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 3/6] dt: bindings: add bindings for msa memory region
Date: Tue, 03 Jul 2018 18:42:24 +0300
Message-ID: <87o9fonx5r.fsf@kamboji.qca.qualcomm.com>
References: <20180605123616.528-1-govinds@codeaurora.org>
        <20180605231814.GB194157@rodete-desktop-imager.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180605231814.GB194157-rgVyoJUnxu4fQXCR9C5MjtfHHWVUegAGYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
        (Brian Norris's message of "Tue, 5 Jun 2018 16:18:16 -0700")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> writes:

> + Rob
>
> On Tue, Jun 05, 2018 at 06:06:16PM +0530, Govind Singh wrote:
>> Add device tree binding documentation details of msa
>> memory region for ath10k qmi client for SDM845/APQ8098
>> SoC into "qcom,ath10k.txt".
>> 
>> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> index 7fd4e8ce4149..0efc47f4ba34 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
>> @@ -56,6 +56,8 @@ Optional properties:
>>  				     the length can vary between hw versions.
>>  - <supply-name>-supply: handle to the regulator device tree node
>>  			   optional "supply-name" is "vdd-0.8-cx-mx".
>> +- msa-fixed-region: phandle, specifier to children of reserved MSA memory.
>
> As in reserved-memory/reserved-memory.txt? Might refer to that doc here.
> Or is this some other kind of reserved memory?
>
> If the former, it's normally called just "memory-region", although
> that does seem somewhat non-descriptive...
>
>> +- msa-size: MSA memory size for fw internal use.
>
> Do you really need both of these? It seems like your code uses one or
> the other, not both. In which case, this is not a very good description,
> because it sounds like they would go together.
>
> Also, if you're not using standard/generic properties (e.g., the
> aforementioned "memory-region" binding), you typically should use a
> vendor prefix, like "qcom,msa-size".

Devicetree folks, any comments? I would like to apply this via my
ath.git tree but need help with the review.

Full patch here:

https://patchwork.kernel.org/patch/10448169/

-- 
Kalle Valo
