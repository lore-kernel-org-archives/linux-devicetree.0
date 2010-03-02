From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Tue, 2 Mar 2010 14:59:58 +1100
Message-ID: <20100302035958.GJ23435@yookeroo>
References: <20081001034656.GF30810@yookeroo.seuss>
	<fa686aa41002200813o3fea9a34s198be367ad81b367@mail.gmail.com>
	<20100222013004.GM29038@yookeroo>
	<fa686aa41002212226i4c83376cn8d88a045dd13fe00@mail.gmail.com>
	<9696D7A991D0824DBA8DFAC74A9C5FA305B2021A@az33exm25.fsl.freescale.net>
	<fa686aa41003011115m1bb0b644g5014340f6c312ee9@mail.gmail.com>
	<4288fc0b-79a4-42fd-9e77-573dbad79210@SG2EHSMHS004.ehs.local>
	<fa686aa41003011349i367a423cx2c59953e6afc9b75@mail.gmail.com>
	<4B8C3C78.5010206@firmworks.com>
	<fa686aa41003011533x3d2d00abyb8d7cf33344a3bde@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa41003011533x3d2d00abyb8d7cf33344a3bde-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 01, 2010 at 04:33:29PM -0700, Grant Likely wrote:
> On Mon, Mar 1, 2010 at 3:15 PM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
[snip]
> Thanks for the clarification.  The flat tree does stay with the Open
> Firmware standard, however it does have the quirk that the name value
> in the flat tree includes the reg address.  This is mostly because
> when Linux on PowerPC reads the tree out of Open Firmware and creates
> the flat representation it stores the full path including the reg
> address.  The dts representation duplicates that behaviour.

Well, it's more that in the flat tree we treat the "node name" as a
separate entity to the node's name property, and containing the
equivalent of both the name property and unit address as they'd be
treated in real OF.  And having done that, we typically omit the name
property entirely, and just generate it on the fly from the node name
when we need to.

> I haven't entirely decided whether or not wildcard nodes are a good
> idea in the flat representation, but I am leaning in that direction.
> You already know about the discussion on how to handle Ethernet PHYs
> at an unknown address.  That may very well be the way we decide to
> handle it.

Well.. the difficulty with wildcard nodes in a flat tree is that we
have a number of cases where we already use nodes with no reg property
to represent things that aren't really wildcards.  The common use is
for things which are addressable only on a sideband bus which doesn't
form part of the normal reg address space hierarchy, such as DCR
devices on 4xx.

> However, the node name issue does raise a question about dtc.  Right
> now it doesn't do any checks in this regard, but an argument could be
> made that dtc should warn or fail if a dts file sets the @<reg>
> component in a way inconsistent with the first entry in the reg
> property.  Perhaps dtc should also automatically add @<reg> when the
> node name string omits it.  (again, this only applies to the flat
> representation).

I've been intending that for ages.  The complication is that the way
the reg property is formatted into the unit address string is
dependent on the parent bus.  There's no inherent barrier to
implementing this, and indeed the infrastructure in checks.c was
created with this in mind amongst other things, but it's just a
moderately large amount of coding because we need per-bus hooks to
supply unit address formatting functions.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
