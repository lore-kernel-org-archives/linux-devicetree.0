From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: display: move ANX7814 and SiI8620 bridge
 bindings
Date: Wed, 1 Feb 2017 10:23:52 +0100
Message-ID: <f1745894-5cbb-8dfa-0428-14cb5cbc771c@collabora.com>
References: <20170131175417.20486-1-robh@kernel.org>
 <45552135-5904-f235-5b5e-d0dc26052204@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <45552135-5904-f235-5b5e-d0dc26052204-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 01/02/17 04:20, Archit Taneja wrote:
> 
> 
> On 01/31/2017 11:24 PM, Rob Herring wrote:
>> A few bindings snuck into bindings/video/bridge since consolidating
>> everything under bindings/display/bridge/. Move them to the correct
>> spot.
>>
>> Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>> Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Acked-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Acked-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

> 
>> ---
>>
>> I plan to apply this to my tree.
>>
>> Rob
>>
>>  Documentation/devicetree/bindings/{video => display}/bridge/anx7814.txt   | 0
>>  .../devicetree/bindings/{video => display}/bridge/sil-sii8620.txt         | 0
>>  2 files changed, 0 insertions(+), 0 deletions(-)
>>  rename Documentation/devicetree/bindings/{video => display}/bridge/anx7814.txt (100%)
>>  rename Documentation/devicetree/bindings/{video => display}/bridge/sil-sii8620.txt (100%)
>>
>> diff --git a/Documentation/devicetree/bindings/video/bridge/anx7814.txt b/Documentation/devicetree/bindings/display/bridge/anx7814.txt
>> similarity index 100%
>> rename from Documentation/devicetree/bindings/video/bridge/anx7814.txt
>> rename to Documentation/devicetree/bindings/display/bridge/anx7814.txt
>> diff --git a/Documentation/devicetree/bindings/video/bridge/sil-sii8620.txt b/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
>> similarity index 100%
>> rename from Documentation/devicetree/bindings/video/bridge/sil-sii8620.txt
>> rename to Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
>>
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
