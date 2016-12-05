From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] eeprom: Add IDT 89HPESx driver bindings file
Date: Mon, 5 Dec 2016 22:04:56 +0300
Message-ID: <20161205190456.GA25116@mobilestation>
References: <1475450025-29507-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-3-git-send-email-fancer.lancer@gmail.com>
 <20161205144621.yxwr7spmsvyilan5@rob-hp-laptop>
 <20161205152502.GA17538@mobilestation>
 <CAL_JsqLbMGXSRLtTiD2d3Bsu4qc4bE029gieRN8x+QxPs=VbcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLbMGXSRLtTiD2d3Bsu4qc4bE029gieRN8x+QxPs=VbcA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 05, 2016 at 11:27:07AM -0600, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Dec 5, 2016 at 9:25 AM, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Mon, Dec 05, 2016 at 08:46:21AM -0600, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >> On Tue, Nov 29, 2016 at 01:38:21AM +0300, Serge Semin wrote:
> >> > See cover-letter for changelog
> >> >
> >> > Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> >
> >> > ---
> >> >  .../devicetree/bindings/misc/idt_89hpesx.txt       | 41 ++++++++++++++++++++++
> >>
> >> There's not a better location for this? I can't tell because you don't
> >> describe what the device is.
> >>
> >
> > The device is PCIe-switch EEPROM driver with additional debug-interface to
> > access the switch CSRs. EEPROM is accesses via a separate i2c-slave
> > interface of the switch.
> >
> > There might be another place to put the binding file in. There is a special
> > location for EEPROM drivers bindings - Documentation/devicetree/bindings/eeprom/ .
> > But as far as I understood from the files put in there, it's intended for
> > pure EEPROM drivers only. On the other hand the directory I've chosen:
> > Documentation/devicetree/bindings/misc/
> > mostly intended for some unusual devices. My device isn't usual, since it
> > has CSRs debug-interface as well. Additionally I've found
> > eeprom-93xx46.txt binding file there, which describes EEPROM bindings.
> >
> > Anyway if you find the file should be placed in
> > Documentation/devicetree/bindings/eeprom/ instead, I'll move it, it's not
> > that a big problem.
> >

What about this comment? Shall the file be left at the path I placed it?

> >> >  1 file changed, 41 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/misc/idt_89hpesx.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/misc/idt_89hpesx.txt b/Documentation/devicetree/bindings/misc/idt_89hpesx.txt
> >> > index 0000000..469cc93
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/misc/idt_89hpesx.txt
> >> > @@ -0,0 +1,41 @@
> >> > +EEPROM / CSR SMBus-slave interface of IDT 89HPESx devices
> >> > +
> >> > +Required properties:
> >> > +  - compatible : should be "<manufacturer>,<type>"
> >> > +            Basically there is only one manufacturer: idt, but some
> >> > +            compatible devices may be produced in future. Following devices
> >> > +            are supported: 89hpes8nt2, 89hpes12nt3, 89hpes24nt6ag2,
> >> > +            89hpes32nt8ag2, 89hpes32nt8bg2, 89hpes12nt12g2, 89hpes16nt16g2,
> >> > +            89hpes24nt24g2, 89hpes32nt24ag2, 89hpes32nt24bg2;
> >> > +            89hpes12n3, 89hpes12n3a, 89hpes24n3, 89hpes24n3a;
> >> > +            89hpes32h8, 89hpes32h8g2, 89hpes48h12, 89hpes48h12g2,
> >> > +            89hpes48h12ag2, 89hpes16h16, 89hpes22h16, 89hpes22h16g2,
> >> > +            89hpes34h16, 89hpes34h16g2, 89hpes64h16, 89hpes64h16g2,
> >> > +            89hpes64h16ag2;
> >> > +            89hpes12t3g2, 89hpes24t3g2, 89hpes16t4, 89hpes4t4g2,
> >> > +            89hpes10t4g2, 89hpes16t4g2, 89hpes16t4ag2, 89hpes5t5,
> >> > +            89hpes6t5, 89hpes8t5, 89hpes8t5a, 89hpes24t6, 89hpes6t6g2,
> >> > +            89hpes24t6g2, 89hpes16t7, 89hpes32t8, 89hpes32t8g2,
> >> > +            89hpes48t12, 89hpes48t12g2.
> >> > +            Current implementation of the driver doesn't have any device-
> >>
> >> Driver capabilties are irrelevant to bindings.
> >>
> >
> > Why? I've told in the comment, that the devices actually differ by the CSRs
> > map. Even though it's not reflected in the code at the moment, the CSRs
> > read/write restrictions can be added by some concerned programmer in
> > future. But If I left something like "compatible : idt,89hpesx" device
> > only, it will be problematic to add that functionality.
> 
> Bindings describe the h/w, not what the Linux, FreeBSD, etc. driver
> does. You don't want to be changing the binding doc when the driver
> changes.
> 
> > Howbeit If you think it's not necessary and "compatible = idt,89hpesx" is
> > ok, it's perfectly fine for me to make it this way. The property will be
> > even simpler, than current approach.
> 
> NO! That's not at all what I'm suggesting. Specific compatible strings
> are the right way to go for the reasons you give. You just don't need
> to state why here (because it is true for all bindings).
> 

Oh, I just misunderstood what you said. I'll discard the comment.

> >> > +            specific functionalities. But since each of them differs
> >> > +            by registers mapping, CSRs read/write restrictions can be
> >> > +            added in future.
> >> > +  - reg :   I2C address of the IDT 89HPES device.
> >> > +
> >> > +Optional properties:
> >> > +  - read-only :     Parameterless property disables writes to the EEPROM
> >> > +  - idt,eesize : Size of EEPROM device connected to IDT 89HPES i2c-master bus
> >> > +            (default value is 4096 bytes if option isn't specified)
> >> > +  - idt,eeaddr : Custom address of EEPROM device
> >> > +            (If not specified IDT 89HPESx device will try to communicate
> >> > +             with EEPROM sited by default address - 0x50)
> >>
> >> Don't we already have standard EEPROM properties that could be used
> >> here?
> >>
> >
> > If we do, just tell me which one. There are standard options:
> 
> You can grep thru bindings as easily as I can. I can't do that for
> everyone's binding.
> 

It won't be necessary due to the next comment.

> > "compatible, reg, pagesize, read-only". There isn't any connected with
> > EEPROM actual size.
> > Why so? Because standard EEPROM-drivers determine the device size from the
> > compatible-string name. Such approach won't work in this case, because
> > PCIe-switch and it EEPROM are actually two different devices. Look at the
> > chain of the usual platform board design:
> > Host <--- i2c ----> i2c-slave iface |PCIe-switch| i2c-master iface <--- i2c ---> EEPROM
> >
> > As you cas see the Host reaches EEPROM through the set of PCIe-switch
> > i2c-interfaces. In order to properly get data from it my driver needs actual
> > EEPROM size and it address in the i2c-master bus of the PCIe-switch, in
> > addition to the standard reg-field, which is address of PCIe-switch i2c-slave
> > interface and read-only parameter if EEPROM-device has got WP pin asserted.
> 
> Ah, this needs to be much different than I thought. You need to model
> (i.e. use the same binding) the EEPROM node just like it was directly
> attached to the host. So this means you need the 2nd i2c bus modeled
> which means you need the PCIe switch modeled. A rough outline of the
> nodes would look like this:
> 
> host-i2c: i2c {
>   compatible ="host-i2c"
> };
> 
> pcie {
>     pcie-switch {
>         i2c-bus = <&host-i2c>;
>         i2c-bus {
>             eeprom@50 {
>             };
>         };
>     };
> };
> 
> So this models the PCIe switch as a PCIe device, it has a phandle back
> to it's controller since it's not a child of the i2c controller. Then
> the devices on switches i2c bus are modeled as children of the switch.
> 
> Alternatively, it could be described all as children of host-i2c node.
> It's common for i2c devices to have downstream i2c buses. I2C muxes
> are one example and there are bindings defined for all this. There's
> also chips like mpu-6050 that have slave buses.
> 
> Rob

I think I understand what you says. However let me just bring some details
to make things clear.

First of all the driver doesn't do any PCI-Express-related work. The device
!IDT PCI Express switch! just has two additional i2c interfaces: i2c-slave
and i2c-master. As it is obvious from the bus-names i2c-slave is the interface,
where IDT PCIe-switch device is actually slave. This interface can be reached
from the host by ordinary i2c buses. i2c-master interface is connected to an
i2c-bus, where IDT PCIe-switch is single master. This bus can have just one
EEPROM device to store some initialization data. Host can send some specific
smbus-packets to i2c-slave interface of IDT PCIe-switch in order to
preinitialize EEPROM data, connected to i2c-master interface of the device.

Additionally IDT PCIe-switch handles some special smbus packets coming to it
i2c-slave interface to read/write its internal CSR. This interface can be
used to debug the device, when there are problems with it usual PCI Express
related functioning.

So to speak, it wouldn't be good to have PCIe-switch declared in dts as a
PCI-device, since PCI-bus is actually dynamically populated by PCI-core
subsystem.

According to what you said and the device/driver design I described, the
following bindings can be suggested:

i2c0: i2c@FFFF0000 {
	compatible = "vendor,i2c-adapter";
	#address-cells = <1>;
	#size-cells = <0>;

	idt_i2c_iface: idt@60 {
		compatible = "idt,89hpes32nt8ag2";
		reg = <0x60>;
		#address-cells = <1>;
		#size-cells = <0>;

		eeprom@51 {
			compatible = "at,24c64";
			reg = <0x51>;
			read-only;
		};
	};
};

Suppose there is some host-i2c adapter like "vendor,i2c-adapter" and
i2c-slave interface of IDT PCIe-switch is connected to it. In this way
i2c-slave interface will be visible like ordinary i2c-device with just
one subnode. This subnode explains the actual EEPROM connected to
IDT PCIe-switch i2c-master interface.

Does it look acceptable? It seems like your last suggestion. Is it?

Thanks,
-Sergey

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
