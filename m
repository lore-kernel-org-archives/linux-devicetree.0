From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 02/10] dt-bindings: display: renesas: Deprecate LVDS
 support in the DU bindings
Date: Fri, 12 Jan 2018 17:52:26 +0300
Message-ID: <21f02d6c-0656-8892-9106-c806f357afe5@cogentembedded.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-3-laurent.pinchart+renesas@ideasonboard.com>
 <c5d423c8-2546-a0a7-2cb1-502cecb25958@mentor.com> <3622701.UmU0kKHARM@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3622701.UmU0kKHARM@avalon>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/12/2018 01:43 PM, Laurent Pinchart wrote:

>>> The internal LVDS encoders now have their own DT bindings, representing
>>> them as part of the DU is deprecated.
>>>
>>> Signed-off-by: Laurent Pinchart
>>> <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>>> ---
>>>
>>>   .../devicetree/bindings/display/renesas,du.txt     | 26
>>>   +++++++++------------- 1 file changed, 11 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
>>> b/Documentation/devicetree/bindings/display/renesas,du.txt index
>>> cd48aba3bc8c..8f6e0e118e3e 100644
>>> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
>>> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
[...]
>>> @@ -71,7 +68,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>>>   		compatible = "renesas,du-r8a7795";
>>>   		reg = <0 0xfeb00000 0 0x80000>,
>>>   		      <0 0xfeb90000 0 0x14>;
>>> -		reg-names = "du", "lvds.0";
>>> +		reg-names = "du";
>>
>> Since "reg-names" list is changed, I believe you'd like to update
>> the "reg" property value as well.
> 
> Good point, I'll fix it.

    Could you also totally drop "reg-names"? Or is that a strong requirement 
now? I mostly dislike how this memory region is named in /proc/iomem... :-)

[...]

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
