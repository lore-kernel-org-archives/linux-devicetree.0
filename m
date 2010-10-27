From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: question about dma-ranges
Date: Wed, 27 Oct 2010 13:42:27 +1100
Message-ID: <20101027024227.GD7023@yookeroo>
References: <9696D7A991D0824DBA8DFAC74A9C5FA306911C5F@az33exm25.fsl.freescale.net>
	<4CC77784.2070701@firmworks.com>
	<AANLkTikTu_p0-Uk7=FuUay4mvCEEU0e9V5eY6bjuK5RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikTu_p0-Uk7=FuUay4mvCEEU0e9V5eY6bjuK5RQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 26, 2010 at 08:37:55PM -0500, Timur Tabi wrote:
> On Tue, Oct 26, 2010 at 7:51 PM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
> > =A0It's probably unnecessary on modern machines, but old PCs were fairly
> > restrictive about DMA addresses due to short counters. =A0The buses on =
which
> > such restrictions applied are no longer at the root level, but they were
> > once there...
> =

> It's still necessary.  The QE, which we ship on several of our current
> parts, can only DMA to/from 32-bit addresses, even on SOCs that
> support 36-bit addressing for everything else.

But the QE is not at the top-level, IIRC, so its restrictions can be
encoded in the dma-ranges on its own bus.  We're talking specifically
about the special case of dma-ranges in the root node, not the utility
of dma-ranges in general which is clear.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
