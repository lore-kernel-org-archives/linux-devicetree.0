From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 1/1] mtd: nand: Add a devicetree binding for ECC
 strength and ECC step size
Date: Wed, 12 Feb 2014 00:00:14 -0800
Message-ID: <20140212080014.GC3500@norris-Latitude-E6410>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1389960820-18696-2-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389960820-18696-2-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Pekon Gupta <pekon-l0cyMroinI0@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ezequiel,

On Fri, Jan 17, 2014 at 09:13:40AM -0300, Ezequiel Garcia wrote:
> Some flashes can only be properly accessed when the ECC mode is
> specified, and a way to describe such mode is required.
> 
> Such ECC mode is completely driver-specific so instead of having one binding
> per compatible-string, let's add generic ECC strength and ECC step size.
> Driver's can choose the appropriate ECC mode, based on this specification.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> index 03855c8..683a310 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -3,5 +3,9 @@
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
>    "soft_bch".
> +- nand-ecc-strength : integer ECC required strength.
> +- nand-ecc-size : integer step size associated to the ECC strength.

Probably should be nand-ecc-step-size, to be clearer.

> +  The exact meaning of the ECC strength and ECC size parameters is completely
> +  driver-specific.

I think we can be much more specific than this. We need to at least
describe how the strength and size are related, and we need to mention
how this represents the ECC scheme to use, rather than the minimum
requirement of the flash.

I'd say something like this. Feel free to improve it, but it covers the
gist of what I think we can say in a generic document:

 - nand-ecc-strength: integer representing the number of bits to correct
   per ECC step
 - nand-ecc-step-size: integer representing the number of data bytes
   that are covered by a single ECC step

   Together, the ECC strength and step size define the correction
   capability, so that we say we will correct "X bit errors per Y
   bytes". The interpretation of these parameters is
   implementation-defined, but they often have ramifications on the
   formation, interpretation, and placement of correction metadata on
   the flash. Not all implementations must support all possible
   combinations. Implementations are encouraged to further define the
   value(s) they support.

>  - nand-bus-width : 8 or 16 bus width if not present 8
>  - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
