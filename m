From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: ARM clock API to PowerPC
Date: Wed, 12 Aug 2009 18:29:22 +1000
Message-ID: <1250065762.15143.47.camel@pasglop>
References: <1250063825.15143.43.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1250063825.15143.43.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: John Jacques <john.jacques-M7mHMAq9Yzo@public.gmane.org>, linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Torez Smith <torez-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2009-08-12 at 17:57 +1000, Benjamin Herrenschmidt wrote:

>  - Device-tree: The idea on top of my mind would be to define a
> clock-map property that has the following format:
> 
> A list of:
> 	- zero terminated string clock ID, padded with zeros
>           to a cell boundary
>  	- a phandle to the clock provider
> 	- a numerical (string ?) ID for that clock within that provider
> 
> The core would thus be able to do a search in that list based on the
> clock-id passed in, or if clk_get(dev, NULL), then, use the first one.

Thinking a bit more about that one, mixing strings and numbers in a
property sucks. What about instead:

 clock-map is a list of phandle, id

 clock-names is an optional list of 0 terminated strings

If there's only one clock, and the ID can be ommited, then the
clock-names property can be ommited completely too. Else, the
entries in clock-names match the entries in clock-map.

It's a bit strange to separate the list into two properties but
I think it will generally suck less than having them mixed, especially
with ASCII representations such as lsprop output.

Cheers,
Ben
