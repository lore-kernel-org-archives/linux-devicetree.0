From: govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Subject: Re: [PATCH v2 13/13] dt: bindings: add bindings for wcn3990 wifi
 block
Date: Tue, 17 Apr 2018 09:57:35 +0530
Message-ID: <2807e56b227f483ac343c0e4d098aebe@codeaurora.org>
References: <1523378986-11551-1-git-send-email-govinds@codeaurora.org>
 <20180413215340.vhvlhlaapt5uuo7d@rob-hp-laptop>
 <878t9np561.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <878t9np561.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 2018-04-16 20:30, Kalle Valo wrote:
> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> 
>> On Tue, Apr 10, 2018 at 10:19:46PM +0530, Govind Singh wrote:
>>> Add device tree binding documentation details for wcn3990
>>> wifi block present in Qualcomm SDM845/APQ8098 SoC into
>>> "qcom,ath10k.txt".
>>> 
>>> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>> ---
>>>  .../bindings/net/wireless/qcom,ath10k.txt          | 31 
>>> ++++++++++++++++++++++
>>>  1 file changed, 31 insertions(+)
>> 
>> One nit, otherwise:
>> 
>> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> 
> 
> [...]
> 
>>> @@ -119,3 +126,27 @@ wifi0: wifi@a000000 {
>>>  	qcom,msi_base = <0x40>;
>>>  	qcom,ath10k-pre-calibration-data = [ 01 02 03 ... ];
>>>  };
>>> +
>>> +Example (to supply wcn3990 SoC wifi block details):
>>> +
>>> +qcom,wifi@18000000 {
>> 
>> wifi@...
> 
> I added this and Rob's Reviewed-by to the patch in the pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=20f4accbe76af8f137b4218ce4973bda6fc3d23e
> 
> Govind, please check that it's ok.

Looks good to me.

Thanks,
Govind
