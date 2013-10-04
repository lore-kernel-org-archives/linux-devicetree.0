From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Fri, 04 Oct 2013 18:27:46 +0100
Message-ID: <20131004172746.69301C427E9@trevor.secretlab.ca>
References: <20130922.162915.1269060096375052591.davem@davemloft.net> <CAL_JsqKNVqJbn559ruvFHg+FVGt8ou4v_Ntf-HphwxCNXQ7GfQ@mail.gmail.com> <CACxGe6soxNN6TjDw9h15c39FHzyGzY1OZX9cZ8FRQ_k4PinYvw@mail.gmail.com> <20131003.172451.54508059414505899.davem@davemloft.net> <524E99B0.9070805@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <524E99B0.9070805-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: "robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 04 Oct 2013 11:34:24 +0100, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi David,
> 
> I tested this on ARM platform(Vexpress TC2). You can add my tested by.
> 
> Regards,
> Sudeep
> 
> On 03/10/13 22:24, David Miller wrote:
> > 
> > Can people on powerpc/arm/etc. give this a spin?  This works on my
> > T4-2 sparc64 box.
> > 
> > --------------------
> > of: Make cpu node handling more portable.
> > 
> > Use for_each_node_by_type() to iterate all cpu nodes in the
> > system.
> > 
> > Provide and overridable function arch_find_n_match_cpu_physical_id,
> > which sees if the given device node matches 'cpu' and if so sets
> > '*thread' when non-NULL to the cpu thread number within the core.
> > 
> > The default implementation behaves the same as the existing code.
> > 
> > Add a sparc64 implementation.
> > 
> > Signed-off-by: David S. Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
> > 
> Tested-by: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>

I've applied it to my tree and I'll keep an eye out if it causes any
breakage on PowerPC or ARM.

Can someone from PowerPC land give it a spin? I don't have any powerpc
hardware anymore.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
