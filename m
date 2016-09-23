From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH v2] drm/panel: simple: add support for Sharp LQ150X1LG11
 panels
Date: Fri, 23 Sep 2016 23:39:47 +0200
Message-ID: <2727d658-d090-cc45-3b16-6133f2d8b3c8@axentia.se>
References: <1474104862-16957-1-git-send-email-peda@axentia.se>
 <20160923173948.GA26691@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160923173948.GA26691@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Gustaf_Lindstr=c3=b6m?= <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-09-23 19:39, Rob Herring wrote:
> On Sat, Sep 17, 2016 at 11:34:22AM +0200, Peter Rosin wrote:
>> From: Gustaf Lindström <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
>>
>> The Sharp 15" LQ150X1LG11 panel is an XGA TFT LCD panel.
>>
>> Signed-off-by: Gustaf Lindström <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
>> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
>> ---
>>  .../bindings/display/panel/sharp,lq150x1lg11.txt   |  7 ++++++
>>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
>>  2 files changed, 34 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
>>
>> v1->v2: correct author
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
>> new file mode 100644
>> index 000000000000..014428c984c8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
>> @@ -0,0 +1,7 @@
>> +Sharp 15" LQ150X1LG11 XGA TFT LCD panel
>> +
>> +Required properties:
>> +- compatible: should be "sharp,lq150x1lg11"
> 
> Looking at the spec, what about 12V VDD, 3.3V VCC, XSTABY (backlight 
> ctrl), VBR (PWM), RL/UD, SELLVDS signals?

I guess you're saying that simple-panel isn't the best match? Is it
ok to make the DT bindings more complete but still leave it to the
simple-panel driver to support part of it? Or should we just give
up for the time being, and carry a local patch pending a custom
driver?

Cheers,
Peter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
