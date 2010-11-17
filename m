From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree with early buffer allocations and aliased memory
Date: Tue, 16 Nov 2010 21:35:35 -0700
Message-ID: <AANLkTikP5jjwHOAJ_9DeG9WAzs1VCxgaftRxVWe0J4Su@mail.gmail.com>
References: <20101027184908.GA7669@dvomlehn-lnx2.corp.sa.net>
	<AANLkTi=OWBbB8vPNapxkBDiVRCoGS-sZ5-CXcKK0n8iv@mail.gmail.com>
	<20101103205037.GA15096@dvomlehn-lnx2.corp.sa.net>
	<20101110042537.GA4110@angua.secretlab.ca>
	<20101115231008.GA468@dvomlehn-lnx2.corp.sa.net>
	<20101116065718.GD4074@angua.secretlab.ca>
	<4CE31213.1040608@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CE31213.1040608-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Device Tree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 16, 2010 at 4:21 PM, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> On 11/15/2010 10:57 PM, Grant Likely wrote:
>
> ...
>>
>> I'm not sure I completely follow you. =A0Any memory described in a
>> device_type=3D"memory" node will by default be used as system RAM by
>> Linux. =A0If some of that region needs to be used for DMA buffers, then
>> you'll need to make sure that when a driver allocates a buffer, that
>> the buffer is made valid for DMA operations. =A0How you do this is
>> architecture specific.
>
> Okay, I think I've got this down
> ...
>>
>> what does 'stbus' mean? =A0If it is the hardware name for the bus, then
>> it is probably a good choice. =A0'soc' is often used, but I'm not a big
>> fan of that convention because it doesn't reflect the actual internal
>> architecture of the chip.
>
> Yes, this is what STMicroelectronics call their bus, specifically "STBus".
> Which looks like what the device tree calls a simple- bus.

To be specific, 'simple-bus' is a binding that means a simple memory
mapped bus without any configuration required, but it is not the name
of a bus.  See ePAPR for the actual binding definition (which is
pretty small).  For completeness, the compatible value for this node
should probably be:

compatbile =3D "<socvendor>,<socmodel>-stbus", "simple-bus";

so that both the specific device device is detailed, as well as the
fact that it is compatible with the simple-bus binding.

As for the node name, "bus" would be fine.  "stbus" would also be
okay, as would "soc" or "soc-bus".  The node name doesn't actually
matter much as operating systems shouldn't ever depend on node names
to determine behaviour, but the generic names recommended practice
should still be followed as much as possible (see section 2.2.2 in
ePAPR.  This is also why "simple-bus" isn't a good name, because
"simple-bus" represents the programming model, not a generic name of
what the node is).

.... and yes, I am aware that i get rather pedantic about this stuff.  :-)

g.
