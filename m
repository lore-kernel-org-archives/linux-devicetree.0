From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 6/6] of/device: populate platform_device (of_device)
	resource table on allocation
Date: Thu, 10 Jun 2010 16:17:43 +1000
Message-ID: <1276150663.1962.43.camel@pasglop>
References: <20100608142152.26088.1108.stgit@angua>
	<20100608142643.26088.61366.stgit@angua>
	<20100608155702.GA5419@oksana.dev.rtsoft.ru>
	<AANLkTinZT4z93SWxjce5oRZzmaQHtVnO96zsXO9OX2UZ@mail.gmail.com>
	<20100608164645.GA15216@oksana.dev.rtsoft.ru>
	<AANLkTinHH-YhdWpH60Z2BYsiEjzLb_imrk6KUmQRH07P@mail.gmail.com>
	<20100608194809.GA32732@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100608194809.GA32732-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


> You just introduced an unnamed structure of device + resources,
> it isn't declared anywhere but in the code itself (either via
> &foo[1] or buf + sizeof(*foo)).
> 
> You're not the only one who hacks (or at least have to
> understand) the OF stuff, so let's try keep this stuff
> readable?
> 
> I told you several ways of how to improve the code (based on
> the ideas from drivers/base/, so the ideas aren't even mine,
> fwiw).

I tend to agree with Anton here.

BTW. Why not make of_device a wrapper (or even alias of)
platform_device ? :-) That way you get the resource array etc.. for free
and it will make the whole of_device vs. platform_device issue moot.

Cheers,
Ben.
