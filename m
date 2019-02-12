From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RESEND PATCH v2] of: fix kmemleak crash caused by imbalance in
 early memory reservation
Date: Tue, 12 Feb 2019 10:03:09 -0600
Message-ID: <CAL_JsqKbCg-rGmLoA3mPv54=LMuQBfevfzL8f2QPVyjN-sNk8w@mail.gmail.com>
References: <d4facdc2-0581-929f-caa2-b9efa9bd8f97@arm.com> <CAL_JsqKFT8J6g02gxeBiTfBb_XHhp2-ZNB6DgaLPK85kNZGRig@mail.gmail.com>
 <20190121143704.GE29504@arrakis.emea.arm.com> <CAL_JsqKQb34zVNTzo9DLNiDwmWGxkrKezSOjwCUPAvgzUoLYjg@mail.gmail.com>
 <20190121174234.GC26461@rapoport-lnx> <2bb30550-435a-046c-4f45-21dd594aa695@free.fr>
 <3c886941-bf9d-f040-b568-ee7a8eba9a04@free.fr> <CGME20190123055509epcas3p18a6d66fa08412f2308cb2c1997328ea8@epcas3p1.samsung.com>
 <20190123055414.GA4747@rapoport-lnx> <78f4ea8a-996d-038e-9e33-5ff02fa2c43f@samsung.com>
 <20190123123143.GE4747@rapoport-lnx> <4b8f82c4-7f8f-b814-c1ec-9902e43963f6@free.fr>
 <617e0d57-342d-4162-bd21-ece18e481d87@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <617e0d57-342d-4162-bd21-ece18e481d87@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Prateek Patel <prpatel@nvidia.com>, DT <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 11, 2019 at 10:47 AM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 04/02/2019 15:37, Marc Gonzalez wrote:
>
> > Cc: stable@vger.kernel.org # 3.15+
> > Fixes: 3f0c820664483 ("drivers: of: add initialization code for dynamic reserved memory")
> > Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Acked-by: Prateek Patel <prpatel@nvidia.com>
> > Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> > Resend with DT CCed to reach robh's patch queue
> > I added CC: stable, Fixes, and Prateek's ack
> > Trim recipients list to minimize inconvenience
>
> Mike, Stephen,
>
> I'm confused over commit 3532b3b554a216f30edb841d29eef48521bdc592 in linux-next
> "memblock: drop __memblock_alloc_base()"
>
> It's definitely going to conflict with the proposed patch
> over drivers/of/of_reserved_mem.c
>
> Rob, what's the next step then?

Rebase it on top of what's in linux-next and apply it to the tree
which has the above dependency. I'm guessing that is Andrew Morton's
tree.

Rob
