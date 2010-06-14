From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Request review of device tree documentation
Date: Mon, 14 Jun 2010 10:29:51 -0600
Message-ID: <AANLkTimY8IvWh92kyiJOTZKfb9ddCMeqcTo86cTOytWg@mail.gmail.com>
References: <4C13430B.5000907@firmworks.com>
	<1276339529.1962.184.camel@pasglop>
	<1276339684.1962.186.camel@pasglop> <4C13B618.1030006@firmworks.com>
	<1276383132.1962.195.camel@pasglop>
	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>
	<4C146F18.9030008@firmworks.com>
	<AANLkTikls3hjXOmKFqG2D_9GaJSjOXNuuRXPlanAjo5E@mail.gmail.com>
	<20100614124438.GF9323@yookeroo>
	<alpine.LFD.2.00.1006141044510.13427@xanadu.home>
	<20100614160201.GD9550@shareable.org>
	<alpine.LFD.2.00.1006141206110.13427@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <alpine.LFD.2.00.1006141206110.13427@xanadu.home>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Nicolas Pitre <nico@fluxnic.net>
Cc: microblaze-uclinux@itee.uq.edu.au, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Jamie Lokier <jamie@shareable.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Mitch Bradley <wmb@firmworks.com>, Dan Malek <ppc6dev@digitaldans.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 14, 2010 at 10:23 AM, Nicolas Pitre <nico@fluxnic.net> wrote:
> On Mon, 14 Jun 2010, Jamie Lokier wrote:
>> So requiring that a bootloader can update the DT _independently_ of
>> everything else is a bit much for some devices.
>
> In my opinion, this use case you're illustrating above simply could
> continue to _not_ use DT at all. =A0If your NOR flash is so small that you
> cannot spare some extra erase blocks, then this is a deeply embedded
> profile the current DT-on-ARM push is not really meant for. =A0You would
> be much better with a minimally configured kernel with all the hardware
> info statically compiled into the kernel and get away without all the DT
> parsing code altogether, like you're already doing today.
>
> While I think DT for ARM has advantages, I don't see us dropping the
> legacy ARM methods anytime soon, especially for existing or extremely
> constrained targets.

I completely agree.

g.
