From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: RFC: proposal to extend the open-pic interrupt
	specifierdefinition
Date: Tue, 12 Jan 2010 23:16:08 -0700
Message-ID: <fa686aa41001122216m7d8c02b5xdd00751e7c5c8a6b@mail.gmail.com>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
	<20100107005036.GB23206@yookeroo>
	<9696D7A991D0824DBA8DFAC74A9C5FA305987E61@az33exm25.fsl.freescale.net>
	<20100107045514.GF2847@yookeroo>
	<9696D7A991D0824DBA8DFAC74A9C5FA305987F94@az33exm25.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <9696D7A991D0824DBA8DFAC74A9C5FA305987F94-ofAVchDyotYzzZk0BCvKg5jmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 7, 2010 at 10:39 AM, Yoder Stuart-B08248
<B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> > > Um.. what do "type" and "sub-type" mean in this context?
>> >
>> > "type" specifies the type of interrupt-- example timer, MSI,
>> > etc and would define the meaning of the interrupt number
>> > portion of the interrupt specifier. =A0 A given "type" may or
>> > may not have a "subtype" depending on the binding.
>> >
>> > As described in the proposal, "type" is a range of numbers,
>> > divided between standard/architected types and implementation
>> > specific types.
>> >
>> > We (Freescale) have at least one interrupt type "error" in the P4080
>> > that would have a "sub-type" that would indicate a related bit in
>> > another
>> > status register.
>>
>> And who is the type/subtype relevant to? =A0From what you've said here,
>> I don't see why it needs to be in the interrupt specifiers.
>
> It is relevant to whatever code manages the interrupt
> controller.
>
> A bit more background information. The MPIC in Freescale chips
> supports several types of interrupts-- SOC devices, external
> interrupts, MSIs, timers. =A0 The registers to manage these interrupt
> sources are not laid out in a way that is conducive to just enumerating
> all the interrupt sources starting from zero. =A0 They are in different
> discrete areas of the MPIC register map.
>
> We need the device tree to be able to represent all interrupt sources
> and distinguish between timer interrupt 0 and SOC device interrupt
> 0 and MSI interrupt 0.

Sounds to me that it would be far more sane to either use cascaded
interrupt nodes to handle these different irq number spaces, or to use
multiple cells for the hw irq number.  Trying to encode these things
into bit fields in the second cell sounds like trouble and confusion
to me, not to mention premature optimization to reduce the number of
cells being used per IRQ.

Oh, and *DOCUMENT THE HELL OUT OF IT*.  Give uses an easy reference to
figure out what the irq specifier needs to be for the device they're
using.  I had enough trouble from the MPC5200's 2 level irq number
scheme in this regard.  The confusion finally went away (mostly) when
I stopped trying to describe to everyone how it worked and instead
specifically documented that IRQ1 =3D=3D <0 0 x>, IRQ2 =3D=3D <1 1 x>, IRQ3=
 =3D=3D
<1 2 x>, IRQ4 =3D=3D <1 3 x>.  :-)

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
