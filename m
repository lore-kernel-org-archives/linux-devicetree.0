From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware of_platform_populate
Date: Wed, 8 Apr 2015 11:36:57 -0500
Message-ID: <CAL_Jsq+iwLJOZe=N+0_Nm=npKAEXru-_KtPNDh_SKScp_vUXUQ@mail.gmail.com>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com>
 <20150319191834.5346CC40A35@trevor.secretlab.ca> <8E250936-B06C-40B4-8C34-557D2361CAF6@konsulko.com>
 <CAMuHMdU=Zh00DnkAdAJBaAVn8LthYoRoGCVdFAhxQmWaEGHfkw@mail.gmail.com>
 <1B3AF599-4A64-4FB0-BFB0-0C0544917C6C@konsulko.com> <CAMuHMdWgAzkAJ-ix9NYc46yJRGPHCpmimOjF=HUYprxdgtzkaw@mail.gmail.com>
 <20150402023803.E6A4DC4076D@trevor.secretlab.ca> <CAMuHMdWVTsog2_9iyUEBWm-7xonvNibTTbOY5YxvpAhffUXdcg@mail.gmail.com>
 <2B8BD326-8A21-45F3-8276-DF3B303B11D8@konsulko.com> <CAL_JsqKWp5RWr_T-+gD7hTiJiJMxq68pOR4zORL7SD2H_=JMfg@mail.gmail.com>
 <CAMuHMdVsDx7g8jyU_nQZgG85o0huykb2EmBj4jskcuOuXXxiDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVsDx7g8jyU_nQZgG85o0huykb2EmBj4jskcuOuXXxiDA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 8, 2015 at 9:43 AM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> On Wed, Apr 8, 2015 at 4:17 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Then we have dma controllers needing to be registered at subsys_initcall() for obvious reasons.
>>
>> These should be fixable with deferred probe. That requires fixing all
>> the client drivers where as fixing the dependencies would not need
>> driver changes.
>
> DMA is tricky in that there are three cases, not two:
>   1. DMA engine is available,
>   2. DMA engine is not yet available (e.g. DMA engine driver is modular),
>   3. DMA engine will never be available (DMA engine or DMA engine driver
>      not available).
>
> Case 2 is the tricky one: probably you don't want the client driver to
> fail hard,
> but want to fall back to PIO, and try to setup DMA again later.

Yes, we had just this case on the pl011 driver recently. In that case
we fixed it by moving the DMA setup to port open/init from probe.

But generically, dependency tracking is not going to have any way to know this.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
