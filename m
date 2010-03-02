From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Tue, 2 Mar 2010 12:25:22 +1100
Message-ID: <20100302012522.GI23435@yookeroo>
References: <fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<4288fc0b-79a4-42fd-9e77-573dbad79210@SG2EHSMHS004.ehs.local>
	<4B8C2C4C.8070901@freescale.com>
	<fa686aa41003011418x339884c9md61c49948b31a8d1@mail.gmail.com>
	<1012f9aa-1642-41ab-b8cd-a4ab4a7b269e@VA3EHSMHS024.ehs.local>
	<fa686aa41003011603w12c0a7f1y88b5fc7a008af1d5@mail.gmail.com>
	<f9885aa5-5c11-4118-9980-f17378d7cbd5@SG2EHSMHS004.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f9885aa5-5c11-4118-9980-f17378d7cbd5-RaUQJvECHiuXHCJdrdq+zrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 01, 2010 at 04:13:30PM -0800, Stephen Neuendorffer wrote:
[snip]
> Yes... I think this should just be allowed... or at the very least I
> don't see a reason to make this an error...  It does occur to me
> that it might be useful to explicitly note the 'extension' of a
> previous node, which asserts that it *must* exist.  i.e.
> 
> foo {
> 	bar + {
> 		bar = 3;
> 	}
> }
> 
> Here it is explicitly clear that bar is an incomplete definition?

Hrm, interesting idea, and one that could have some merit.  However,
that specific syntax won't work, since '+' is a valid character in
node and property names.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
