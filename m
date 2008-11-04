From: "Ayman El-Khashab" <AymanE@tanisys.com>
Subject: RE: Device tree configuration for I2C eeprom
Date: Tue, 4 Nov 2008 10:07:51 -0600
Message-ID: <16691A8B34B5D9458EA3A1C37A11555A0137F857@tanisys-ex2.Tanisys.Local>
References: <9e4733910809181521r3cd74119tfedd36567e3b5394@mail.gmail.com>
	<20080919050441.GD25528@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-embedded-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
Content-class: urn:content-classes:message
In-Reply-To: <20080919050441.GD25528@secretlab.ca>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-embedded>,
	<mailto:linuxppc-embedded-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-embedded>
List-Post: <mailto:linuxppc-embedded@ozlabs.org>
List-Help: <mailto:linuxppc-embedded-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-embedded>,
	<mailto:linuxppc-embedded-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-embedded-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-embedded-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: Linuxppc-embedded@ozlabs.org, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

Grant Likely <> said on :
>>>>                                };
>>> 
>>> This should look like:
>>>>                                eeprom@50 {
>>>>                                        compatible = "eeprom";
>> 
>> 
>> The new eeprom driver is at24, eeprom is the old one. at24 has write
>> support. 
>> 
>> EEPROMs from most vendors (AT24)
>> 
>> Enable this driver to get read/write support to most I2C EEPROMs,
>> after you configure the driver to know about each EEPROM on your
>> target board. Use these generic chip names, instead of
>> vendor-specific ones like at24c64 or 24lc02: 
>> 
>> 24c00, 24c01, 24c02, spd (readonly 24c02), 24c04, 24c08, 24c16,
>> 24c32, 24c64, 24c128, 24c256, 24c512, 24c1024
> 
> No, don't use the generic chip names.  Device tree convention
> is to be specific and prefix the part number with the vendor
> name.  ie. You should be using "at,at24c64", not "24c64".
> 

Ok, here is what I used.  I see the nodes created in /sys/bus/i2c/... 
but I see four of them at address 0x50,0x51,0x52,0x53.  That surprised
me since I only have 3 of them in the device tree.  However, in any case
I did not see a way to read or write them.  In one case I was able to
cat the file "eeprom", but it was only 256 bytes and did not exist for
the other 3 devices.  Here is the section of my device tree ... I do 
see the controller being initialized in dmesg, it is just the read and
write that is eluding me.

One question I did have was within another sample device tree, there was
a comment that "this makes address 0x50 and 0x51"?  Does that mean that
large eeproms are spread over several nodes?  I searched around but
could
not find an example of how to use this at24 to access my E2 from
userspace.

Thanks
Ayman


                        IIC0: i2c@ef600700 {
                                compatible = "ibm,iic-460ex", "ibm,iic";
                                reg = <0xef600700 0x00000014>;
                                interrupt-parent = <&UIC0>;
                                interrupts = <0x2 0x4>;
                                #address-cells = <1>;
                                #size-cells = <0>;

                                at24@50 {
                                        compatible = "at24,at24c128";
                                        reg = <0x50>;
                                };
                                at24@52 {
                                        compatible = "at24,at24c128";
                                        reg = <0x52>;
                                };
                                at24@53 {
                                        compatible = "at24,at24c128";
                                        reg = <0x53>;
                                };
				}
