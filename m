From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] eeprom: Add IDT 89HPESx driver bindings file
Date: Mon, 5 Dec 2016 18:25:02 +0300
Message-ID: <20161205152502.GA17538@mobilestation>
References: <1475450025-29507-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-3-git-send-email-fancer.lancer@gmail.com>
 <20161205144621.yxwr7spmsvyilan5@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161205144621.yxwr7spmsvyilan5@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 05, 2016 at 08:46:21AM -0600, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Nov 29, 2016 at 01:38:21AM +0300, Serge Semin wrote:
> > See cover-letter for changelog
> > 
> > Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > ---
> >  .../devicetree/bindings/misc/idt_89hpesx.txt       | 41 ++++++++++++++++++++++
> 
> There's not a better location for this? I can't tell because you don't 
> describe what the device is.
> 

The device is PCIe-switch EEPROM driver with additional debug-interface to
access the switch CSRs. EEPROM is accesses via a separate i2c-slave
interface of the switch.

There might be another place to put the binding file in. There is a special
location for EEPROM drivers bindings - Documentation/devicetree/bindings/eeprom/ .
But as far as I understood from the files put in there, it's intended for
pure EEPROM drivers only. On the other hand the directory I've chosen:
Documentation/devicetree/bindings/misc/
mostly intended for some unusual devices. My device isn't usual, since it
has CSRs debug-interface as well. Additionally I've found
eeprom-93xx46.txt binding file there, which describes EEPROM bindings.

Anyway if you find the file should be placed in 
Documentation/devicetree/bindings/eeprom/ instead, I'll move it, it's not
that a big problem.

> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/idt_89hpesx.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/misc/idt_89hpesx.txt b/Documentation/devicetree/bindings/misc/idt_89hpesx.txt
> > index 0000000..469cc93
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/idt_89hpesx.txt
> > @@ -0,0 +1,41 @@
> > +EEPROM / CSR SMBus-slave interface of IDT 89HPESx devices
> > +
> > +Required properties:
> > +  - compatible : should be "<manufacturer>,<type>"
> > +		 Basically there is only one manufacturer: idt, but some
> > +		 compatible devices may be produced in future. Following devices
> > +		 are supported: 89hpes8nt2, 89hpes12nt3, 89hpes24nt6ag2,
> > +		 89hpes32nt8ag2, 89hpes32nt8bg2, 89hpes12nt12g2, 89hpes16nt16g2,
> > +		 89hpes24nt24g2, 89hpes32nt24ag2, 89hpes32nt24bg2;
> > +		 89hpes12n3, 89hpes12n3a, 89hpes24n3, 89hpes24n3a;
> > +		 89hpes32h8, 89hpes32h8g2, 89hpes48h12, 89hpes48h12g2,
> > +		 89hpes48h12ag2, 89hpes16h16, 89hpes22h16, 89hpes22h16g2,
> > +		 89hpes34h16, 89hpes34h16g2, 89hpes64h16, 89hpes64h16g2,
> > +		 89hpes64h16ag2;
> > +		 89hpes12t3g2, 89hpes24t3g2, 89hpes16t4, 89hpes4t4g2,
> > +		 89hpes10t4g2, 89hpes16t4g2, 89hpes16t4ag2, 89hpes5t5,
> > +		 89hpes6t5, 89hpes8t5, 89hpes8t5a, 89hpes24t6, 89hpes6t6g2,
> > +		 89hpes24t6g2, 89hpes16t7, 89hpes32t8, 89hpes32t8g2,
> > +		 89hpes48t12, 89hpes48t12g2.
> > +		 Current implementation of the driver doesn't have any device-
> 
> Driver capabilties are irrelevant to bindings.
> 

Why? I've told in the comment, that the devices actually differ by the CSRs
map. Even though it's not reflected in the code at the moment, the CSRs
read/write restrictions can be added by some concerned programmer in
future. But If I left something like "compatible : idt,89hpesx" device
only, it will be problematic to add that functionality.

Howbeit If you think it's not necessary and "compatible = idt,89hpesx" is
ok, it's perfectly fine for me to make it this way. The property will be
even simpler, than current approach.

> > +		 specific functionalities. But since each of them differs
> > +		 by registers mapping, CSRs read/write restrictions can be
> > +		 added in future.
> > +  - reg :	 I2C address of the IDT 89HPES device.
> > +
> > +Optional properties:
> > +  - read-only :	 Parameterless property disables writes to the EEPROM
> > +  - idt,eesize : Size of EEPROM device connected to IDT 89HPES i2c-master bus
> > +		 (default value is 4096 bytes if option isn't specified)
> > +  - idt,eeaddr : Custom address of EEPROM device
> > +		 (If not specified IDT 89HPESx device will try to communicate
> > +		  with EEPROM sited by default address - 0x50)
> 
> Don't we already have standard EEPROM properties that could be used 
> here?
> 

If we do, just tell me which one. There are standard options:
"compatible, reg, pagesize, read-only". There isn't any connected with
EEPROM actual size.
Why so? Because standard EEPROM-drivers determine the device size from the
compatible-string name. Such approach won't work in this case, because
PCIe-switch and it EEPROM are actually two different devices. Look at the
chain of the usual platform board design:
Host <--- i2c ----> i2c-slave iface |PCIe-switch| i2c-master iface <--- i2c ---> EEPROM

As you cas see the Host reaches EEPROM through the set of PCIe-switch
i2c-interfaces. In order to properly get data from it my driver needs actual
EEPROM size and it address in the i2c-master bus of the PCIe-switch, in
addition to the standard reg-field, which is address of PCIe-switch i2c-slave
interface and read-only parameter if EEPROM-device has got WP pin asserted.

> > +
> > +Example:
> > +	idt_pcie_sw@60 {
> 
> Don't use '_'.
> 

Ok, I won't.

> > +		compatible = "idt,89hpes12nt3";
> > +		reg = <0x60>;
> > +		read-only;
> > +		idt,eesize = <65536>;
> > +		idt,eeaddr = <0x50>;
> > +	};
> > -- 
> > 2.6.6
> > 

Waiting for the respond.
Thanks
-Sergey

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
