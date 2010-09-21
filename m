From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] x86: of: define irq functions to allow drivers/of/*
	to build on x86
Date: Tue, 21 Sep 2010 16:27:07 -0300
Message-ID: <AANLkTikmnzi_3EihiOMJS+tvHFTnb0uu=L-ZmUPZnFDB@mail.gmail.com>
References: <20100910060151.6613e9c3@debxo>
	<20100910172538.GC11284@angua.secretlab.ca>
	<20100910181458.GA7243@elte.hu>
	<20100910182135.GG11284@angua.secretlab.ca>
	<20100920190604.5a2118da@debxo>
	<alpine.LFD.2.00.1009211144070.2416@localhost6.localdomain6>
	<20100921091136.45f5f7fa@debxo>
	<alpine.LFD.2.00.1009211826240.2416@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1009211826240.2416-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mitch Bradley <wmb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 21, 2010 at 1:27 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> On Tue, 21 Sep 2010, Andres Salomon wrote:
>> On Tue, 21 Sep 2010 11:45:37 +0200 (CEST)
>> Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
>>
>> > > Any additional comments (ACKs, NACKs, etc) on the patches? =A0If I
>> > > need to rework it (or them), I can certainly make the patch
>> > > description longer.
>> >
>> > Fine with me, but you could make the "mapping" function an inline as
>> > well. While at it, some sensible changelog would be helpful :)
>> >
>> > Thanks,
>> >
>> > =A0 =A0 tglx
>>
>> Hm, inlining it would require some additional x86 #ifdefs in
>> include/linux/of_irq.h (where the mapping function is declared). =A0You'd
>> prefer that?
>
> Urgh, no.

In OF code, I *have* been moving to the following pattern when the OF
code has a sane default:

#ifndef <symbol>
static inline <symbol>(...)
{
        <default implementation>
}
#define <symbol> <symbol>
#endif

I'd normally be totally okay with this in of_irq.h, except for the
fact that this implementation is a temporary solution.  Once I've got
the irq remapping code generalized for all architecture then the map
function could become a static inline in this form.

Fortunately, this code should never be on a hot path.

g.
