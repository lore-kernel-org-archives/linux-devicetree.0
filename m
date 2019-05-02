From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/2] RISC-V: Add DT documentation for SiFive L2 Cache Controller
Date: Thu, 2 May 2019 10:50:12 +0530
Message-ID: <CAJ2_jOETZa_oC-xSwfQVw-9Q6OivRG2R0rKMhwCk1knbxWJQVw@mail.gmail.com>
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
 <1556171696-7741-2-git-send-email-yash.shah@sifive.com> <20190425101318.GA8469@e107155-lin>
 <CAJ2_jOEBqBnorz9PcQp72Jjju9RX_P8mU=Gq+0xCCcWsBiJksw@mail.gmail.com>
 <20190426093358.GA28309@e107155-lin> <CAJ2_jOEoD=Njp+L+H=jG59mA-j9SnwzyNmz7ECogWmbvei_f5Q@mail.gmail.com>
 <20190502004130.GA20802@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502004130.GA20802@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, mark.rutland@arm.com, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 2, 2019 at 6:11 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Apr 30, 2019 at 09:50:45AM +0530, Yash Shah wrote:
> > On Fri, Apr 26, 2019 at 3:04 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > >
> > > On Fri, Apr 26, 2019 at 11:20:17AM +0530, Yash Shah wrote:
> > > > On Thu, Apr 25, 2019 at 3:43 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > > >
> > > > > On Thu, Apr 25, 2019 at 11:24:55AM +0530, Yash Shah wrote:
> > > > > > Add device tree bindings for SiFive FU540 L2 cache controller driver
> > > > > >
> > > > > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 53 ++++++++++++++++++++++
> > > > > >  1 file changed, 53 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > > > > new file mode 100644
> > > > > > index 0000000..15132e2
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > > > > @@ -0,0 +1,53 @@
> > > > > > +SiFive L2 Cache Controller
> > > > > > +--------------------------
> > > > > > +The SiFive Level 2 Cache Controller is used to provide access to fast copies
> > > > > > +of memory for masters in a Core Complex. The Level 2 Cache Controller also
> > > > > > +acts as directory-based coherency manager.
> > > > > > +
> > > > > > +Required Properties:
> > > > > > +--------------------
> > > > > > +- compatible: Should be "sifive,fu540-c000-ccache"
> > > > > > +
> > > > > > +- cache-block-size: Specifies the block size in bytes of the cache
> > > > > > +
> > > > > > +- cache-level: Should be set to 2 for a level 2 cache
> > > > > > +
> > > > > > +- cache-sets: Specifies the number of associativity sets of the cache
> > > > > > +
> > > > > > +- cache-size: Specifies the size in bytes of the cache
> > > > > > +
> > > > > > +- cache-unified: Specifies the cache is a unified cache
> > > > > > +
> > > > > > +- interrupt-parent: Must be core interrupt controller
> > > > > > +
> > > > > > +- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals)
> > > > > > +
> > > > > > +- reg: Physical base address and size of L2 cache controller registers map
> > > > > > +
> > > > > > +- reg-names: Should be "control"
> > > > > > +
> > > > >
> > > > > It would be good if you mark the properties that are present in DT
> > > > > specification and those that are added for sifive,fu540-c000-ccache
> > > >
> > > > I believe there isn't any property which is added explicitly for
> > > > sifive,fu540-c000-ccache.
> > > >
> > >
> > > reg and interrupts are generally optional for normal cache and may be
> > > required for cache controller like this. DT specification[1] covers
> > > only caches and not cache controllers.
> >
> > Are you suggesting something like this:
> >
> > Required Properties:
> > --------------------
> > Standard Properties:
>
> I don't think we need this separation.

Ok. Won't include this "Standard/Non-standard properties" separation
in the next revision of this patch.

>
> > - cache-block-size: Specifies the block size in bytes of the cache
> >
> > - cache-level: Should be set to 2 for a level 2 cache
> >
> > - cache-sets: Specifies the number of associativity sets of the cache
> >
> > - cache-size: Specifies the size in bytes of the cache
>
> What are the possible valid values for these? That's what's important.
> What the properties mean are already defined in the spec.

Sure, will mention the valid values for these properties.

>
> >
> > - cache-unified: Specifies the cache is a unified cache
> >
> > Non-Standard Properties:
>
> I wouldn't call these non-standard.
>
> > - interrupt-parent: Must be core interrupt controller
>
> This is implied.

Will remove this redundant description.

>
> > - reg: Physical base address and size of L2 cache controller registers map
> >
> > - reg-names: Should be "control"
>
> -names is not really needed when there is only 1 entry.

Will remove this property.

>
> >
> > - Yash
> > >
> > > --
> > > Regards,
> > > Sudeep
> > >
> > > [1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.2/devicetree-specification-v0.2.pdf
