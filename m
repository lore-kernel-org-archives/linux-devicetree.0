From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Schemas for device trees
Date: Mon, 2 Apr 2012 09:38:36 -0400
Message-ID: <CAKON4Ow+dZzMHcsBnM38zPgHcok64YF5bBN-9HDZDe=Yt+rTBA@mail.gmail.com>
References: <CAKON4OyW00PUX3-50GrMSa0RhXLHZX3abjQmVHHiYPY2DCN=mw@mail.gmail.com>
 <20120328230235.98E0D3E0FC9@localhost>
 <CAKON4OyuU_M_DEAoqs9tRrHZEDu6GfSt+Sm7-qY8na_VSB4iUw@mail.gmail.com>
 <CAKON4OwTiH9gKY-_m8mz3M0Fn31LLOvG4Y7UNWO0HgJhRk5xrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKON4OwTiH9gKY-_m8mz3M0Fn31LLOvG4Y7UNWO0HgJhRk5xrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Thu, Mar 29, 2012 at 9:59 PM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> i2c provides an example of where a schema would be useful.
> From the binding text files, I removed the common items

Another reason for schemas, I just misspelled an attribute. It took me
several hours to figure out why my system wasn't working. I ended up
inserting printks in the driver looking for what was wrong before I
figured out that the attribute was simply misspelled. I used
slave-address when the attribute was slave-addr. Schema would have
flagged the unknown attribute at compile time.

------------------------------------------------------------

Using XML schemas is a crazy idea. It would better to leverage the DTC
and kernel infrastructure. We can use a scheme similar to kernel
module support.

The driver source for each OF compatible device would contain macros
that generate a small schema that describes the device.

Instantiation of the device in a real device tree...
		ads7846@1 {
			compatible = "ti,ads7846";
			spi-max-frequency = <1200000>;
			reg = <1>;
			gpio_pendown = <&gpio_gpio 4 0>;
			gpio_cs = <&gpio_ebi_i2stx_0 3 0>;
		};

schema for this would be something like

{
	compatible = "ti,ads7846";
	inherits-from = "schema,spi-device"
	gpio_pendown* = <&gpio_reference>;  /* star = optional */
	gpio_cs = <&gpio_reference>;
}
for a spi host...
{
	compatible = "nxp,lpc31xx-spi";
	inherits-from = "schema,spi-bus"
};
Compiling these drivers would generate two small files containing the
schema snippets into a temp directory.

Another permanent directory would hold the generic definitions.
{
	compatible = "schema,spi-device";
	inherits-from = "schema,generic-device"
	spi-max-frequency* = <0-50M>; /* range validation */
};
{
	compatible = "schema,generic-device";
	reg = <>;
	interrupts = <>;
};
{
	compatible = "schema,spi-bus";
	inherits-from = "schema,generic-bus"
	contains = {"schema,spi-device"}
};
{
	compatible = "schema,generic-bus";
	reg = <>;
	interrupts = <>;
	#address-cells = <>;
	#size-cells = <>;				
};

Now the DT compiler can read in these schema snippets and use them to
pattern match against the DT being compiled and perform validation.

-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
