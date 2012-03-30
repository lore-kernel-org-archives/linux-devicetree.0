From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Schemas for device trees
Date: Thu, 29 Mar 2012 21:59:22 -0400
Message-ID: <CAKON4OwTiH9gKY-_m8mz3M0Fn31LLOvG4Y7UNWO0HgJhRk5xrA@mail.gmail.com>
References: <CAKON4OyW00PUX3-50GrMSa0RhXLHZX3abjQmVHHiYPY2DCN=mw@mail.gmail.com>
 <20120328230235.98E0D3E0FC9@localhost>
 <CAKON4OyuU_M_DEAoqs9tRrHZEDu6GfSt+Sm7-qY8na_VSB4iUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKON4OyuU_M_DEAoqs9tRrHZEDu6GfSt+Sm7-qY8na_VSB4iUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

i2c provides an example of where a schema would be useful.
>From the binding text files, I removed the common items

fsl-i2c
	i2c@1740 {
		clock-frequency = <100000>;
		fsl,timeout = <10000>;
	};
samsung-i2c
	i2c@13870000 {
		samsung,i2c-sda-delay = <100>;
		samsung,i2c-max-bus-freq = <100000>;
		samsung,i2c-slave-addr = <0>;
	};
ce4100-i2c.txt
	i2c@0 {
missing clock-frequency
	};
omap-i2c.txt
i2c1: i2c@0 {
    ti,hwmods = "i2c1";   -- I think this is because they are missing reg = <>
    clock-frequency = <400000>;
};
arm-versatile.txt
missing clock frequency
i2c-designware.txt
looks ok
fsl-imx-i2c.txt
looks ok
cpm_qe/cpm/i2c.txt
file is in wrong place

The schema probably should be:
	i2c@address {
		compatible = "xxxx";  - required
		reg = <xxxx>; - required
		interrupts = <xxx>;  - required?
		interrupt-parent = <xxxx>; - if need
		clock-frequency = <xxxx>;  - optional, schema says default is 100Khz
		slave-addr = <xxxx>;  - optional, all of the controllers support slave mode
		timeout = <xxxxx>; - optional
		#address-cells = <1>;
		#size-cells = <0>;
		aaaa,bbbb = <xxxx> - private, must have a comma in the name
      }

Once schemas are in place and everything is validating, another pass
can be made to implement a common parser. The common parser would get
all of these attributes and parse them into a struct.  Then we can
work on making sure each driver actually implements these core
attributes consistently.

-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
