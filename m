From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl_msi: Handle msi-available-ranges better
Date: Tue, 13 Sep 2011 13:33:06 -0500
Message-ID: <4E6FA1E2.2060706@freescale.com>
References: <20110117202528.GB561@udp111988uds.am.freescale.net>
	<CAOZdJXVm1YL-T8i26O0BiB-uTkXUDnYQdacU8k52aG-K0pZ1Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOZdJXVm1YL-T8i26O0BiB-uTkXUDnYQdacU8k52aG-K0pZ1Lg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/07/2011 11:20 AM, Tabi Timur-B04825 wrote:
> The problem is that both offset and irq_index are being incremented in
> the loop, and cascade_data->index is set to the sum of the two.
> 
> Perhaps you meant this:
> 
> 		err = fsl_msi_setup_hwirq(msi, dev, offset, j);

That's not right either, it would retrieve the wrong IRQ from the
interrupts property if you have holes -- try with something like
{ 0 64, 128, 64 }.  The desired behavior there is:

  offset = 0 irq_index = 0
  offset = 1 irq_index = 1
  offset = 4 irq_index = 2
  offset = 5 irq_index = 3

I think the right code (untested) might be:

	err = fsl_msi_setup_hwirq(msi, dev, offset + j, irq_index);

and

	cascade_data->index = offset;

-Scott
