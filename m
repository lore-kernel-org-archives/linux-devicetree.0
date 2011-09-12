From: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 06/24] C6X: devicetree
Date: Mon, 12 Sep 2011 19:20:35 -0400
Message-ID: <1315869636.11280.26.camel@deneb.redhat.com>
References: <1314826019-22330-1-git-send-email-msalter@redhat.com>
	<1314826019-22330-7-git-send-email-msalter@redhat.com>
	<20110912201102.GF23345@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110912201102.GF23345-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2011-09-12 at 14:11 -0600, Grant Likely wrote:
> On Wed, Aug 31, 2011 at 05:26:41PM -0400, Mark Salter wrote:
> > +		interrupt-controller;
> > +		#interrupt-cells = <1>;
> > +		compatible = "ti,c64x+core-pic";
> 
> The interrupt controller isn't addressable?  Is it integrated into
> the CPU?

Yes, that core controller is controlled through registers accessed
with special-purpose instructions, not MMIO. Other controllers, like
megamodule and some as-yet unimplemented use MMIO.

> 
> > +	};
> > +
> > +	soc@00000000 {
> 
> "soc@2a80000" to match the 'reg' property of this node.

Okay, I think I need a separate node for that reg property. The SoC
address space does actually start at 0. The registers in that reg
property are "SoC-level" registers holding silicon revision, pin
strap status, etc. All of the SoCs have a "device state config"
node which have registers like that. Instead of having them in the
device state block, this SoC has them in a separate area. I just
got lazy and put them the reg property in the soc node, but I think
it really calls for a separate node.

--Mark
