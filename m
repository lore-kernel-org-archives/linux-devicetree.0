From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v6 0/3] coresight: etm4x: save/restore ETMv4 context
 across CPU low power states
Date: Wed, 18 Sep 2019 09:36:01 +0100
Message-ID: <20190918083601.GX9720@e119886-lin.cambridge.arm.com>
References: <20190913115312.12943-1-andrew.murray@arm.com>
 <CANLsYkzhB3OBpLTAR54p771OSLxj+NYF8_kE=aMp7SkdNzaxwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkzhB3OBpLTAR54p771OSLxj+NYF8_kE=aMp7SkdNzaxwA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Al Grant <Al.Grant@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Coresight ML <coresight@lists.linaro.org>, Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mike Leach <mike.leach@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2019 at 01:37:10PM -0600, Mathieu Poirier wrote:
> Hi Andrew,
> 
> On Fri, 13 Sep 2019 at 05:53, Andrew Murray <andrew.murray@arm.com> wrote:
> 
> [...]
> 
> >
> > Andrew Murray (3):
> >   coresight: etm4x: save/restore state across CPU low power states
> >   dt-bindings: arm: coresight: Add support for
> >     coresight-loses-context-with-cpu
> 
> I have picked-up patches 1 and 2.  As per the conversation we had in
> Cambridge where we kept finding ways to break things when dealing with
> an external agent, I have not applied the 3 patch.

Thanks for the picking these up. No worries about patch 3.

Thanks,

Andrew Murray

> 
> Thanks,
> Mathieu
> 
> >   coresight: etm4x: save/restore state for external agents
> >
> >  .../devicetree/bindings/arm/coresight.txt     |   9 +
> >  drivers/hwtracing/coresight/coresight-etm4x.c | 351 +++++++++++++++++-
> >  drivers/hwtracing/coresight/coresight-etm4x.h |  64 ++++
> >  drivers/hwtracing/coresight/coresight.c       |   8 +-
> >  include/linux/coresight.h                     |  13 +
> >  5 files changed, 443 insertions(+), 2 deletions(-)
> >
> > --
> > 2.21.0
> >
