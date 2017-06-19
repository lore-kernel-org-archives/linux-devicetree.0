From: Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/10] doc: DT: camss: Binding document for Qualcomm
 Camera subsystem driver
Date: Mon, 19 Jun 2017 14:56:13 +0300
Message-ID: <c60a52a5-d4ce-ba77-4455-220021df0dd2@linaro.org>
References: <1480085813-28235-1-git-send-email-todor.tomov@linaro.org>
 <20161130220350.q37rbo2biaeg2sad@rob-hp-laptop> <58739F2D.5020607@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58739F2D.5020607-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 01/09/2017 04:33 PM, Todor Tomov wrote:
> Hi Rob,
> 
> Happy new year,
> And thank you for the review.
> 
> On 12/01/2016 12:03 AM, Rob Herring wrote:
>> On Fri, Nov 25, 2016 at 04:56:53PM +0200, Todor Tomov wrote:
>>> Add DT binding document for Qualcomm Camera subsystem driver.
>>>
>>> Signed-off-by: Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/media/qcom,camss.txt       | 196 +++++++++++++++++++++
>>>  1 file changed, 196 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,camss.txt b/Documentation/devicetree/bindings/media/qcom,camss.txt
>>> new file mode 100644
>>> index 0000000..76ad89a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,camss.txt
>>> @@ -0,0 +1,196 @@
>>> +Qualcomm Camera Subsystem
>>> +
>>> +* Properties
>>> +
>>> +- compatible:
>>> +	Usage: required
>>> +	Value type: <stringlist>
>>> +	Definition: Should contain:
>>> +		- "qcom,8x16-camss"
>>
>> Don't use wildcards in compatible strings. One string per SoC.
> 
> Ok, I'll fix this.
> 
>>
>>> +- reg:
>>> +	Usage: required
>>> +	Value type: <prop-encoded-array>
>>> +	Definition: Register ranges as listed in the reg-names property.
>>> +- reg-names:
>>> +	Usage: required
>>> +	Value type: <stringlist>
>>> +	Definition: Should contain the following entries:
>>> +		- "csiphy0"
>>> +		- "csiphy0_clk_mux"
>>> +		- "csiphy1"
>>> +		- "csiphy1_clk_mux"
>>> +		- "csid0"
>>> +		- "csid1"
>>> +		- "ispif"
>>> +		- "csi_clk_mux"
>>> +		- "vfe0"
>>
>> Kind of looks like the phy's should be separate nodes since each phy has 
>> its own register range, irq, clocks, etc.
> 
> Yes, there are a lot of hardware resources here.
> I have decided to keep everything into a single platform device as this
> represents it better from system point of view.
> 

Following this patch,
- following the short discussion which we had on Linaro Connect,
- following some evaluation of the possibilities,
I'd like to try to keep it as a single node. Some of the resources are separate
and so appear to be the clocks too but actually there are dependencies across the
hardware modules for clocks of their adjacent modules. In addition there
are configuration dependencies across the hardware modules - e.g. on a CSID module
a CSIPHY module's id needs to be set (and vice-versa), on a CSID module the
csi lane positions need to be set and so on. So I think a single driver to
handle this (and thus a single dt node) makes more sense. I'm preparing a
v2 of the patch set and will send it shortly.

-- 
Best regards,
Todor Tomov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
