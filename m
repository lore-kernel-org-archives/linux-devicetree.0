From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: CELF Project Proposal/Add Device Tree emulation support to QEMU
Date: Mon, 24 May 2010 18:31:45 +1000
Message-ID: <20100524083145.GF3603@yookeroo>
References: <4BF9BB22.2000603@crca.org.au>
	<AANLkTilCe5FyT6Pcz61FnhpbpdLhg2EGSfk4jZlKdQKA@mail.gmail.com>
	<4BFA251A.4080601@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4BFA251A.4080601-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Nigel Cunningham <ncunningham-VWkGxi2CTS+6c6uEtOJ/EA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "Edgar E. Iglesias" <edgar.iglesias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 23, 2010 at 09:04:58PM -1000, Mitch Bradley wrote:
> Grant Likely wrote:
> >(cc'ing devicetree-discuss and others)
> >
> >On Sun, May 23, 2010 at 5:32 PM, Nigel Cunningham
> ><ncunningham-VWkGxi2CTS+6c6uEtOJ/EA@public.gmane.org> wrote:
> >>http://elinux.org/CELF_Project_Proposal/Add_Device_Tree_emulation_support_to_QEMU
> 
> Just in case anyone is interested -
> 
> One Laptop Per Child is doing some ARM work, so I have resurrected
> FirmWorks' ARM version of Open Firmware.  It's in the open source
> OFW tree at http://openfirmware.info/Open_Firmware .  There is a
> build that runs under QEMU, in the subdirectory cpu/arm/versatilepb
> .  FirmWorks' core ARM stuff is fairly solid, having been developed
> to shipping quality for Digital's "Shark" (aka DNARD) system, just
> prior to Digital's demise and the sale of StrongARM to Intel.
> 
> I'll be adding more elaborations in the near future.  One item on
> the short list is to auto-generate a flattened device tree from the
> real device tree.

That should be pretty easy to do.  In fact, this was one of the
use-cases I explicitly thought of when writing libfdt.  If you're
using libfdt (and if not, why not) and it's missing something handy
for this, I'll be happy to add it.

>  It's a pity that the dynamic device tree has to
> be projected onto a static structure, but I guess that Gresham's Law
> applies to software too.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
