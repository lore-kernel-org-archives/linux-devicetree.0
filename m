From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: clock bindings
Date: Thu, 31 Mar 2011 16:45:47 -0600
Message-ID: <20110331224547.GH437@ponder.secretlab.ca>
References: <4D498AAC.3090009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D498AAC.3090009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 02, 2011 at 10:47:40AM -0600, Rob Herring wrote:
> I've started looking at the DT clock bindings in more depth. To what
> level should the clock tree be defined in the DT? Should it be a
> one-to-one correlation of current struct clk nodes to node in DT
> where each node is a single input and output? Or only define a
> single (or few) node with the inputs (oscillators) and many outputs
> for SOC's clock controller (i.e. MX51 CCM).
> 
> If the DT itself does not have a hierarchical construction of nodes
> that matches the clock tree hierarchy, then creating the hierarchy
> at run-time will be a challenge and not be very efficient. It would
> require 1 pass for each clock node type to create all the nodes, and
> then another pass to setup the hierarchy.

Wow, it takes me a long time to reply sometimes.

I'm not sure at the moment.  A month ago I would have said
"everything", but I've thought about it a lot more and I think it is
more important that dt and non-dt users share the same code base for
setting up internal-to-the-soc clocks.  Anything available externally
will need a node describing it in the dt, which means the support code
shifts from registering all the clocks to matching up dt nodes to
existing clocks where possible.

For the time being, I've pushed back on registering all devices from
the device tree for the same reason which has given some breathing
room on the topic.  It will be a topic for discussion at UDS.

g.
