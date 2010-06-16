From: Mike Rapoport <mike@compulab.co.il>
Subject: Re: Request review of device tree documentation
Date: Wed, 16 Jun 2010 09:09:44 +0300
Message-ID: <4C186AA8.4040709@compulab.co.il>
References: <4C13430B.5000907@firmworks.com>	<1276339529.1962.184.camel@pasglop>	<1276339684.1962.186.camel@pasglop>	<4C13B618.1030006@firmworks.com>	<1276383132.1962.195.camel@pasglop>	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>	<4C146F18.9030008@firmworks.com>	<AANLkTikls3hjXOmKFqG2D_9GaJSjOXNuuRXPlanAjo5E@mail.gmail.com>	<20100614124438.GF9323@yookeroo>	<alpine.LFD.2.00.1006141044510.13427@xanadu.home>	<20100614160201.GD9550@shareable.org>
	<4C165FD1.6080505@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4C165FD1.6080505@firmworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mitch Bradley <wmb@firmworks.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Jamie Lokier <jamie@shareable.org>, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Mike Rapoport <mike@compulab.co.il>, Dan Malek <ppc6dev@digitaldans.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

Mitch Bradley wrote:

> The second topic is the hypothetical use of OFW as a HAL. That will not 
> happen for several reasons.  The opposition to the idea is widespread 
> and deeply held, and there are good arguments to support that 
> opposition.   Furthermore, the economic conditions necessary for the 
> creation of such a HAL do not exist in the ARM world, nor indeed in the 
> Linux world in general.  (The necessary condition is the ability for one 
> company to impose a substantial change by fiat - essentially a monopoly 
> position.)
> 
> Shall we agree, then, that any further discussion of the HAL issue is 
> "just for fun", and that nobody needs to feel threatened that it would 
> actually happen?

I've recently worked with vendor versions of U-Boot for advanced ARM 
SoCs. There is already *huge* chunk of HAL code in those versions. And 
if there would be possibility to have callbacks into the firmware these 
chunks would only grow, IMHO.


> The potential for "vendors breaking out of the debugging use case and 
> turning it into a HAL" is miniscule, because
> 
> a) The callback is disabled by default
> b) The technical challenges of the callback interface limit its 
> applicability to specific "wizard user" scenarios
> c) OFW is unlikely to achieve sufficient market penetration for the HAL 
> thing to be worth doing
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- 
Sincerely yours,
Mike.
