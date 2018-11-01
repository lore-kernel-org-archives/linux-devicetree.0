From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/21] of: Add cpu node iterator for_each_of_cpu_node()
Date: Thu, 1 Nov 2018 10:57:31 -0500
Message-ID: <CAL_JsqJmx_vjQfYMTFc5K4Sy4hEVXJi5p2PNL8uCpiyTdSir3A@mail.gmail.com>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-2-robh@kernel.org>
 <874ld3jz6v.fsf@concordia.ellerman.id.au> <871s87jz3g.fsf@concordia.ellerman.id.au>
 <CABGGisw_bd+bJedZ_T2e-dxmRnXf2N_gGBZj8u+QVGQxj_gc+Q@mail.gmail.com>
 <87tvl1dq7q.fsf@concordia.ellerman.id.au> <20181101151201.GJ5994@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101151201.GJ5994@gate.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: segher@kernel.crashing.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 1, 2018 at 10:12 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Thu, Nov 01, 2018 at 09:52:57PM +1100, Michael Ellerman wrote:
> > Rob Herring <robh@kernel.org> writes:
> > > Yes, I was aware at least older powerpc DTs don't use 'cpu' for node names.
> >
> > Actually newer ones too, see below :)
>
> Good, because that is required by the Open Firmware standard (the PowerPC
> binding, to be exact):
>
> http://www.openbios.org/data/docs/ppc-2_1.ps
>
> (see 5.1.4, "name").

Yes. I should say I only expect systems following ePAPR (3.7) or DT
Spec will use 'cpu' node names. Those specs also require 'device_type'
which is supposed to indicate what OF methods are available for a node
which doesn't exist on FDT.

Rob
