From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of: add URT UMSH-8596MD-xT panel DT bindings
Date: Tue, 13 Oct 2015 08:30:17 -0500
Message-ID: <CAL_JsqKi2UVjQC1uELMPWi_k-_atVov=fr565ngCnGm+xjbC_g@mail.gmail.com>
References: <56158803.9000300@maciej.szmigiero.name> <20151008082759.GD3820@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151008082759.GD3820@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 8, 2015 at 3:27 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Oct 07, 2015 at 11:00:51PM +0200, Maciej S. Szmigiero wrote:
>> This patch adds DT bindings for United Radiant Technology
>> UMSH-8596MD-xT 7.0" WVGA TFT LCD panels.
>>
>> Signed-off-by: Maciej Szmigiero <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
>>
>> diff --git a/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
>> new file mode 100644
>> index 0000000..57c5fa4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
>> @@ -0,0 +1,12 @@
>> +United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
>> +
>> +Supported are LVDS versions (-11T, -19T) and parallel ones
>> +(-T, -1T, -7T, -20T).
>> +
>> +Required properties:
>> +- compatible: should be one of:
>> +  "urt,umsh-8596md-t", "urt,umsh-8596md-1t", "urt,umsh-8596md-7t",
>> +  "urt,umsh-8596md-11t", "urt,umsh-8596md-19t" or "urt,umsh-8596md-20t".
>
> I'd probably list each of these on a single line for slightly more
> clarity, but no need to respin because of that.
>
> Rob, I remember there was some discussion a while back on whether or not
> there should be a standard way of describing lists of compatible values,
> do you know if anything was ever concluded on that topic?

We're working to move the documentation to YAML and describe
constraints like this with logic expressions, but we haven't settled
on anything yet. This case will probably be just one string per line.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
