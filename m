From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] powerpc/mpc5121: add initial support for PDM360NG
	board
Date: Wed, 19 May 2010 15:47:45 -0600
Message-ID: <AANLkTinxuFz3SSLZtF3yGYtRN8nsW8_6EDiqzmJilYE9@mail.gmail.com>
References: <1272659448-23302-1-git-send-email-agust@denx.de>
	<1272659448-23302-2-git-send-email-agust@denx.de>
	<g2tfa686aa41005020754t46934f13hbd5c75a6b7668a54@mail.gmail.com>
	<4BDEFB13.5060407@freescale.com>
	<AANLkTilBveOR1aJTgunOq0aqnsGtf1vWHfn8A6uXyoPU@mail.gmail.com>
	<4BF45A1F.70100@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4BF45A1F.70100-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Markus Fischer <markus.fischer.ec-Jj5Fu8i2Z9Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michael Weiss <michael.weiss-Jj5Fu8i2Z9Q@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Wolfgang Grandegger <wg-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 19, 2010 at 3:37 PM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On 05/19/2010 04:27 PM, Grant Likely wrote:
>>
>> On Mon, May 3, 2010 at 10:34 AM, Scott Wood<scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> =A0wrote:
>>>
>>> Grant Likely wrote:
>>>>>
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 // IPIC
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 // interrupts cell =3D<intr #, sense>
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 // sense values match linux IORESOURCE_=
IRQ_* defines:
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 // sense =3D=3D 8: Level, low assertion
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 // sense =3D=3D 2: Edge, high-to-low ch=
ange
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 //
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ipic: interrupt-controller@c00 {
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,mpc=
5121-ipic", "fsl,ipic";
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D<0>;
>>>>
>>>> Don't need #address-cells here
>>>
>>> #address-cells is required by ePAPR for interrupt controllers if an
>>> interrupt-map is used.
>>
>> Why?
>>
>> /me is too lazy to dig out ePAPR and look.
>
> Address cells are part of the interrupt identification. =A0Typically with
> interrupt maps this is only used on the child end (e.g. to select a
> particular PCI slot), but if the parent interrupt controller's address ce=
lls
> are non-zero it will be expected in the parent interrupt specifier as wel=
l.
>
> I believe the only part of this that is new with ePAPR is that it asks th=
at
> the interrupt controller address cells be explicitly specified, as it's a
> bit icky for it to default to 2 in some contexts and 0 in others.

Hmmm.  I've not seen that before.  On the 5200 the value of
#address-cells for interrupt controllers has apparently defaulted to
<0> so I've never encountered or thought about it.  I'm not even sure
what #address-cells !=3D 0 would mean in the context of interrupt
mapping, or where it would be relevant.

g.
