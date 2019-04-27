From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v5 0/4] CoreSight: Support static funnel with DT binding
 consolidation
Date: Sat, 27 Apr 2019 08:20:34 +0800
Message-ID: <20190427002034.GA6454@leoy-ThinkPad-X240s>
References: <20190412102738.12679-1-leo.yan@linaro.org>
 <CANLsYkyFXEiYh78uhhQRiqAOvv_u+oq5GS3z3-Lbj6RHm7x+sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkyFXEiYh78uhhQRiqAOvv_u+oq5GS3z3-Lbj6RHm7x+sQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2019 at 10:26:24AM -0600, Mathieu Poirier wrote:

[...]

> > Leo Yan (4):
> >   dt-bindings: arm: coresight: Add new compatible for static replicator
> >   coresight: replicator: Add new device id for static replicator
> >   dt-bindings: arm: coresight: Unify funnel DT binding
> >   coresight: funnel: Support static funnel
> >
> >  .../devicetree/bindings/arm/coresight.txt     |  60 +++++++--
> >  .../hwtracing/coresight/coresight-funnel.c    | 116 ++++++++++++++----
> >  .../coresight/coresight-replicator.c          |   6 +-
> >  3 files changed, 147 insertions(+), 35 deletions(-)
> 
> I have applied this set.

Thanks, Mathieu.  Also thanks Rob and you for clarification DT binding.
