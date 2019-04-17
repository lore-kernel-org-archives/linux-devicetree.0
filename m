From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: arm: coresight: Add new compatible
 for static replicator
Date: Wed, 17 Apr 2019 08:09:59 +0800
Message-ID: <20190417000959.GB6202@leoy-ThinkPad-X240s>
References: <20190412102738.12679-1-leo.yan@linaro.org>
 <20190412102738.12679-2-leo.yan@linaro.org>
 <CANLsYkw1vaevcJZfjQfF9BeUvi1THGNtu+SH+LR008LjZOc7fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANLsYkw1vaevcJZfjQfF9BeUvi1THGNtu+SH+LR008LjZOc7fA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 16, 2019 at 02:18:40PM -0600, Mathieu Poirier wrote:
> Hi Leo,
> 
> On Fri, 12 Apr 2019 at 04:28, Leo Yan <leo.yan@linaro.org> wrote:
> >
> > CoreSight uses below bindings for replicator:
> >
> >   Dynamic replicator, aka. configurable replicator:
> >     "arm,coresight-dynamic-replicator", "arm,primecell";
> >
> >   Static replicator, aka. non-configurable replicator:
> >     "arm,coresight-replicator";
> >
> > The compatible string "arm,coresight-replicator" is not an explicit
> > naming to express the replicator is 'static'.  To unify the naming
> > convention, this patch introduces a new compatible string
> > "arm,coresight-static-replicator" for the static replicator; the
> > compatible string "arm,coresight-replicator" is kept for backward
> > compatibility, but tag it as obsolete and suggest to use the new
> > compatible string.
> >
> > As result CoreSight replicator have below bindings:
> >
> >   Dynamic replicator:
> >     "arm,coresight-dynamic-replicator", "arm,primecell";
> >
> >   Static replicator:
> >     "arm,coresight-static-replicator";
> >     "arm,coresight-replicator"; (obsolete)
> >
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/arm/coresight.txt | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> > index f8aff65ab921..d02d160fa8ac 100644
> > --- a/Documentation/devicetree/bindings/arm/coresight.txt
> > +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> > @@ -69,7 +69,10 @@ its hardware characteristcs.
> >
> >         * compatible: Currently supported value is (note the absence of the
> >           AMBA markee):
> > -               - "arm,coresight-replicator"
> > +               - Coresight Non-configurable Replicator:
> > +                       "arm,coresight-static-replicator";
> > +                       "arm,coresight-replicator"; (OBSOLETE. For backward
> > +                               compatibility and will be removed)
> >
> >         * port or ports: see "Graph bindings for Coresight" below.
> >
> > @@ -169,7 +172,7 @@ Example:
> >                 /* non-configurable replicators don't show up on the
> >                  * AMBA bus.  As such no need to add "arm,primecell".
> >                  */
> > -               compatible = "arm,coresight-replicator";
> > +               compatible = "arm,coresight-static-replicator";
> >
> >                 out-ports {
> >                         #address-cells = <1>;
> > --
> > 2.17.1
> 
> Since this is a binding patch it needs to be sent on its own.

Thanks for reminding, Mathieu.

Since this is the second time you remind me to send DT binding related
patches separately, so I may misunderstand your meaning and want to get
clarification to avoid making the same mistake for many times.

Before I remembered in one patch set we need to organise patches with
sending document patch (or document changing patch) ahead and then
followed by the corresponding code change patch.  So this can give the
reviewers more clear context;  and this also can present the merging
dependency between document change patches and the code change patches.

This is the rule I followed in this patch set and I sent to CoreSight
and DT maintainers (and mailing lists) together.

Please let me know what you think about this?  And also welcome
Rob/Mark's suggestions.

Thanks,
Leo Yan
