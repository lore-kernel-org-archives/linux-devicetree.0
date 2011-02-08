From: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v3 1/4] powerpc: Removing support for 'protected-sources'
Date: Tue, 8 Feb 2011 15:13:13 +0000
Message-ID: <9F6FE96B71CF29479FF1CDC8046E15030C2233@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1296861941-3370-1-git-send-email-meador_inge@mentor.com>
	<1296861941-3370-2-git-send-email-meador_inge@mentor.com>
	<1297035336.14982.14.camel@pasglop>  <4D5033C9.8030407@mentor.com>
	<1297115136.14982.82.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1297115136.14982.82.camel@pasglop>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: devicetree-discuss-
> bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org [mailto:devicetree-
> discuss-bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf Of
> Benjamin Herrenschmidt
> Sent: Monday, February 07, 2011 3:46 PM
> To: Meador Inge
> Cc: Hollis Blanchard; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linuxppc-
> dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: [PATCH v3 1/4] powerpc: Removing support for 'protected-
> sources'
> 
> 
> > In my previous reply I said that "it is not so much as a need as it is
> > a potential simplification."  After further reflection, I don't think
> > that is completely true.  As we get into AMP systems with higher core
> > counts, then implementing this functionality using the existing
> > "protected-sources" implementation versus the new "pic-no-reset" work
> > is going to be harder to maintain.
> 
> I'm not arguing that your approach isn't more suitable for AMP systems, I
> just want to leave the existing protected-sources mechanism alone. I'm not
> opposing adding a new, better, mechanism for newer platforms.
> 
> However, I'd name it differently. "pic-no-reset" doesn't carry enough
> meaning in that case. What we want to point out here is that the PIC has
> been pre-initialized.
> 
> Another option, which may be cleaner, is to stick to "no-reset" (no need
> for pic- prefix) and make it do just that (prevent the reset), and then use
> a positive variant of "protected-sources", call it "allowed-sources". Maybe
> even make it a series of ranges. Then have the MPIC only access these.
> 
> I think this is more robust as it would also prevent "accidental" use of
> the wrong sources (bad device-tree, drivers that let you muck around with
> irq numbers, etc...).

What is the use case for "allowed-sources"?   For AMP the only device
nodes in your device tree should be your AMP partition's devices,
thus any interrupt specifiers in your dev tree are "allowed".

The MPIC is a shared device and thus the need for no-reset.

So, all newer platforms should need is "no-reset".

Stuart
