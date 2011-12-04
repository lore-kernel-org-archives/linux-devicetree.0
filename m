From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: alias variable support
Date: Mon, 5 Dec 2011 10:09:19 +1100
Message-ID: <20111204230919.GA4620@truffala.fritz.box>
References: <071A08F2C6A57E4E94D980ECA553F87441D37C@039-SN1MPN1-004.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <071A08F2C6A57E4E94D980ECA553F87441D37C-TcFNo7jSaXM0vywKSws3iq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kushwaha Prabhakar-B32579 <B32579-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 02, 2011 at 10:14:47AM +0000, Kushwaha Prabhakar-B32579 wrote:
> Hi,
> 
>  Is there a way in dts to have alias for a variable just like we have alias for node.
> 
> For example for a node "abc"
> 
> 
>             alias_comp = "comp-2.0"
> 
> 		abc@3100 {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 			cell-index = <1>;
> 			compatible = alias_comp
> 			reg = <0x3100 0x100>;
> 		};
> 
> Here alias_comp will be replaced by "comp-2.0" during compilation.

That's not really an alias, or like one.

It is more like a named constant / variable.  We don't have support
for this, but it is something we'd like to add to dtc eventually.
It's just that no-one has had time to design, implement and come up
with a decent syntax for it.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
