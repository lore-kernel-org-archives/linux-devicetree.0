From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 01/21] of: Add cpu node iterator for_each_of_cpu_node()
Date: Thu, 1 Nov 2018 10:12:02 -0500
Message-ID: <20181101151201.GJ5994@gate.crashing.org>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-2-robh@kernel.org> <874ld3jz6v.fsf@concordia.ellerman.id.au> <871s87jz3g.fsf@concordia.ellerman.id.au> <CABGGisw_bd+bJedZ_T2e-dxmRnXf2N_gGBZj8u+QVGQxj_gc+Q@mail.gmail.com> <87tvl1dq7q.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87tvl1dq7q.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 01, 2018 at 09:52:57PM +1100, Michael Ellerman wrote:
> Rob Herring <robh@kernel.org> writes:
> > Yes, I was aware at least older powerpc DTs don't use 'cpu' for node names.
> 
> Actually newer ones too, see below :)

Good, because that is required by the Open Firmware standard (the PowerPC
binding, to be exact):

http://www.openbios.org/data/docs/ppc-2_1.ps

(see 5.1.4, "name").


Segher
