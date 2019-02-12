From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RESEND PATCH v2] of: fix kmemleak crash caused by imbalance in
 early memory reservation
Date: Tue, 12 Feb 2019 13:52:49 -0800
Message-ID: <20190212135249.7d37876449980fa378e49314@linux-foundation.org>
References: <d4facdc2-0581-929f-caa2-b9efa9bd8f97@arm.com>
        <CAL_JsqKFT8J6g02gxeBiTfBb_XHhp2-ZNB6DgaLPK85kNZGRig@mail.gmail.com>
        <20190121143704.GE29504@arrakis.emea.arm.com>
        <CAL_JsqKQb34zVNTzo9DLNiDwmWGxkrKezSOjwCUPAvgzUoLYjg@mail.gmail.com>
        <20190121174234.GC26461@rapoport-lnx>
        <2bb30550-435a-046c-4f45-21dd594aa695@free.fr>
        <3c886941-bf9d-f040-b568-ee7a8eba9a04@free.fr>
        <CGME20190123055509epcas3p18a6d66fa08412f2308cb2c1997328ea8@epcas3p1.samsung.com>
        <20190123055414.GA4747@rapoport-lnx>
        <78f4ea8a-996d-038e-9e33-5ff02fa2c43f@samsung.com>
        <20190123123143.GE4747@rapoport-lnx>
        <4b8f82c4-7f8f-b814-c1ec-9902e43963f6@free.fr>
        <617e0d57-342d-4162-bd21-ece18e481d87@free.fr>
        <CAL_JsqKbCg-rGmLoA3mPv54=LMuQBfevfzL8f2QPVyjN-sNk8w@mail.gmail.com>
        <20190213085028.6199594b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190213085028.6199594b@canb.auug.org.au>
Sender: stable-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robh+dt@kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Prateek Patel <prpatel@nvidia.com>, DT <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 13 Feb 2019 08:50:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > > It's definitely going to conflict with the proposed patch
> > > over drivers/of/of_reserved_mem.c
> > >
> > > Rob, what's the next step then?  
> > 
> > Rebase it on top of what's in linux-next and apply it to the tree
> > which has the above dependency. I'm guessing that is Andrew Morton's
> > tree.
> 
> Yeah, that is in Andrew's "post linux-next" patch series, so if you
> rebase it on top of linux-next and then send it to Andrew with some
> explanation.
> 
> ...
> 
> Actually, if it is intended for the stable trees, then presumably it is
> intended to go to Linus for the current release?  In which case, the
> patch in Andrew's tree will have to be changed to cope after your patch
> appears in Linus' tree (and therefore, linux-next).

Yup, just do whatever needs to be done and I'll figure it out ;)
