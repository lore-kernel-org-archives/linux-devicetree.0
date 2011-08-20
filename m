From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/3] picoxcell: support for Picochip picoxcell devices
Date: Sat, 20 Aug 2011 07:37:39 -0700
Message-ID: <CACxGe6vZe4kba6BogY0XStY4oBPN1E_PVHVo=GjoFV1fi6C+mw@mail.gmail.com>
References: <1312884661-27205-1-git-send-email-jamie@jamieiles.com>
	<1312884661-27205-2-git-send-email-jamie@jamieiles.com>
	<4E4F54CC.8000506@secretlab.ca> <20110820065251.GB18892@gallagher>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110820065251.GB18892@gallagher>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2011 at 11:52 PM, Jamie Iles <jamie@jamieiles.com> wrote:
> Hi Grant,
>
> On Fri, Aug 19, 2011 at 11:31:40PM -0700, Grant Likely wrote:
>> On 11-08-09 03:10 AM, Jamie Iles wrote:
> [...]
>> >+VIC required properties:
>> >+ =A0 =A0- compatible =3D "arm,pl192-vic-pair".
>> >+ =A0 =A0- interrupt-controller.
>> >+ =A0 =A0- reg : The register bank for the devices. =A0Picoxcell has tw=
o VIC's and the
>> >+ =A0 =A0 =A0IRQ outputs are wire-OR'd together so we effectively have =
a combined
>> >+ =A0 =A0 =A0controller that handles 64 IRQ's. =A0The first reg tuple i=
s the register
>> >+ =A0 =A0 =A0bank of the VIC that generates IRQ's 0->31 and the second =
tuple handles
>> >+ =A0 =A0 =A0IRQ's 32->63.
>>
>> If they are two separate devices, then it probably should still be
>> represented as two separate device tree nodes. =A0Linux can take care
>> of assigning a range of linux irq numbers to each VIC.
>
> The reason I did this is because of the entry macro get_irqnr_and_base
> macro decoding. =A0If I used irq_domain_generate_simple() rather than
> irq_domain_add_simple() then I guess the ordering of the VIC's in the DT
> wont matter. =A0I'll give this a test when I have access to hardware again
> and respin.

Don't get too hung up on irq_domain_{generate,add}_simple().  Those
functions are temporary helpers until the vic driver itself directly
uses irq_domain.

g.
