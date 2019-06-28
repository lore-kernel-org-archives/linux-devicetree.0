From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: Limit cpus schema to only check Arm
 'cpu' nodes
Date: Fri, 28 Jun 2019 14:32:15 -0600
Message-ID: <CAL_Jsq+Ej15JfU_Mx0g+Hkpz6+1CnMem507RPgUgW7CB0U8hCA@mail.gmail.com>
References: <20190627000044.12739-1-robh@kernel.org> <alpine.DEB.2.21.9999.1906261759390.29311@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1906261759390.29311@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2019 at 7:02 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Wed, 26 Jun 2019, Rob Herring wrote:
>
> > Matching on the 'cpus' node was a bad choice because the schema is
> > incorrectly applied to non-Arm cpus nodes. As we now have a common cpus
> > schema which checks the general structure, it is also redundant to do so
> > in the Arm CPU schema.
> >
> > The downside is one could conceivably mix different architecture's cpu
> > nodes or have typos in the compatible string. The latter problem pretty
> > much exists for every schema.
>
> The RISC-V patch applies cleanly, but this one doesn't apply here on
> either master or next-20190626.  Is there a different base commit?

Ugg, sorry. I had another commit colliding with this in my tree. I've
fixed it now and it's in my dt/next branch.

Rob
