From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RFC/PATCH 0/1] mtd: Add NAND ECC devicetree binding
Date: Fri, 17 Jan 2014 09:13:39 -0300
Message-ID: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Pekon Gupta <pekon-l0cyMroinI0@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch is our first proposal to address the need for a suitable ECC
devicetree binding.

NAND controllers have special ECC modes, raising per-driver ECC mode devicetree
binding. See for instance the binding for OMAP:

 - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
	"sw"		<deprecated> use "ham1" instead
	"hw"		<deprecated> use "ham1" instead
	"hw-romcode"	<deprecated> use "ham1" instead
	"ham1"		1-bit Hamming ecc code
	"bch4"		4-bit BCH ecc code
	"bch8"		8-bit BCH ecc code

Other drivers (such as pxa3xx-nand) have similar requirements, with special
(controller-specific) ECC modes. Instead of adding a possibly different binding
per compatible-string, let's add generic ECC strength and ECC step size.

This properties should describe completely the ECC mode and let drivers choose
the appropriate ECC mode.

Ezequiel Garcia (1):
  mtd: nand: Add a devicetree binding for ECC strength and ECC step size

 Documentation/devicetree/bindings/mtd/nand.txt | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
