From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Request review of device tree documentation
Date: Mon, 14 Jun 2010 09:08:16 -0600
Message-ID: <AANLkTikH6AHQZse6YX6EzT3H3MKQzob_J04my5mLWW0V@mail.gmail.com>
References: <33BD8E86-9397-432A-97BF-F154812C157B@digitaldans.com>
	<AANLkTilv6TtPZs0DAwd8JlSV_J3VvMsvtVVOOeQauOIn@mail.gmail.com>
	<4C13430B.5000907@firmworks.com> <1276339529.1962.184.camel@pasglop>
	<1276339684.1962.186.camel@pasglop> <4C13B618.1030006@firmworks.com>
	<1276383132.1962.195.camel@pasglop>
	<AANLkTimRV8u3gDNCAIlROJoPcKs7jFwj2na3ZDFOg3O0@mail.gmail.com>
	<4C146F18.9030008@firmworks.com>
	<AANLkTikls3hjXOmKFqG2D_9GaJSjOXNuuRXPlanAjo5E@mail.gmail.com>
	<20100614124438.GF9323@yookeroo>
	<alpine.LFD.2.00.1006141044510.13427@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <alpine.LFD.2.00.1006141044510.13427@xanadu.home>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Nicolas Pitre <nico@fluxnic.net>
Cc: microblaze-uclinux@itee.uq.edu.au, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Mitch Bradley <wmb@firmworks.com>, Dan Malek <ppc6dev@digitaldans.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 14, 2010 at 8:59 AM, Nicolas Pitre <nico@fluxnic.net> wrote:
> On Mon, 14 Jun 2010, David Gibson wrote:
>
>> On Sun, Jun 13, 2010 at 11:02:15PM -0600, Grant Likely wrote:
>> Indeed. =A0In fact, the general rule of thumb is really "put as much as
>> possible into the most easily replaced layer of the stack". =A0This is,
>> incidentally, why I've always been dubious about simple firmwares
>> supplying a flattened device tree rather than including the device
>> tree template in the kernel, cuboot style.
>
> The biggest advantage, IMHO, for adding DT to ARM, is actually to
> decouple the hardware config information and the kernel. =A0If in the end
> the DT has to be shipped in the kernel then we're losing all this
> advantage over the current state of things on ARM which still works
> pretty well otherwise.
>
> In the best case, the simple firmware simply has to retrieve the
> flattened device tree from flash, and pass it to the kernel just like
> some anonymous blob. =A0And the simple firmware only needs to provide a
> way for that DT blob to be updatable, like through an upload of a
> replacement blob that was prepared offline. =A0Just like a ramdisk image
> or the like.
>
> That doesn't need to be fancier than that, and the goal of having the DT
> data tied to the hardware instead of the kernel is achieved.

exactly right.

g.
