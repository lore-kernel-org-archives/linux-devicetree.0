From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: arm: coresight: Unify funnel DT
 binding
Date: Mon, 8 Apr 2019 22:07:21 +0800
Message-ID: <20190408140720.GB6541@leoy-ThinkPad-X240s>
References: <20190406112145.15184-1-leo.yan@linaro.org>
 <20190406112145.15184-4-leo.yan@linaro.org>
 <7f63abef-76fc-a767-723d-caacc8da29ae@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <7f63abef-76fc-a767-723d-caacc8da29ae@arm.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, shiwanglai@hisilicon.com, mathieu.poirier@linaro.org, alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2019 at 11:51:16AM +0100, Suzuki K Poulose wrote:
> On 04/06/2019 12:21 PM, Leo Yan wrote:
> > Following the same fashion with replicator DT binding, this patch is to
> > unify the DT binding for funnel to support static and dynamic modes;
> > finally we get the funnel DT binding as below:
> > 
> > Before patch:
> > 
> >    Static funnel, aka. non-configurable funnel:
> >      Not supported;
> > 
> >    Dynamic funnel, aka. configurable funnel:
> >      "arm,coresight-funnel", "arm,primecell";
> > 
> > After patch:
> > 
> >    Static funnel:
> >      "arm,coresight-static-funnel";
> > 
> >    Dynamic funnel:
> >      "arm,coresight-funnel", "arm,primecell"; (obsolete)
> >      "arm,coresight-dynamic-funnel", "arm,primecell";
> > 
> > At the end of this patch, it gives an example for static funnel DT
> > binding, and updates the dynamic funnel example.
> > 
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Cc: Wanglai Shi <shiwanglai@hisilicon.com>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >   .../devicetree/bindings/arm/coresight.txt     | 52 +++++++++++++++++--
> >   1 file changed, 48 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> > index f8f794869af2..f8ad11a17cd5 100644
> > --- a/Documentation/devicetree/bindings/arm/coresight.txt
> > +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> > @@ -8,7 +8,8 @@ through the intermediate links connecting the source to the currently selected
> >   sink. Each CoreSight component device should use these properties to describe
> >   its hardware characteristcs.
> > -* Required properties for all components *except* non-configurable replicators:
> > +* Required properties for all components *except* non-configurable replicators
> > +  and non-configurable funnels:
> >   	* compatible: These have to be supplemented with "arm,primecell" as
> >   	  drivers are using the AMBA bus interface.  Possible values include:
> > @@ -24,8 +25,11 @@ its hardware characteristcs.
> >   		  discovered at boot time when the device is probed.
> >   			"arm,coresight-tmc", "arm,primecell";
> > -		- Trace Funnel:
> > +		- Trace Programmable Funnel, the compatible string
> > +		  "arm,coresight-funnel" is obsolete, keep it to support
> > +		  the old DT bindings:
> >   			"arm,coresight-funnel", "arm,primecell";
> > +			"arm,coresight-dynamic-funnel", "arm,primecell";
> 
> Same comments as the first patch here.

Will do it.

> > +	funnel {
> > +		/*
> > +		 * non-configurable funnel don't show up on the AMBA
> > +		 * bus.  As such no need to add "arm,primecell".
> > +		 */
> > +		compatible = "arm,coresight-static-funnel";
> > +		clocks = <&crg_ctrl HI3660_PCLK>;
> > +		clock-names = "apb_pclk";
> > +
> > +		out-ports {
> > +			port {
> > +				combo_funnel_out: endpoint {
> > +					remote-endpoint = <&top_funnel_in>;
> > +				};
> > +			};
> > +		};
> > +
> > +		in-ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +				combo_funnel_in0: endpoint {
> > +					remote-endpoint = <&cluster0_etf_out>;
> > +				};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +				combo_funnel_in1: endpoint {
> > +					remote-endpoint = <&cluster1_etf_out>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> >   	funnel@20040000 {
> 
> Should we rename this to say dynamic_funnel@2004000 { ?

I read ePAPR and it suggests "The name of a node should be somewhat
generic, reflecting the function of the device and not its precise
programming model".

So seems to me it's good to keep using generic naming 'funnel'.  If I
misunderstand anything, just let me know.

Will spin patch set for following other suggestions.

Thanks,
Leo Yan

> 
> > -		compatible = "arm,coresight-funnel", "arm,primecell";
> > +		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> >   		reg = <0 0x20040000 0 0x1000>;
> 
> 
> Rest looks fine to me.
> 
> Suzuki
