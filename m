From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Mon, 28 Nov 2016 12:24:20 +0000
Message-ID: <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161128041228.GJ30927@umbus.fritz.box>
 <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/11/2016 12:10, Pantelis Antoniou wrote:
> For plugins we need the __symbols__ node to support stacked overlays, i.e.
> overlays referring label that were introduced by a previous overlay.
Although it is arguably useful to be able to refer to symbols created by
one overlay from within another, do we really want all symbols to be
global? Isn't there a call for a new syntax or usage pattern to indicate
either that a symbol should be local to the overlay or, my preferred
option, global?

Phil
