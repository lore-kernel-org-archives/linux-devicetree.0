From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/2] powerpc/mpc5121: add initial support for PDM360NG
	board
Date: Tue, 22 Jun 2010 16:39:38 -0500
Message-ID: <4C212D9A.5020908@freescale.com>
References: <1272659448-23302-1-git-send-email-agust@denx.de>
	<1272659448-23302-2-git-send-email-agust@denx.de>
	<g2tfa686aa41005020754t46934f13hbd5c75a6b7668a54@mail.gmail.com>
	<4BDEFB13.5060407@freescale.com>
	<AANLkTilBveOR1aJTgunOq0aqnsGtf1vWHfn8A6uXyoPU@mail.gmail.com>
	<4BF45A1F.70100@freescale.com>
	<AANLkTinxuFz3SSLZtF3yGYtRN8nsW8_6EDiqzmJilYE9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTinxuFz3SSLZtF3yGYtRN8nsW8_6EDiqzmJilYE9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Markus Fischer <markus.fischer.ec-Jj5Fu8i2Z9Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michael Weiss <michael.weiss-Jj5Fu8i2Z9Q@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Wolfgang Grandegger <wg-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/19/2010 04:47 PM, Grant Likely wrote:
> On Wed, May 19, 2010 at 3:37 PM, Scott Wood<scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>  wrote:
>> I believe the only part of this that is new with ePAPR is that it asks that
>> the interrupt controller address cells be explicitly specified, as it's a
>> bit icky for it to default to 2 in some contexts and 0 in others.
>
> Hmmm.  I've not seen that before.  On the 5200 the value of
> #address-cells for interrupt controllers has apparently defaulted to
> <0>  so I've never encountered or thought about it.  I'm not even sure
> what #address-cells != 0 would mean in the context of interrupt
> mapping, or where it would be relevant.

The address component is mainly used in PCI interrupt mapping, where 
each slot has a distinct wiring.

It would be weird to see it on a normal interrupt controller, but 
explicitly setting it to zero helps avoid someone deciding that an 
interrupt controller ought to have a child node for whatever reason 
(this was an issue with MPIC), setting address cells to something 
non-zero, and messing up interrupt maps.

-Scott
