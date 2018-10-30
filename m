From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/21] of: Add cpu node iterator for_each_of_cpu_node()
Date: Tue, 30 Oct 2018 10:00:17 -0500
Message-ID: <CABGGisw_bd+bJedZ_T2e-dxmRnXf2N_gGBZj8u+QVGQxj_gc+Q@mail.gmail.com>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-2-robh@kernel.org>
 <874ld3jz6v.fsf@concordia.ellerman.id.au> <871s87jz3g.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <871s87jz3g.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 30, 2018 at 9:20 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Hi Rob,
> >
> > Sorry I missed this when you posted it.
> >
> > Rob Herring <robh@kernel.org> writes:
> >> Iterating thru cpu nodes is a common pattern. Create a common iterator
> >> which can find child nodes either by node name or device_type == cpu.
> >> Using the former will allow for eventually dropping device_type
> >> properties which are deprecated for FDT.
> >
> > Device trees we see on powerpc generally don't (never?) use "cpu" as the
> > node name for CPU nodes. And many of those device trees come from
> > firmware, so we can't update them.
> >
> > So dropping support for device_type is a non-starter from our POV.
>
> ps. presumably that's what you meant by deprecated *for FDT*.

Right.

> But anyway just wanted to make sure we are on the same page.

Yes, I was aware at least older powerpc DTs don't use 'cpu' for node names.

Rob
