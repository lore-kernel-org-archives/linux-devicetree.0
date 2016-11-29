From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Tue, 29 Nov 2016 13:05:28 +0000
Message-ID: <dbcfc090-43e2-d6f8-6f35-2761bc4d3da1@raspberrypi.org>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161128041228.GJ30927@umbus.fritz.box>
 <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com>
 <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org>
 <20161129021131.GD13307@umbus.fritz.box>
 <b7ff53f6-6481-e3f1-e3b5-d0b04e563e83@raspberrypi.org>
 <D3BFA6AB-21C1-451B-ACF5-32EA5E615275@konsulko.com>
 <66c7f8c5-94e9-a6ca-4402-fa0ccf2a6ac0@raspberrypi.org>
 <1F9EDF06-98B1-4270-AA58-1A9D9A9F9803@konsulko.com>
 <ba8e2ed3-9798-3074-1167-3f6851321a25@raspberrypi.org>
 <96BE1B80-0843-4981-AA2A-E89EA6A02600@konsulko.com>
 <a1ba4783-2a3b-eefd-9c41-2f33524472fe@raspberrypi.org>
 <27651F03-6E8F-4C76-A0E4-0DFBEC40277C@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <27651F03-6E8F-4C76-A0E4-0DFBEC40277C-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 29/11/2016 13:00, Pantelis Antoniou wrote:
> An alias is the standard way to refer to nodes symbolically. They can be overwritten at
> runtime without triggering an error.
Can you give me a concrete example of how this would look?
> Speaking of which, since these overlays are applied at runtime, why not build them with a script
> and have a #define passed to the c preprocessor before compiling them?
Because the parameters are applied at run time, not compile time.

Phil

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
