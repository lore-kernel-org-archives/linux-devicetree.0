From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Multiple ic2 muxes in a device tree
Date: Tue, 10 May 2011 11:00:53 -1000
Message-ID: <4DC9A785.1040209@firmworks.com>
References: <1B936DB9F22546409EE7E2F50AE76BEE02031931@dragon.enablence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1B936DB9F22546409EE7E2F50AE76BEE02031931-9O/25/N66ri8qk8cMQiaxVaTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: James Baldwin <James.Baldwin-x63MV80W0Hll57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I don't know much about how Linux handles i2c hierarchies, but I can speak =
with some authority about how it the device tree "should" be structured in =
order to conform to the principles already established for other buses.

Note that *each* pca9547 results in a subtree of the form:

   i2cmux {
      i2c@0 { }
      i2c@1 { }
      i2c@2 { }
      i2c@3 { }
      i2c@4 { }
      i2c@5 { }
      i2c@6 { }
      i2c@7 { }
   }

Each of those 8 "i2c" children represents a complete I2C bus.  When a subor=
dinate pca9547 is connected to one of those buses, the hierarchy expands to:

   i2cmux {
      i2c@0 { =

         i2cmux {
            i2c@0 { }
            i2c@1 { }
            i2c@2 { }
            i2c@3 { }
            i2c@4 { }
            i2c@5 { }
            i2c@6 { }
            i2c@7 { }
         }
      }
      i2c@1 { }
      i2c@2 { }
      i2c@3 { }
      i2c@4 { }
      i2c@5 { }
      i2c@6 { }
      i2c@7 { }
   }

The full device tree representation for the hardware shown below would be:

i2c@3100 {
  #address-cells =3D <1>;
  #size-cells =3D <0>;
  cell-index =3D <1>;
  compatible =3D "fsl-i2c";
  reg =3D <0x3100 0x100>;
  interrupts =3D <15 0x8>;
  interrupt-parent =3D <&ipic>;
  dfsrr;
  temp-sensor@49 {
    compatible =3D "national,lm73";
    reg =3D <0x49>;
  };
  eeprom@54 {
    compatible =3D "at24,24c02";
    reg =3D <0x54>;
    pagesize =3D <4>;
  };
  i2cmux@77 {
    #address-cells =3D <1>;
    #size-cells =3D <0>;
    compatible =3D "philips,pca9547";
    reg =3D <0x77>;
    i2c@0 {
      #address-cells =3D <1>;
      #size-cells =3D <0>;
      compatible =3D "philips,pca9547-channel";
      reg =3D <0>;
      i2cmux@70 {
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        compatible =3D "philips,pca9547";
        reg =3D <0x70>;
        {Potentially 8 Subordinate nodes, each named "i2c", with children}
      }
    };
    i2c@1 {
      #address-cells =3D <1>;
      #size-cells =3D <0>;
      compatible =3D "philips,pca9547-channel";
      reg =3D <1>;
      i2cmux@71 {
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        compatible =3D "philips,pca9547";
        reg =3D <0x71>;
         {Potentially 8 Subordinate nodes, each named "i2c", with children}
      };
    };
    i2c@2 {
      #address-cells =3D <1>;
      #size-cells =3D <0>;
      compatible =3D "philips,pca9547-channel";
      reg =3D <2>;
      i2cmux@72 {
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        compatible =3D "philips,pca9547";
        reg =3D <0x72>;
        {Potentially 8 Subordinate nodes, each named "i2c", with children}
      };
    i2c@3 {
      #address-cells =3D <1>;
      #size-cells =3D <0>;
      compatible =3D "philips,pca9547-channel";
      reg =3D <3>;
      i2cmux@73 {
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        compatible =3D "philips,pca9547";
        reg =3D <0x73>;
        {Potentially 8 Subordinate nodes, each named "i2c", with children}
      };
    i2c@4 {
      #address-cells =3D <1>;
      #size-cells =3D <0>;
      compatible =3D "philips,pca9547-channel";
      reg =3D <4>;
      i2cmux@74 {
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        compatible =3D "philips,pca9547";
        reg =3D <0x74>;
        {Potentially 8 Subordinate nodes, each named "i2c", with children}
      };
    };
    i2c@5 {
      #address-cells =3D <1>;
      #size-cells =3D <0>;
      compatible =3D "philips,pca9547-channel";
      reg =3D <5>;
      i2cmux@75 {
        #address-cells =3D <1>;
        #size-cells =3D <0>;
        compatible =3D "philips,pca9547";
        reg =3D <0x75>;
        {Potentially 8 Subordinate nodes, each named "i2c", with children}
      };
    i2c@6 {
      #address-cells =3D <1>;
      #size-cells =3D <0>;
      compatible =3D "philips,pca9547-channel";
      reg =3D <6>;
      rtc@68 {
        compatible =3D "stm,m41st85";
        reg =3D <0x68>;
      };
    };
    i2c@7 {
      #address-cells =3D <1>;
      #size-cells =3D <0>;
      compatible =3D "philips,pca9547-channel";
      reg =3D <7>;
      temp-sensor@48 {
        compatible =3D "national,lm73";
        reg =3D <0x48>;
      };
    };
  };
};


I understand the temptation to collapse the hierarchy by combining the mux =
node with its subordinate buses (using 2 address cells), but in my experien=
ce, shortcuts like that have not aged well.  The case where a single-level =
hierarchy would work would be a simple i2c-to-i2c bridge with only one chil=
d bus.  In this case, the existence of multiple independent child buses arg=
ues for the two-level hierarchy, satisfying the following requirements:

a) From the standpoint of a parent bus "looking down" at a pca9547, the pca=
9547 appears to be a single device at a well-defined address.

b) From the standpoint of a child device "looking up" at a pca9547, that ch=
ild is attached to a specific I2C bus with a standard one-cell I2C address =
space.

Again, though, I'm unsure that this "correct" hierarchy is compatible with =
the expectations of Linux drivers.

On 5/10/2011 9:24 AM, James Baldwin wrote:
> I have tried many different combinations based on what I=92ve been able t=
o =

> find on
> =

> the internet over the last week and have reached a dead end.
> =

> I have the following i2c topology and specify the devices as follows: =

> Linux 2.6.38.5
> =

> only seems to recognize the devices connected directly to the i2c =

> controller when it boots.
> =

> I can add the muxes and lm73/m41st85 manually using the echo command =

> from the console:
> =

> =93echo pca9547 0x70 > /sys/bus/12c/devices/i2c-2/new_device=94
> =

> This tells me I have three prime candidates for potential issues.
> =

> 1)The device tree specification is incorrect
> =

> 2)The device tree processing is incorrect (It is =91appears=92
> correct in the /proc/devicetree hierarchy)
> =

> 3)The probing code for i2c devices doesn=92t currently traverse muxes =

> properly.
> =

> As validating the device tree should be the simplest to eliminate (and =

> is the part I=92m
> =

> Directly involved with), I=92d appreciate any Constructive comments on =

> solving this problem.
> =

> |
> =

> i2c ctrl ----|
> =

> |---lm73@0x49
> =

> |
> =

> |---24c02@0x54
> =

> |
> =

> |---pca9547@0x77---|
> =

> | |-Chan 0---|---pca9547@0x70
> =

> | | |
> =

> | |
> =

> | |-Chan 1---|---pca9547@0x71
> =

> | | |
> =

> | |
> =

> | |-Chan 2---|---pca9547@0x72
> =

> | | |
> =

> | |
> =

> | |-Chan 3---|---pca9547@0x73
> =

> | | |
> =

> | |
> =

> | |-Chan 4---|---pca9547@0x74
> =

> | | |
> =

> | |
> =

> | |-Chan 5---|---pca9547@0x75
> =

> | | |
> =

> | |
> =

> | |-Chan 6---|---m41st85@0x68
> =

> | |
> =

> | |-Chan 7---|---lm73@0x48
> =

> | |
> =

> i2c@3100 {
> =

> #address-cells =3D <1>;
> =

> #size-cells =3D <0>;
> =

> cell-index =3D <1>;
> =

> compatible =3D "fsl-i2c";
> =

> reg =3D <0x3100 0x100>;
> =

> interrupts =3D <15 0x8>;
> =

> interrupt-parent =3D <&ipic>;
> =

> dfsrr;
> =

> temp-sensor@49 {
> =

> compatible =3D "national,lm73";
> =

> reg =3D <0x49>;
> =

> };
> =

> eeprom@54 {
> =

> compatible =3D "at24,24c02";
> =

> reg =3D <0x54>;
> =

> pagesize =3D <4>;
> =

> };
> =

> mux@77 {
> =

> #address-cells =3D <2>;
> =

> #size-cells =3D <0>;
> =

> compatible =3D "philips,pca9547";
> =

> reg =3D <0x77>;
> =

> mux@0,70 {
> =

> #address-cells =3D <2>;
> =

> #size-cells =3D <0>;
> =

> compatible =3D "philips,pca9547";
> =

> reg =3D <0 0x70>;
> =

> };
> =

> mux@0,71 {
> =

> #address-cells =3D <2>;
> =

> #size-cells =3D <0>;
> =

> compatible =3D "philips,pca9547";
> =

> reg =3D <1 0x71>;
> =

> };
> =

> mux@0,72 {
> =

> #address-cells =3D <2>;
> =

> #size-cells =3D <0>;
> =

> compatible =3D "philips,pca9547";
> =

> reg =3D <2 0x72>;
> =

> };
> =

> mux@0,73 {
> =

> #address-cells =3D <2>;
> =

> #size-cells =3D <0>;
> =

> compatible =3D "philips,pca9547";
> =

> reg =3D <3 0x73>;
> =

> };
> =

> mux@0,74 {
> =

> #address-cells =3D <2>;
> =

> #size-cells =3D <0>;
> =

> compatible =3D "philips,pca9547";
> =

> reg =3D <4 0x74>;
> =

> };
> =

> mux@0,75 {
> =

> #address-cells =3D <2>;
> =

> #size-cells =3D <0>;
> =

> compatible =3D "philips,pca9547";
> =

> reg =3D <0 0x75>;
> =

> };
> =

> temp-sensor@7,48 {
> =

> compatible =3D "national,lm73";
> =

> reg =3D <7 0x48 >;
> =

> };
> =

> rtc@6,68 {
> =

> compatible =3D "stm,m41st85";
> =

> reg =3D <6 0x68>;
> =

> };
> =

> };
> =

> };
> =

> Thanks,
> =

> Jim Baldwin
> =

> =

> =

> *NOTICE:*This email and any files transmitted with it are Enablence =

> confidential and intended solely for the use of the individual or entity =

> to whom they are addressed. If you have received this email in error =

> please notify the sender. This message contains Enablence confidential =

> information and is intended only for the individual named. If you are =

> not the named addressee you should not disseminate, distribute or copy =

> this e-mail. Please notify the sender immediately by e-mail if you have =

> received this e-mail by mistake and delete this e-mail from your system. =

> If you are not the intended recipient you are notified that disclosing, =

> copying, distributing or taking any action in reliance on the contents =

> of this information is strictly prohibited.
> =

> =

> =

> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
