From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: bindings: media: Document port and endpoint numbering
Date: Thu, 21 Sep 2017 10:58:34 -0500
Message-ID: <CAL_JsqLX_cZv3_hwYjzFTcSkF+3bMoOeQw5qpFzT0W4agiXj1g@mail.gmail.com>
References: <1505723105-16238-1-git-send-email-sakari.ailus@linux.intel.com>
 <1505723105-16238-2-git-send-email-sakari.ailus@linux.intel.com>
 <20170920142438.wva4a5gz7ikfnlyh@rob-hp-laptop> <20170921092516.yzjelpxka4firnwx@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170921092516.yzjelpxka4firnwx-z7MJbOB4PBP+e+fPlCVrcFDQ4js95KgL@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 4:25 AM, Sakari Ailus
<sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> Hi Rob,
>
> Thanks for the reply.
>
> On Wed, Sep 20, 2017 at 03:53:13PM -0500, Rob Herring wrote:
>> On Mon, Sep 18, 2017 at 11:25:04AM +0300, Sakari Ailus wrote:
>> > A lot of devices do not need and do not document port or endpoint
>> > numbering at all, e.g. in case where there's just a single port and a
>> > single endpoint. Whereas this is just common sense, document it to make it
>> > explicit.
>> >
>> > Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/media/video-interfaces.txt | 12 ++++++++++++
>> >  1 file changed, 12 insertions(+)
>>
>> This is fine, but bindings should still be explicit. Otherwise, I'm
>> wondering if it's a single port/endpoint or they just forgot to document
>> it. And I shouldn't have to look at the example to infer that.
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> The purpose of the patch was to actually document port and endpoint
> numbering for devices for which it is not documented, not to suggest that
> this would be omitted in in binding documentation. The fact is that I
> couldn't find documentation for endpoint numbering for a single device
> under Documentation/devicetree/bindings/media/ . Yet I haven't come across
> DT source where other than zero would have been used. And the drivers
> (mostly?) have ignored endpoint numbers so far.

That's surprising. I know there are some for display controllers and
it's a common review comment I give.

>
> Some bindings have been omitted on the grounds that they're documented in
> video-interfaces.txt.
>
> What would you think of the following? I'm not sure it'd really belong
> there, but it'd be a small piece of documentation one can easily refer to.

Looks good.

>
>
> From e735979005244eb10597fe5333130b93e41d5a38 Mon Sep 17 00:00:00 2001
> From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Date: Mon, 18 Sep 2017 11:15:53 +0300
> Subject: [PATCH 1/1] dt: bindings: media: Document practices for DT bindings,
>  ports, endpoints
>
> Port and endpoint numbering has been omitted in DT binding documentation
> for a large number of devices. Also common properties the device uses have
> been missed in binding documentation. Make it explicit that these things
> need to be documented.
>
> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  .../devicetree/bindings/media/video-interfaces.txt        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index 852041a..3c5382f 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -55,6 +55,21 @@ divided into two separate ITU-R BT.656 8-bit busses.  In such case bus-width
>  and data-shift properties can be used to assign physical data lines to each
>  endpoint node (logical bus).
>
> +Documenting bindings for devices
> +--------------------------------
> +
> +All required and optional bindings the device supports shall be explicitly
> +documented in device DT binding documentation. This also includes port and
> +endpoint numbering for the device.
> +
> +Port and endpoint numbering
> +---------------------------
> +
> +Old binding documentation may have omitted explicitly specifying port and
> +endpoint numbers. This often applies to devices that have a single port and a
> +single endpoint in that port. In this case, the only valid port number for such
> +a device is zero. The same applies for devices for which bindings do not
> +document endpoint numbering: only zero is a valid endpoint.
>
>  Required properties
>  -------------------
> --
> 2.7.4
>
> --
> Sakari Ailus
> sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
