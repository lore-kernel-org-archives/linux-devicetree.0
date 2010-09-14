From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] drivers/of: use __be32 types for big-endian device
	tree data
Date: Tue, 14 Sep 2010 11:29:52 +0800
Message-ID: <1284434992.2877.143.camel@pororo>
References: <1284434031.863044.443635323150.1.gpush@pororo>
	<AANLkTi=ODinhAG6L62FGiA61nZkDEYweSThWW9J8BwXb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=ODinhAG6L62FGiA61nZkDEYweSThWW9J8BwXb-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Timur,

> Does this mean that I should be using be32_to_cpu() whenever I
> dereference a pointer to a u32 in the device tree?  Currently, I do
> this:
> 
> const u32 *iprop;
> const u32 num;
> iprop = of_get_property(np, ...)
> num = *iprop;
> 
> Should I be doing this instead?
> 
> const __be32 *iprop;
> const u32 num;
> iprop = of_get_property(np, ...)
> num = be32_to_cpu(*iprop);

 
If your code will be run on little-endian platforms, you'll need to do
this, yes. It may also be prudent to do this on BE platforms too, as
we'll undoubtedly have someone copy code from one to another. But I
don't think anyone is suggesting that we modify existing BE-only code.

Also, in the example you have given, I think be32_to_cpup(iprop) is
preferred.

Cheers,


Jeremy
