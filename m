From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/4] drm/tilcdc: Add blue-and-red-wiring -device tree
 property
Date: Fri, 19 Aug 2016 14:48:48 +0300
Message-ID: <c5399808-0245-6a68-0ccd-da7675ac8696@ti.com>
References: <cover.1471334845.git.jsarha@ti.com>
 <9c5bd87d77527aa7a88ab0c006387ed565606c8e.1471334845.git.jsarha@ti.com>
 <20160818191739.GA23056@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160818191739.GA23056@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, peter.ujfalusi-l0cyMroinI0@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/18/16 22:17, Rob Herring wrote:
> On Tue, Aug 16, 2016 at 12:24:28PM +0300, Jyri Sarha wrote:
>> Add "blue-and-red-wiring"-device tree property and update devicetree
>> binding document. The red and blue components are reversed between 24
>> and 16 bit modes on am335x LCDC output pins. To get 24 RGB format the
>> red and blue wires has to be crossed and this in turn causes 16 colors
>> output to be in BGR format. With straight wiring the 16 color is RGB
>> and 24 bit is BGR. The new property describes whether the red and blue
>> wires are crossed or not. The am335x-evm has the wires going to LCD
>> crossed and that is chosen to be the default mode if
>> "blue-and-red-wiring"-property is not found.
>>
>> For more details see section 3.1.1 in AM335x Silicon Errata:
>> http://www.ti.com/general/docs/lit/getliterature.tsp?baseLiteratureNumber=sprz360
>>
>> Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
>> ---
>>  .../devicetree/bindings/display/tilcdc/tilcdc.txt  | 12 ++++++
>>  drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 44 ++++++++++++++++++++++
>>  drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  4 ++
>>  drivers/gpu/drm/tilcdc/tilcdc_plane.c              |  9 ++---
>>  4 files changed, 63 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
>> index 6efa4c5..992803b 100644
>> --- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
>> +++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
>> @@ -17,6 +17,8 @@ Optional properties:
>>     the lcd controller.
>>   - max-pixelclock: The maximum pixel clock that can be supported
>>     by the lcd controller in KHz.
>> + - blue-and-red-wiring: Either "crossed" or "straight", if not present
>> +   crossed wiring is assumed for dtb backward compatibility. [1]
> 
> Just do a boolean and restrict it to a particular compatible string so 
> we don't have to carry it forever on new parts.
>

Do you mean having "blue-and-red-straight" boolean property to keep old
dtbs compatible, or coming up with a new compatible string (I actually
hate ti,tilcdc tautology) and having "blue-and-red-crossed" boolean there?

BTW, I find it unlikely that there will be new versions of LCDC coming
any more, so the errata will remain "forever" on LCDC and will only fade
out when the am3 fades out. I base my assumption only on the fact that
am4 does not have LCDC any more.

Best regards,
Jyri

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
