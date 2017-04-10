From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] of/fdt: introduce of_scan_flat_dt_subnodes and of_get_flat_dt_phandle
Date: Mon, 10 Apr 2017 08:42:15 -0500
Message-ID: <CAL_Jsq+46G4oEDrsFu57DqYMHJBX_cigArff-JYujFgb8M3S8w@mail.gmail.com>
References: <20170405123706.6081-1-npiggin@gmail.com> <20170405123706.6081-3-npiggin@gmail.com>
 <CAL_JsqK4zbACwWVb-rsrvBb4hjBCexrqKRKrzSiZrZH5w=bKqQ@mail.gmail.com>
 <20170406003251.533e2845@roar.ozlabs.ibm.com> <CAL_JsqLEvjb8S-+-JEa4ALHeCWHiR1A_4ur9kd3pBRJaFYWVKw@mail.gmail.com>
 <1491425881.4166.90.camel@kernel.crashing.org> <20170406103829.67d462e1@roar.ozlabs.ibm.com>
 <CAL_JsqKuomE41grhAvjFxkFbS4A3-M_TK8gP8FU=HdDpQ3TTkg@mail.gmail.com> <20170410154348.051e7a34@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170410154348.051e7a34-a5aMA/AkCkgK5Ils6ZIQy0EOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 10, 2017 at 12:43 AM, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, 6 Apr 2017 09:09:41 -0500
> Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> On Wed, Apr 5, 2017 at 7:38 PM, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > Given that it's quite a small addition to of/fdt code, hopefully
>> > that gives you a reasonable justification to accept it.
>> >
>> > If you prefer not to, that's okay, but I think we would have to carry
>> > it in arch/powerpc at least for a time, because of the schedule we're
>> > working to for POWER9 enablement. As a longer term item I agree with you
>> > and Ben, it would be worth considering unflattening earlier.
>>
>> As I mentioned, keeping it in arch/powerpc I like even less. So this is fine.
>
> Here is the patch with the change you suggested. Can I add your
> ack and send it via the powerpc tree with the change that uses
> these interfaces?

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
