From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 10/10] dt-bindings: Add DSIv2 documentation
Date: Fri, 20 Nov 2015 13:59:04 -0600
Message-ID: <CAL_JsqJ7PovZsz0=b90bUChKtNra1pXxEjU_DiYAn7JUgShm5Q@mail.gmail.com>
References: <1444827544-25656-1-git-send-email-architt@codeaurora.org>
 <1447844131-4182-1-git-send-email-architt@codeaurora.org> <1447844131-4182-11-git-send-email-architt@codeaurora.org>
 <CAL_JsqJufZvsGyxZ40+kPcAVr5mXqCi+Qej_8X6=GRxT9j+5+w@mail.gmail.com> <564C981F.3040907@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564C981F.3040907-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+Stephen

On Wed, Nov 18, 2015 at 9:24 AM, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> Hi Rob,
>
> On 11/18/2015 6:48 PM, Rob Herring wrote:
>>
>> +dt list
>>
>> On Wed, Nov 18, 2015 at 4:55 AM, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> wrote:
>>>
>>> Add additional property info needed for DSIv2 DT.
>>
>>
>> Please use get_maintainers.pl.
>
>
> Sorry about that, missed out doing that posting this time.
>
>>
>>> Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>> ---
>>>   Documentation/devicetree/bindings/display/msm/dsi.txt | 10 +++++++++-
>>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> b/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> index f344b9e..ca65a34 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
>>> @@ -13,18 +13,25 @@ Required properties:
>>>   - power-domains: Should be <&mmcc MDSS_GDSC>.
>>>   - clocks: device clocks
>>>     See Documentation/devicetree/bindings/clocks/clock-bindings.txt for
>>> details.
>>> -- clock-names: the following clocks are required:
>>> +- clock-names: these vary based on the DSI version. For DSI6G:
>>>     * "bus_clk"
>>>     * "byte_clk"
>>> +  * "byte_clk_src
>>
>>
>> This sounds like the parent of byte_clk. Is that really a clock within
>> the block?
>
>
> byte_clk_src isn't in the block, but byte_clk_src's parent is one of
> the PLLs in this block. We take this clock so that we can re-parent
> it to an appropriate PLL. The decision of what PLL to choose needs to
> be done by the DSI block's driver.

Seems like abuse to me. The list of clocks should match what are
inputs to the block, not what the driver happens to need. Without a
full understanding of the clock tree here, I don't have a suggestion.
Maybe Stephen does.

>>>     * "core_clk"
>>>     * "core_mmss_clk"
>>>     * "iface_clk"
>>>     * "mdp_core_clk"
>>>     * "pixel_clk"
>>> +  * "pixel_clk_src"
>>> +  For DSIv2, we need a few more:
>>
>>
>> What is the overall order of clocks? As listed?
>
>
> Order in which the driver does clk_get? It uses the clock
> name to get each one individually, so the order doesn't matter
> as such.

The order in DT. You may use the names, but the order should still be specified.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
