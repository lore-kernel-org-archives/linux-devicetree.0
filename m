From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/6] drm: of: introduce drm_of_find_panel_or_bridge
Date: Mon, 13 Feb 2017 19:25:35 -0600
Message-ID: <CAL_Jsq+p9ZBWTg-H1rtUYJ-cM4E++AO49h-ey916XahiRpkT5Q@mail.gmail.com>
References: <20170209190558.4784-1-robh@kernel.org> <20170209190558.4784-4-robh@kernel.org>
 <3364e435-c178-0bfc-5c3c-611d27a17d3d@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3364e435-c178-0bfc-5c3c-611d27a17d3d-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 12, 2017 at 10:47 PM, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
>
> On 02/10/2017 12:35 AM, Rob Herring wrote:
>>
>> Many drivers have a common pattern of searching the OF graph for either an
>> attached panel or bridge and then finding the DRM struct for the panel
>> or bridge. Also, most drivers need to handle deferred probing when the
>> DRM device is not yet instantiated. Create a common function,
>> drm_of_find_panel_or_bridge, to find the connected node and the
>> associated DRM panel or bridge device.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>> v2:
>> - Reworked code flow
>> - Added note that at least one of panel or bridge must not be NULL.
>>
>>  drivers/gpu/drm/drm_of.c | 52
>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>  include/drm/drm_of.h     | 13 ++++++++++++
>>  2 files changed, 65 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
>> index 47848ed8ca48..86b8b959587a 100644
>> --- a/drivers/gpu/drm/drm_of.c
>> +++ b/drivers/gpu/drm/drm_of.c
>> @@ -3,7 +3,9 @@
>>  #include <linux/list.h>
>>  #include <linux/of_graph.h>
>>  #include <drm/drmP.h>
>> +#include <drm/drm_bridge.h>
>>  #include <drm/drm_crtc.h>
>> +#include <drm/drm_panel.h>
>>  #include <drm/drm_of.h>
>>
>>  static void drm_release_of(struct device *dev, void *data)
>> @@ -207,3 +209,53 @@ int drm_of_encoder_active_endpoint(struct device_node
>> *node,
>>         return -EINVAL;
>>  }
>>  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
>> +
>> +/*
>> + * drm_of_find_panel_or_bridge - return connected panel or bridge device
>> + * @np: device tree node containing encoder input ports
>
>
> Should this be 'encoder output ports'? It's the encoder's output port(s)
> that
> contain the endpoint corresponding to the bridge/panel input port.

Yes, indeed.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
