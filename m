From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Two different interrupt-parents
Date: Mon, 16 Apr 2012 14:53:08 +1000
Message-ID: <20120416045308.GH4625@truffala.fritz.box>
References: <CAKON4OwAix9D61kp9mDq0WVvthDKzm=FFz2AoFQWe1yqJJgf6A@mail.gmail.com>
 <C5ECD7A89D1DC44195F34B25E172658D0CE077@039-SN2MPN1-013.039d.mgd.msft.net>
 <CAKON4Ox9Bi=HYXU_eOjff0aaSuqPEbqbonm1VaKYOcSpx5-WfA@mail.gmail.com>
 <C5ECD7A89D1DC44195F34B25E172658D0CE0E6@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <C5ECD7A89D1DC44195F34B25E172658D0CE0E6-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sethi Varun-B16395 <B16395-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 16, 2012 at 04:14:25AM +0000, Sethi Varun-B16395 wrote:
> You can use a 4 cell interrupt specifier (we use that in case of embedded power architecture platforms)
> - First cell corresponds to one of the four cascade lines (coming from the cascaded pic)
> - Second cell provides the interrupt sense information
> - Third one tells the interrupt subtype (in your case should be the cascade power interrupt type)
> - Fourth cell communicates the interrupt number corresponding to the cascaded pic.
> 
> There would be a single interrupt parent, which is the system interrupt controller. You would have
> to translate the four cell interrupt specifier and also add cascaded interrupt handling
> for the shared interrupt line.

No, don't do that.

Use the interrupt-map technique described in the thread that got
linked earlier.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
