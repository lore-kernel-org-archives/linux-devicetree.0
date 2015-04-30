From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH 1/2] coresight: replicator: Add Qualcomm CoreSight
 Replicator driver
Date: Thu, 30 Apr 2015 10:21:06 +0300
Message-ID: <1430378466.2400.8.camel@linaro.org>
References: <1430310000-10867-1-git-send-email-ivan.ivanov@linaro.org>
	 <1430310000-10867-2-git-send-email-ivan.ivanov@linaro.org>
	 <CANLsYkwfDYjTqBUvXp2da6E=SA8F2EbH7_Mi20Sba9NpJm9Y7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CANLsYkwfDYjTqBUvXp2da6E=SA8F2EbH7_Mi20Sba9NpJm9Y7g@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Kumar Gala <galak@codeaurora.org>, Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wed, 2015-04-29 at 10:28 -0600, Mathieu Poirier wrote:
> On 29 April 2015 at 06:19, Ivan T. Ivanov ivanov@linaro.org> wrote:

<snip>

> >                 - "arm,coresight-etm4x", "arm,primecell";
> > +               - "qcom,coresight-replicator", "arm,primecell";
> 
> Is there some sort of versioning information we can add like it was
> done for the "coresight-etmXY" bindings?  It makes things a lot
> cleaner when a new (and possibly not backward compatible) version gets
> released.
> 

>From what I can see, it is version 1. I could add it to compatible
string, but suldn't we use amba_id for this reason.

> >         * reg: physical base address and length of the register
> >           set(s) of the component.
> > diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> > index 6b331d4..165b681 100644
> > --- a/drivers/hwtracing/coresight/Kconfig
> > +++ b/drivers/hwtracing/coresight/Kconfig
> > @@ -68,4 +68,13 @@ config CORESIGHT_SOURCE_ETM4X
> >           instructions that a processor is executing. This is primarily useful
> >           for instruction level tracing. Depending on the implemented version
> >           data tracing may also be available.
> > +
> > +config CORESIGHT_QCOM_REPLICATOR
> > +       bool "Qualcomm CoreSight Replicator driver"
> > +       help
> > +         This enables support for CoreSight link and sink driver that are
> > +         responsible for transporting and collecting the trace data
> > +         respectively. Link and sinks are dynamically aggregated with a trace
> > +         entity at run time to form a complete trace path.
> 
> The replicator is only a link entity.  It is only transporting trace
> data information rather than collecting it.  Please review the
> comment.  

True, sorry. copy and paste from CORESIGHT_LINKS_AND_SINKS.

> Also, can this specific version run on both V7 and V8
> architecture.  If not the proper "depends" should be added.
> 

Same driver/device on both architectures.

Will fix rest of the comments and will resend.

Thank you,
Ivan
