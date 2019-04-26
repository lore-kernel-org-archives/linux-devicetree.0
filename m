From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/2] RISC-V: Add DT documentation for SiFive L2 Cache Controller
Date: Fri, 26 Apr 2019 11:20:17 +0530
Message-ID: <CAJ2_jOEBqBnorz9PcQp72Jjju9RX_P8mU=Gq+0xCCcWsBiJksw@mail.gmail.com>
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
 <1556171696-7741-2-git-send-email-yash.shah@sifive.com> <20190425101318.GA8469@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425101318.GA8469@e107155-lin>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, mark.rutland@arm.com, robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 25, 2019 at 3:43 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Apr 25, 2019 at 11:24:55AM +0530, Yash Shah wrote:
> > Add device tree bindings for SiFive FU540 L2 cache controller driver
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 53 ++++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > new file mode 100644
> > index 0000000..15132e2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > @@ -0,0 +1,53 @@
> > +SiFive L2 Cache Controller
> > +--------------------------
> > +The SiFive Level 2 Cache Controller is used to provide access to fast copies
> > +of memory for masters in a Core Complex. The Level 2 Cache Controller also
> > +acts as directory-based coherency manager.
> > +
> > +Required Properties:
> > +--------------------
> > +- compatible: Should be "sifive,fu540-c000-ccache"
> > +
> > +- cache-block-size: Specifies the block size in bytes of the cache
> > +
> > +- cache-level: Should be set to 2 for a level 2 cache
> > +
> > +- cache-sets: Specifies the number of associativity sets of the cache
> > +
> > +- cache-size: Specifies the size in bytes of the cache
> > +
> > +- cache-unified: Specifies the cache is a unified cache
> > +
> > +- interrupt-parent: Must be core interrupt controller
> > +
> > +- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals)
> > +
> > +- reg: Physical base address and size of L2 cache controller registers map
> > +
> > +- reg-names: Should be "control"
> > +
>
> It would be good if you mark the properties that are present in DT
> specification and those that are added for sifive,fu540-c000-ccache

I believe there isn't any property which is added explicitly for
sifive,fu540-c000-ccache.

> explicitly. Also I assume you can retain the stardard "cache" compatible
> in addition to above. I am interested to see if the cacheinfo infrastructure
> can be used without any issues.

Yes, I will add the "cache" string to the compatible property.

>
> --
> Regards,
> Sudeep

Thanks for your comments.
- Yash
