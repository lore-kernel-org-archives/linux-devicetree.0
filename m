From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] of: Add vendor prefix for HannStar Display Corporation
Date: Thu, 6 Nov 2014 09:13:42 -0600
Message-ID: <CAL_JsqJYEbC2fsVAUp9CWZxrvXp62dhWL4N1MPJttemoTgWjtg@mail.gmail.com>
References: <1414074666-3783-1-git-send-email-p.zabel@pengutronix.de> <20141106085840.GD26297@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141106085840.GD26297@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 6, 2014 at 2:58 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Oct 23, 2014 at 04:31:05PM +0200, Philipp Zabel wrote:
>> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>> Changes since v1:
>>  - Rebased onto v3.18-rc1
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>  1 file changed, 1 insertion(+)
>
> Rob,
>
> Will you take this patch via the DT tree or can you ack it so that I can
> take it through the drm/panel tree along with patch 2/2?

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob

>
> Thierry
>
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index 723999d..9863039 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -64,6 +64,7 @@ gmt Global Mixed-mode Technology, Inc.
>>  google       Google, Inc.
>>  gumstix      Gumstix, Inc.
>>  gw   Gateworks Corporation
>> +hannstar     HannStar Display Corporation
>>  haoyu        Haoyu Microelectronic Co. Ltd.
>>  hisilicon    Hisilicon Limited.
>>  honeywell    Honeywell
>> --
>> 2.1.1
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
