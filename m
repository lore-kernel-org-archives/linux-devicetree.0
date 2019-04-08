From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: coresight: Add new compatible
 for static replicator
Date: Mon, 8 Apr 2019 22:01:15 +0800
Message-ID: <20190408140115.GA6541@leoy-ThinkPad-X240s>
References: <20190406112145.15184-1-leo.yan@linaro.org>
 <20190406112145.15184-2-leo.yan@linaro.org>
 <b661edd2-5b99-f8f7-b5a5-8e4497043087@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b661edd2-5b99-f8f7-b5a5-8e4497043087@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mathieu.poirier@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, shiwanglai@hisilicon.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On Mon, Apr 08, 2019 at 11:44:56AM +0100, Suzuki K Poulose wrote:
> On 04/06/2019 12:21 PM, Leo Yan wrote:
> > CoreSight uses below bindings for replicator:
> > 
> >    Static replicator, aka. non-configurable replicator:
> >      "arm,coresight-replicator";
> > 
> >    Dynamic replicator, aka. configurable replicator:
> >      "arm,coresight-dynamic-replicator", "arm,primecell";
> > 
> > The compatible string "arm,coresight-replicator" is not an explicit
> > naming to express the replicator is 'static'.  To unify the naming
> > convention, this patch introduces a new compatible string
> > "arm,coresight-static-replicator" for the static replicator; the
> > compatible string "arm,coresight-replicator" is still kept thus we
> > can support the old DT binding, but tag it as obsolete and suggest
> > to use the new compatible string.
> > 
> > As result CoreSight replicator have below bindings:
> > 
> >    Static replicator:
> >      "arm,coresight-replicator"; (obsolete)
> >      "arm,coresight-static-replicator";
> > 
> >    Dynamic replicator:
> >      "arm,coresight-dynamic-replicator", "arm,primecell";
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >   Documentation/devicetree/bindings/arm/coresight.txt | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> > index f8aff65ab921..f8f794869af2 100644
> > --- a/Documentation/devicetree/bindings/arm/coresight.txt
> > +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> > @@ -69,7 +69,11 @@ its hardware characteristcs.
> >   	* compatible: Currently supported value is (note the absence of the
> >   	  AMBA markee):
> > -		- "arm,coresight-replicator"
> > +		- Coresight Non-configurable Replicator, the compatible string
> > +		  "arm,coresight-replicator" is obsolete, keep it to support
> 
> To make it more obvious : s/obsolete/OBSOLETE/
> 
> > +		  the old DT bindings:
> > +			"arm,coresight-replicator";
> > +			"arm,coresight-static-replicator";
> 
> nit: I would re-order the compatible strings to show the precedence of
> choice.
> 
> e.g,
> 	- CoreSight non-configurable Replicator
> 		"arm,coresight-static-replicator";
> 		"arm,coresight-replicator"; (OBSOLETE. For
> 			backward compatibility. Will be removed )

The suggestion looks good to me since it's neat.  Will do it.

> Also, please could we put a warning in the driver when we encounter it
> and request to update it ?

Will do.

Thanks for reviewing!
Leo Yan
