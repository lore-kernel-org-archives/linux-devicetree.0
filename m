From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc: Add code to make diffing trees easier
Date: Wed, 10 Nov 2010 11:55:03 +1100
Message-ID: <20101110005503.GL30378@yookeroo>
References: <20101109225109.GI30378@yookeroo> <4CD9E122.7040707@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CD9E122.7040707-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 09, 2010 at 04:02:42PM -0800, John Bonesio wrote:
> I just applied this patch and gave it a try.
> 
> I'm in the process of changing dts files for mpc5200b systems to use the
> new device tree merging with a .dtsi file.
> 
> I used this sorting tool to try to compare my results to make sure I'm
> not breaking anything. Unfortunately for some of the files I ended up
> renaming nodes from the original. When the nodes are renamed, the
> sorting doesn't produce what I would like. The nodes get reordered by
> the sorting method when in this case I'd rather they didn't change order.

> What I would have liked is to see that the node was renamed but the
> contents were the same.
> 
> I'm wondering if the node sorting could be done somehow by register
> values.

And then it won't generate what you want if you change reg, but leave
the name (mostly) the same.  Both methods are imperfect and the
current one is much simpler to implement, so, no.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
