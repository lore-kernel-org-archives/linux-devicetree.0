From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v5 0/4] CoreSight: Support static funnel with DT binding consolidation
Date: Fri, 26 Apr 2019 10:26:24 -0600
Message-ID: <CANLsYkyFXEiYh78uhhQRiqAOvv_u+oq5GS3z3-Lbj6RHm7x+sQ@mail.gmail.com>
References: <20190412102738.12679-1-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412102738.12679-1-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Apr 2019 at 04:27, Leo Yan <leo.yan@linaro.org> wrote:
>
> Since before there have no platforms use static funnel in mainline
> kernel (though maybe some in-house SoC has used it but didn't upstream
> for mainline kernel yet so we don't be aware for it), when enable
> CoreSight DT binding for hikey960, we found the SoC uses the static
> funnel in the link path and but it's not supported in CoreSight funnel
> driver.
>
> When support static funnel it's found the DT binding compatible string
> doesn't follow the same fashion between replicator and funnel; so the
> first two patches are firstly to refine the replicator DT binding and
> correspondingly, change the replicator driver to support new DT binding
> compatible.
>
> Patch 0003 is to update DT documentation to support static funnel (we
> call it as non-configurable funnel in documentation) and unify the
> compatible string with the same fashion for replicator and funnel.
>
> Patch 0004 is to support the static funnel in the CoreSight funnel
> driver.
>
> The consolidated DT binding compatible strings are as below:
>
>   Dynamic replicator:
>     "arm,coresight-dynamic-replicator", "arm,primecell";
>
>   Static replicator:
>     "arm,coresight-static-replicator";
>     "arm,coresight-replicator"; (obsolete)
>
>   Static funnel:
>     "arm,coresight-static-funnel";
>
>   Dynamic funnel:
>     "arm,coresight-dynamic-funnel", "arm,primecell";
>     "arm,coresight-funnel", "arm,primecell"; (obsolete)
>
> This patch set has been rebased on CoreSight next branch [1] with
> latest commit d5d246a56af0 ("coresight: Merge the static and dynamic
> replicator drivers") and tested on Hikey960/Hikey with perf commands:
>
>   Hikey960:
>
>   # perf record -e cs_etm/@ec033000.etr/ --per-thread ./main
>   # perf report --tui
>
>   Hikey:
>
>   # perf record -e cs_etm/@f6404000.etr/ --per-thread uname
>   # perf report --tui
>
> [1] https://git.linaro.org/kernel/coresight.git/log/?h=next
>
> == Changes for v5 ==
> * Marked the the obsolete compatible strings to be more abvious
>   (Suzuki).
> * Used pr_warn_once() to print out warning if DT binding uses
>   the  obsolete compatible string (Suzuki).
>
> == Changes for v4 ==
> * Consolidate the DT binding compatible strings for replicator and
>   funnel (Mathieu).
> * Changed replicator driver to support new compatible string.
>
>
> Leo Yan (4):
>   dt-bindings: arm: coresight: Add new compatible for static replicator
>   coresight: replicator: Add new device id for static replicator
>   dt-bindings: arm: coresight: Unify funnel DT binding
>   coresight: funnel: Support static funnel
>
>  .../devicetree/bindings/arm/coresight.txt     |  60 +++++++--
>  .../hwtracing/coresight/coresight-funnel.c    | 116 ++++++++++++++----
>  .../coresight/coresight-replicator.c          |   6 +-
>  3 files changed, 147 insertions(+), 35 deletions(-)

I have applied this set.

Thanks,
Mathieu

>
> --
> 2.17.1
>
