From: Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
Date: Wed, 4 Sep 2019 11:33:20 +0800
Message-ID: <CAAhV-H5xsFY8cN_ckmVQ6rmGqb70Z2rEpx+eRwy_eA4HRLrhiA@mail.gmail.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-12-jiaxun.yang@flygoat.com> <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
 <d94eff2b-76ec-5cd2-512d-5ee0406a1bb9@flygoat.com> <20190827204105.7nyt4pi7lvxse5ij@pburton-laptop>
 <CAL_Jsq+VmFi6r1-WOa9RJ4vfqsZLqcn5HMbv1oyQjhtJ8Qd8Lw@mail.gmail.com> <20190903085904.bwmm4knaodopvzvd@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903085904.bwmm4knaodopvzvd@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.co>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 3, 2019 at 5:08 PM Paul Burton <paul.burton@mips.com> wrote:
>
> Hi Rob,
>
> On Mon, Sep 02, 2019 at 03:50:47PM +0100, Rob Herring wrote:
> > > In general on MIPS we detect CPU properties at runtime from coprocessor
> > > 0 registers & similar sources of information, so there's not really a
> > > need to specify anything about the CPU in devicetree.
> >
> > We thought the same thing initially for Arm... Mostly what is in DT is
> > not what is discoverable. Are clock speeds, power domains, low power
> > states, etc. all discoverable?
>
> No, that's a good point - clocks etc may need to be specified in DT. I
> just don't see any of that in this patchset - it appears all that is
> specified is cache sizes which we already detect. So in this case I
> don't see a need for including CPUs in DT at all.
>
> Jiaxun - did you add all this information to DT to avoid the "cacheinfo:
> Unable to detect cache hierarchy for CPU" messages during boot? If so
> that should be fixed by commit b8bea8a5e5d9 ("mips: fix cacheinfo"). If
> not, could you describe why the CPU nodes are needed here?

Yes, this can avoid "cacheinfo: Unable to detect cache hierarchy for CPU".
In our own git repository we have already reverted commit b8bea8a5e5d9
("mips: fix cacheinfo")

Huacai

>
> Thanks,
>     Paul
