From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC:PATCH dtc-1.3.0] dtc: Add --strip-disabled option to dtc.
Date: Tue, 21 Aug 2012 10:10:38 +1000
Message-ID: <20120821001038.GI29724@truffula.fritz.box>
References: <1345034325-26656-1-git-send-email-srinivas.kandagatla@st.com>
 <20120817060415.GC29724@truffula.fritz.box>
 <502E3632.70208@freescale.com> <502E52F3.7090404@st.com>
 <502E64F9.2020400@freescale.com> <5031F706.3050509@st.com>
 <50325ED4.2070403@freescale.com> <50325F60.9070106@freescale.com>
 <50326088.8060402@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50326088.8060402-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "mmarek-AlSwsSmVLrQ@public.gmane.org" <mmarek-AlSwsSmVLrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 20, 2012 at 11:06:32AM -0500, Scott Wood wrote:
> On 08/20/2012 11:01 AM, Timur Tabi wrote:
> > Scott Wood wrote:
> >> The distinction between "disabled" and "fail" is useful when the OS
> >> knows how to enable a node (e.g. by manipulating muxing).
> > 
> > So a node that is marked as status=fail is not necessarily an
> > unrecoverable failure?
> 
> No, it's "disabled" that is not necessarily unrecoverable.

I'm not sure that "fail" is necessarily unrecoverable either, though I
do think it means that whatever attached the "fail" tag didn't know
how to recover it.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
