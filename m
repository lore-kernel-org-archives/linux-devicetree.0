From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Globally s/struct irq_host/struct irq_domain/
Date: Mon, 4 Oct 2010 21:00:50 -0600
Message-ID: <AANLkTimGtuq8+yA121xg0tVQ=Z=nqfzUG6BC8YqzX3Qh@mail.gmail.com>
References: <E1P2Tqn-0004gj-W1@jdl.com>
	<20101004165212.GC13749@angua.secretlab.ca>
	<1286233776.2463.329.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1286233776.2463.329.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 4, 2010 at 5:09 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Mon, 2010-10-04 at 10:52 -0600, Grant Likely wrote:
>> On Sun, Oct 03, 2010 at 02:03:57PM -0500, Jon Loeliger wrote:
>> >
>> > Just rename the irq_host structure as irq_domain to lessen the
>> > confusion around the word "host". =A0Updated a few comments and
>> > error messages to use "irq_domain" when refering to the structure.
>> >
>> > Suggested by Ben Herrenschmidt on the device-tree mailing list.
>> >
>> > Signed-off-by: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
>> > ---
>> >
>> > Grant requested one giant patch simply renaming the structure.
>>
>> Thanks Jon,
>>
>> However, considering that tglx has already embarked on his Grand IRQ
>> Subsystem Cleanup, I suspect that this will end up just getting in the
>> way unless he picks it up into his queue. =A0It may even by that the
>> need for irq_host will disappear once Thomas is finished by merging it
>> into the core code. =A0I'd like to sit tight on this until the details
>> of what powerpc virqs can be worked out with Ben and Thomas.
>
> I doubt the need for irq_host will disappear. However I don't see that
> going into the core under that name, so I think the rename is a very
> valid thing to do now. We just need to sync the patches to avoid pure
> mechanical clash.
>
> Thomas initial series doesn't yet generalize the virq layer and that
> will take a bit longer, so I'm happy to see Jon stuff go upstream first.

Alright, should tglx pick up this patch, or do you want to carry it in
the powerpc tree?

g.

>
> What hopefully will go away is the big irq_map array, I hope to put the
> domain & hw_number information in the irq_desc or irq_data eventually.
>
>> Also, sorry for sending you down this rabbit hole. =A0When I suggested
>> this I didn't realize how quickly Thomas was going to get started on
>> his rework.
>
> Cheers,
> Ben.
>
