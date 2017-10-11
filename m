From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/12] of: overlay: avoid race condition between applying
 multiple overlays
Date: Tue, 10 Oct 2017 18:41:04 -0700
Message-ID: <59DD76B0.3040400@gmail.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
 <1507002826-16393-10-git-send-email-frowand.list@gmail.com>
 <CAL_JsqKHkPp6M-aE9yVM1Bs599NTpjV33hGXvnOo-W8KKPPsJw@mail.gmail.com>
 <59D5A737.9090905@gmail.com> <20171010184014.m2chslx36kbhvgug@rob-hp-laptop>
 <59DD21F3.6080001@gmail.com>
 <CAL_JsqK8cxBk754UBziGOTMx035C8P5ehPvENE0=-TNHqmTCbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqK8cxBk754UBziGOTMx035C8P5ehPvENE0=-TNHqmTCbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/10/17 14:06, Rob Herring wrote:
> On Tue, Oct 10, 2017 at 2:39 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

< snip >

> 
> AFAICT, I don't think anything between of_resolve_phandles and
> of_overlay_apply calls in tilcdc depends on the phandles being fixed
> up.

I think you are correct, after another quick scan of that code.

< snip >

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
