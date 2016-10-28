From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] drm/panel: simple: add support for Sharp
 LQ150X1LG11 panels
Date: Fri, 28 Oct 2016 14:18:43 +0200
Message-ID: <464e0d3e-494e-268d-d57d-04c7cedd1e7c@axentia.se>
References: <1475594961-5713-1-git-send-email-peda@axentia.se>
 <1475594961-5713-3-git-send-email-peda@axentia.se>
 <20161019122750.GA16158@ulmo.ba.sec> <20161019123153.GB16158@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161019123153.GB16158-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Gustaf_Lindstr=c3=b6m?= <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-10-19 14:31, Thierry Reding wrote:
> On Wed, Oct 19, 2016 at 02:27:50PM +0200, Thierry Reding wrote:
>> On Tue, Oct 04, 2016 at 05:29:21PM +0200, Peter Rosin wrote:
>>> From: Gustaf Lindström <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
>>>
>>> The Sharp 15" LQ150X1LG11 panel is an XGA TFT LCD panel.
>>>
>>> The simple-panel driver is used to get support for essential
>>> functionality of the panel.
>>>
>>> Signed-off-by: Gustaf Lindström <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
>>> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
>>> ---
>>>  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>>> index 85143d1b9b31..58cfe0a7a9d6 100644
>>> --- a/drivers/gpu/drm/panel/panel-simple.c
>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>>> @@ -1386,6 +1386,30 @@ static const struct panel_desc sharp_lq123p1jx31 = {
>>>  	},
>>>  };
>>>  
>>> +static const struct drm_display_mode sharp_lq150x1lg11_mode = {
>>> +	.clock = 71100,
>>> +	.hdisplay = 1024,
>>> +	.hsync_start = 1024 + 168,
>>> +	.hsync_end = 1024 + 168 + 64,
>>> +	.htotal = 1024 + 168 + 64 + 88,
>>> +	.vdisplay = 768,
>>> +	.vsync_start = 768 + 37,
>>> +	.vsync_end = 768 + 37 + 2,
>>> +	.vtotal = 768 + 37 + 2 + 8,
>>> +	.vrefresh = 60,
>>> +};
>>> +
>>> +static const struct panel_desc sharp_lq150x1lg11 = {
>>> +	.modes = &sharp_lq150x1lg11_mode,
>>> +	.num_modes = 1,
>>> +	.bpc = 8,
>>> +	.size = {
>>> +		.width = 304,
>>> +		.height = 228,
>>> +	},
>>> +	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
>>
>> This doesn't match the .bpc = 8 above. You'd usually use a .bpc = 6 for
>> RGB565 panels.
> 
> Are you actually using the .bpc field in your driver? If yes, can you
> please test if things work correctly if you set it to 6? If it's unused
> I'm leaning towards just applying this with .bpc set to 6 and hope for
> the best (and fix it if somebody finds that it's broken).
> 
> So no need to resend, just let me know what you think.

Sorry for the delay, but I just tested .bpc = 6 and it was ok too. It
doesn't seem to matter for us, so do as you like.

Cheers,
Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
