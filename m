From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/10] dt-bindings: display: xlnx: Add Xilinx kms bindings
Date: Thu, 11 Jan 2018 08:43:13 -0600
Message-ID: <CAL_JsqJ_84qg=oJb=HzwgdP9T8osczNT-Eo+u5wjJfT3B8gAQQ@mail.gmail.com>
References: <1515117959-18068-1-git-send-email-hyun.kwon@xilinx.com>
 <1515117959-18068-2-git-send-email-hyun.kwon@xilinx.com> <20180109040011.crwkn5j76cmdfvfm@rob-hp-laptop>
 <BY1PR0201MB1000969ECDC38A62F68B7238D6160@BY1PR0201MB1000.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BY1PR0201MB1000969ECDC38A62F68B7238D6160-QYJsKn8jqXK8fGmG9BO4UxrHTHEw16jenBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 10, 2018 at 8:04 PM, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Rob,
>
> Thanks for the feedback.
>
>> -----Original Message-----
>> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
>> Sent: Monday, January 08, 2018 8:00 PM
>> To: Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Michal
>> Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> Subject: Re: [PATCH 01/10] dt-bindings: display: xlnx: Add Xilinx kms
>> bindings
>>
>> On Thu, Jan 04, 2018 at 06:05:50PM -0800, Hyun Kwon wrote:
>> > The dt binding for Xilinx DRM KMS driver.
>>
>> Bindings are for h/w, not drivers.
>
> I'll rephrase this.
>
>>
>> >
>> > Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/display/xlnx/xlnx,kms.txt    | 20
>> ++++++++++++++++++++
>> >  1 file changed, 20 insertions(+)
>> >  create mode 100644
>> Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt
>> b/Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt
>> > new file mode 100644
>> > index 0000000..8dcd552
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt
>> > @@ -0,0 +1,20 @@
>> > +Xilinx KMS Pipeline
>> > +-------------------
>> > +
>> > +Xilinx display pipelines can be designed with hardened video IPs and soft
>> video
>> > +IPs in programmable logic. This KMS module provides the common
>> functionality
>> > +of individual subdevice drivers, and glue logics between them.
>> > +
>> > +Required properties:
>> > +
>> > +- compatible: Must be "xlnx,kms".
>
> I'll also rephrase the description and rename this to xlnx,display.
>
>> > +
>> > +- ports: phandles for CRTC ports, using the DT bindings defined in
>> > +  Documentation/devicetree/bindings/graph.txt.
>>
>> This use of ports is not part of the graph binding.
>
> I'll add more details in the description.
>
>>
>> > +
>> > +Example:
>> > +
>> > +   xlnx_drm: xlnx_drm {
>> > +           compatible = "xlnx,kms";
>>
>> drm and kms are Linuxisms.
>
> I agree. I'll remove linux subsystem specific terms.
>
>>
>> Why do you need this node?
>
> This node is used to represent a display pipeline as a single entity, which can consist of multiple components / IPs. I'll elaborate more per your suggestion.

You generally don't need that. Just have the DRM driver match with the
first block in the display pipeline. Then use the OF graph to connect
to the other components in the pipeline. It would help to have a block
diagram showing the data pipelines and h/w blocks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
