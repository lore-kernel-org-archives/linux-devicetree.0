From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] of: Add vendor prefix for Ampire Co., Ltd.
Date: Wed, 25 Mar 2015 10:22:34 -0500
Message-ID: <CAL_JsqK9TBw87h1gvT7uNkzsMsZDB5CwT7KVFxKT4iUw=srtkg@mail.gmail.com>
References: <1423677011-17993-1-git-send-email-p.zabel@pengutronix.de>
 <1423677011-17993-2-git-send-email-p.zabel@pengutronix.de> <20150324110417.GL18115@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150324110417.GL18115-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 24, 2015 at 6:04 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Feb 11, 2015 at 06:50:08PM +0100, Philipp Zabel wrote:
>> Add Ampire Co., Ltd. to the list of device tree vendor prefixes.
>>
>> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>  1 file changed, 1 insertion(+)
>
> Hi Rob,
>
> You acked patch 4/5 in this series but didn't explicitly ack this patch.
> Shall I assume that it applies to this as well?

Yes.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob

>
> Thierry
>
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index c0333a9..1ca9ea1 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -15,6 +15,7 @@ altr        Altera Corp.
>>  amcc Applied Micro Circuits Corporation (APM, formally AMCC)
>>  amd  Advanced Micro Devices (AMD), Inc.
>>  amlogic      Amlogic, Inc.
>> +ampire       Ampire Co., Ltd.
>>  ams  AMS AG
>>  amstaos      AMS-Taos Inc.
>>  apm  Applied Micro Circuits Corporation (APM)
>> --
>> 2.1.4
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
