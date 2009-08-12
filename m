From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Regarding PCI Device tree binding
Date: Wed, 12 Aug 2009 11:20:52 -0500
Message-ID: <4A82EBE4.4010000@freescale.com>
References: <B28B5AD4F15643BAB9D73F5C658F0BE2@itd210>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <B28B5AD4F15643BAB9D73F5C658F0BE2@itd210>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thirumalai <thirumalai.p-0ZFwKFrCjf3djTIvvxD1Tp/QNRX+jHPU@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thirumalai wrote:
> Hi,
>    I just want to know is there any changes has happened on pci device 
> tree binding of powerpc. Because the device tree what ever i have used 
> to boot the linux kernel 2.6.23 on my mpc7448 based custom board is not 
> booting my latest linux kernel 2.6.30.

The binding didn't change, but bugs were fixed in the parsing code so 
that what was common practice (but wrong) in 2.6.23 doesn't work anymore.

Your tsi108 node only provides a ranges translation for its own 
registers, but you have a PCI child node with ranges outside of that. 
It's a bit awkward, but what we currently tend to do is move the PCI 
node out to the root level (make sure to change the reg property to be 
the full address rather than the tsi108 offset).

-Scott
