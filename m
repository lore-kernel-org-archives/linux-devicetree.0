From: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Subject: Re: [PATCH 3/3] drm: panel-simple: implement URT UMSH-8596MD-xT panel
 support
Date: Sat, 13 Feb 2016 22:46:59 +0100
Message-ID: <56BFA453.6020203@maciej.szmigiero.name>
References: <5615885C.5050505@maciej.szmigiero.name> <20151008082444.GC3820@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151008082444.GC3820@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

On 08.10.2015 10:24, Thierry Reding wrote:
> On Wed, Oct 07, 2015 at 11:02:20PM +0200, Maciej S. Szmigiero wrote:
>> This patch implements support for United Radiant Technology
>> UMSH-8596MD-xT 7.0" WVGA TFT LCD panels in DRM panel-simple
>> driver.
>>
>> Signed-off-by: Maciej Szmigiero <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
>> ---
>> This replaces "drm: panel-simple: add URT UMSH-8596MD-xT panel support"
>> submission.
>>
>>  drivers/gpu/drm/panel/panel-simple.c | 54 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
> 
> Looks good to me. I'll wait for Rob or anyone else to ack the vendor
> prefix before merging this.

Now the vendor prefix has been acked, but because some files have moved
since these patches were originally submitted I will update and resubmit them.

> Thierry
 
Maciej

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
