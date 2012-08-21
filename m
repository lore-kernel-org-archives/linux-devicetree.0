From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC:PATCH dtc-1.3.0] dtc: Add --strip-disabled option to dtc.
Date: Tue, 21 Aug 2012 10:09:31 +1000
Message-ID: <20120821000931.GH29724@truffula.fritz.box>
References: <1345034325-26656-1-git-send-email-srinivas.kandagatla@st.com>
 <20120817060415.GC29724@truffula.fritz.box>
 <502E3632.70208@freescale.com> <502E52F3.7090404@st.com>
 <502E64F9.2020400@freescale.com> <5031F706.3050509@st.com>
 <50322F9C.2070403@freescale.com> <503270E1.6050902@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <503270E1.6050902-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: "mmarek-AlSwsSmVLrQ@public.gmane.org" <mmarek-AlSwsSmVLrQ@public.gmane.org>, Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 20, 2012 at 07:16:17AM -1000, Mitch Bradley wrote:
> On 8/20/2012 2:37 AM, Tabi Timur-B04825 wrote:
> > Srinivas KANDAGATLA wrote:
> >>>> But assuming that this really is the best approach, then it would make
> >>>> sense for --strip-disabled to leave this node in the dtb, because
> >>>> otherwise there would be no way to re-enable it.
> >> --strip-disabled should still get rid for nodes marked as failed
> >> as-well, because fail means something serious and un-recoverable.
> > 
> > Well, I don't know if that's true.  Does status=fail really mean 
> > unrecoverable?
> 
> My intention when I first conceived of the status property is that
> "fail" means that something has determined that the device is not
> working properly and the software does not know how to make it work.
> 
> That is distinct from "disabled", which means that the choice has been
> made not to use the device.
> 
> In the modern world of SoC with physically-unconnected functional units,
> perhaps a new value would be appropriate: status="unused".

Makes sense to me.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
