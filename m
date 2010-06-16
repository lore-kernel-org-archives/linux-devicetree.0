From: Vladimir Pantelic <pan@nt.tu-darmstadt.de>
Subject: Re: Request review of device tree documentation
Date: Wed, 16 Jun 2010 11:45:00 +0200
Message-ID: <4C189D1C.6050304@nt.tu-darmstadt.de>
References: <4C13430B.5000907@firmworks.com>	<1276339529.1962.184.camel@pasglop>	<1276339684.1962.186.camel@pasglop>	<4C13B618.1030006@firmworks.com>	<1276383132.1962.195.camel@pasglop>	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>	<4C146F18.9030008@firmworks.com>	<AANLkTikls3hjXOmKFqG2D_9GaJSjOXNuuRXPlanAjo5E@mail.gmail.com>	<20100614124438.GF9323@yookeroo>	<alpine.LFD.2.00.1006141044510.13427@xanadu.home>	<20100614160201.GD9550@shareable.org>	<4C165FD1.6080505@firmworks.com>
	<4C186AA8.4040709@compulab.co.il>	<4C186B7B.1060308@firmworks.com>
	<4C186C72.2020506@compulab.co.il>	<4C187013.5000400@firmworks.com>
	<4C18738C.4090809@compulab.co.il> <4C187FF0.5020806@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4C187FF0.5020806@firmworks.com>
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

>>  I'm also objecting the step (b) and, fortunately, it's not yet the
>>  status quo.
>>  Current U-Boot/kernel implementations I've encountered still do not
>>  have OS calls to resident HW access routines. But if such calls would
>>  be allowed, my impression is that SoC vendors would make extensive use
>>  of them.
>
> One could argue that a feature that vendors would use extensively is one
> that is sorely needed from their point of view.

yes, it would free them from writing these pesky linux drivers and getting
them into mainline :)
