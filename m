From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: arm: coresight: Add new compatible
 for static replicator
Date: Fri, 12 Apr 2019 18:54:32 +0800
Message-ID: <20190412105432.GA1643@leoy-ThinkPad-X240s>
References: <20190412102738.12679-1-leo.yan@linaro.org>
 <20190412102738.12679-2-leo.yan@linaro.org>
 <a38d1f9e-622e-7fd6-6282-be5601863c11@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <a38d1f9e-622e-7fd6-6282-be5601863c11@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, mathieu.poirier@linaro.org, alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 11:40:13AM +0100, Suzuki K Poulose wrote:
> On 04/12/2019 11:27 AM, Leo Yan wrote:
> > CoreSight uses below bindings for replicator:
> > 
> >    Dynamic replicator, aka. configurable replicator:
> >      "arm,coresight-dynamic-replicator", "arm,primecell";
> > 
> >    Static replicator, aka. non-configurable replicator:
> >      "arm,coresight-replicator";
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
> >    Dynamic replicator:
> >      "arm,coresight-dynamic-replicator", "arm,primecell";
> > 
> >    Static replicator:
> >      "arm,coresight-static-replicator";
> >      "arm,coresight-replicator"; (obsolete)
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >   Documentation/devicetree/bindings/arm/coresight.txt | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> > index f8aff65ab921..d02d160fa8ac 100644
> > --- a/Documentation/devicetree/bindings/arm/coresight.txt
> > +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> > @@ -69,7 +69,10 @@ its hardware characteristcs.
> >   	* compatible: Currently supported value is (note the absence of the
> >   	  AMBA markee):
> > -		- "arm,coresight-replicator"
> > +		- Coresight Non-configurable Replicator:
> > +			"arm,coresight-static-replicator";
> > +			"arm,coresight-replicator"; (OBSOLETE. For backward
> > +				compatibility and will be removed)
> >   	* port or ports: see "Graph bindings for Coresight" below.
> > @@ -169,7 +172,7 @@ Example:
> >   		/* non-configurable replicators don't show up on the
> >   		 * AMBA bus.  As such no need to add "arm,primecell".
> >   		 */
> > -		compatible = "arm,coresight-replicator";
> > +		compatible = "arm,coresight-static-replicator";
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks a lot for quick reviewing, Suzuki.
