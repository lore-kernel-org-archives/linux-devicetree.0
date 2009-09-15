From: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Subject: Re: Gpio reset handling
Date: Wed, 16 Sep 2009 08:40:42 +1000
Message-ID: <1d3f23370909151540p411f0bc0r1c81b68ceb2fb45e@mail.gmail.com>
References: <4AAFDDD1.9070702@monstr.eu>
	<fa686aa40909151527r36334528ne1194523f141a8a2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa40909151527r36334528ne1194523f141a8a2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Wed, Sep 16, 2009 at 8:27 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Tue, Sep 15, 2009 at 12:32 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
>> Hi All,
>>
>> I would like to find out proper way how to handle xilinx reset gpio.
>> We are using gpio for soft reset.
> [...]
>> Ok and here about description of reset port
>> I see two option to write new trigger
>> 1. new reset trigger and add it to gpio-leds node - but this should be i=
n gpio-leds node which make
>> no sense to me
>>
>> =A0 =A0 =A0 =A0reset {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label =3D "Heartbeat";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpios =3D <&gpio_res 3 1>;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linux,default-trigger =3D "reset";
>> =A0 =A0 =A0 =A0}
>
> This looks like an abuse of the LED infrastructure.

I agree - we created this idea as a strawman to motivate what follows :)

>> 2. create own reset node
>>
>> reset {
>> =A0 =A0 =A0 =A0compatible =3D "gpio-reset";
>> =A0 =A0 =A0 =A0reset0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label "Soft reset";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpios =3D <&gpio_res 1 1>;
>> =A0 =A0 =A0 =A0}
>>
>> =A0 =A0 =A0 =A0reset1 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label "Phy reset";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpios =3D <&gpio_res 2 1>;
>> =A0 =A0 =A0 =A0}
>> }
>>
>> For this node there should be better reset description not just label wi=
th different description.
>> I expect that it will be useful soft and hard reset and maybe you can fi=
nd some others.
>
> It sounds like what you are doing is very board specific. =A0It is
> probably premature to design a 'generic' binding for something that
> may very well not turn out to be very generic at all.

On the contrary - the MicroBlaze CPU itself has no provision for a
self-initiated soft reset.  Instead, the way it is achieved is by
connecting one bit of a GPIO to the AUX_RESET input of Xilinx's
proc_sys_reset IP (also used in PPC designs as you know).  We are
looking for a sensible, flexible way of binding this structure that we
instantiate in almost all MicroBlaze Linux systems.

BTW - how do you handle soft-reset on Xilinx/PPC designs?

> What I'd do is
> create yourself a node for holding board specific properties (like the
> binding to the gpio reset line) and parse that data from your board
> specific setup code. =A0I suppose you could also do it from an
> of_platform driver, but like irq controllers, it probably doesn't make
> a lot of sense to.

We are trying to avoid board-specific platform code at all costs - the
ability to fully configure a standard kernel onto arbitrary boards via
a DTB is proving very useful, and as I said above we see this
reset-gpio capability as a generic thing that will be used across many
platforms.  We just want to do it right.

>
> So, something like this perhaps:
>
> =A0 =A0machine {
> =A0 =A0 =A0 =A0compatible =3D "<vendor>,<board>-machine";
> =A0 =A0 =A0 =A0soft-reset-gpio =3D <&gpio_res 1 1>;
> =A0 =A0 =A0 =A0phy-reset-gpio =3D <&gpio_res 2 1>;
> =A0 =A0};
>
> I don't much like the node name "machine", but I can't think of
> anything better at the moment.
>
> Note, this suggestion uses "soft-reset-gpio" and "phy-reset-gpio"
> properties instead of the currently documented "gpios" property. =A0This
> usage isn't supported by the current gpio support code, but that code
> can be modified, and I think this approach is clearer (as long as the
> expected usage of "<vendor>,<board>-machine" is documented.

Given my justification above, can you spare some of your bountiful
neurons on considering how we might do it generically?  Does flattery
work on you? :)

John
-- =

John Williams, PhD, B.Eng, B.IT
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com  p: +61-7-30090663  f: +61-7-30090663
