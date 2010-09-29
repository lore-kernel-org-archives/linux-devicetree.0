From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Power.org:parch] cpu nodes and Power ISA categories
Date: Wed, 29 Sep 2010 13:08:11 +1000
Message-ID: <20100929030811.GB18268@yookeroo>
References: <9696D7A991D0824DBA8DFAC74A9C5FA306631B4F@az33exm25.fsl.freescale.net>
	<2A9CCDDDAE41C446A006170FF0C786313BEE192E14@express.ghs.com>
	<20100920020105.GE5045@yookeroo>
	<2A9CCDDDAE41C446A006170FF0C786313BEEEB5479@express.ghs.com>
	<20100921025759.GF15500@yookeroo>
	<2A9CCDDDAE41C446A006170FF0C786313BEF25AB4A@express.ghs.com>
	<20100921222159.GA25226@yookeroo>
	<OF01353076.E8131683-ON862577A6.004B88CB-862577A6.004BBD2E@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <OF01353076.E8131683-ON862577A6.004B88CB-862577A6.004BBD2E-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Steve Thurber <sthurber-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: Dan Hettena <danh-5j0BnJlmnLM@public.gmane.org>, "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 22, 2010 at 08:47:11AM -0500, Steve Thurber wrote:
> Specifically, I believe it is "Power" (upper case "P", lower case "ower"). 
>  Prior to sometime in history, it was POWER (all upper case).

Right, however in the device tree context I think we should use
"power", not "Power" to match normal practice.  In particular
uppercase vendor prefixes are supposed to be stock tickers, not other
names.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
