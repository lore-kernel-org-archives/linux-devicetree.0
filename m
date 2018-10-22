From: Nick Hu <nickhu@andestech.com>
Subject: Re: [PATCH 5/5] nds32: Add document for NDS32 PMU.
Date: Mon, 22 Oct 2018 18:23:08 +0800
Message-ID: <20181022102308.GD24110@andestech.com>
References: <cover.1539745993.git.nickhu@andestech.com>
 <c0a80d2db642b1d9547ff412d91baa9927b68aac.1539745993.git.nickhu@andestech.com>
 <20181018143132.vhhc6qpz4sooljlj@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181018143132.vhhc6qpz4sooljlj@lakrids.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Greentime Ying-Han =?utf-8?B?SHUo6IOh6Iux5ryiKQ==?= <greentime@andestech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "deanbo422@gmail.com" <deanbo422@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "acme@kernel.org" <acme@kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@redhat.com" <jolsa@redhat.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "geert@linux-m68k.org" <geert@linux-m68k.org>, Zong Zong-Xian =?utf-8?B?TGko5p2O5a6X5oayKQ==?= <zong@andestech.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Thu, Oct 18, 2018 at 10:31:32PM +0800, Mark Rutland wrote:
> On Thu, Oct 18, 2018 at 04:43:17PM +0800, Nickhu wrote:
> > The document for how to add NDS32 PMU
> > in devicetree.
> > 
> > Signed-off-by: Nickhu <nickhu@andestech.com>
> > ---
> >  Documentation/devicetree/bindings/nds32/pmu.txt | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nds32/pmu.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/nds32/pmu.txt b/Documentation/devicetree/bindings/nds32/pmu.txt
> > new file mode 100644
> > index 000000000000..02762b850e59
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nds32/pmu.txt
> > @@ -0,0 +1,17 @@
> > +* NDS32 Performance Monitor Units
> > +
> > +NDS32 core have a PMU for counting cpu and cache events like cache misses.
> > +The NDS32 PMU representation in the device tree should be done as under:
> > +
> > +Required properties:
> > +
> > +- compatilbe :
> > +	"andestech,atcpmu"
> 
> Which CPUs have this PMU?
> 
> I expected more specific strings, e.g. "andestech,n13-pmu" and/or
> "andestech,andestech,nds32v3-pmu".
>
In nds32 V3, all of our CPU have PMU.
So I will change the string to andestech,nds32v3-pmu.

> > +
> > +- interrupts : The interrupt number for NDS32 PMU is 13.
> > +
> > +Example:
> > +pmu{
> > +	compatible = "andestech,atcpmu";
> > +	interrupts = <13>;
> > +}
> 
> The driver tried to find multiple interrupts. Is there only a single
> interrupt in all cases?
> 
There is only overflow interrupt for performance couner in nds32 V3.
I will modified the driver and prepare another patch.
Thanks!

> Thanks,
> Mark.

Thank you for replying the patch set so quickly.
I will prepare the next patch set for it.
Thanks,
Nick
