From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v1 2/2] mtd: docg3: add device-tree documentation
Date: Fri, 26 Sep 2014 18:50:13 +0100
Message-ID: <20140926175013.GL7422@leverpostej>
References: <1411684396-12094-1-git-send-email-robert.jarzmik@free.fr>
 <1411684396-12094-2-git-send-email-robert.jarzmik@free.fr>
 <20140926110546.GA7422@leverpostej> <87h9zupadm.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <87h9zupadm.fsf@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 26, 2014 at 06:19:49PM +0100, Robert Jarzmik wrote:
> Mark Rutland <mark.rutland@arm.com> writes:
> 
> >> +The Sandisk (former MSystems) docg3 is a nand device of 64M to 256MB.
> >
> > I think that should be: "(formerly M-Systems)".
> Right.
> 
> > I'd rather we used the full name (DiskOnChip G3), as "docg3" is a
> > Linux-specific abbreviation. So I think the compatible string should be
> > something like "sandisk,diskonchip-g3". Arguably we should have
> > M-Systems as the vendor.
> "sandisk,diskonchip-g3" : full ack, for v2

ok.

> For M-Systems, it's as you wish. Just so that you have the broad view, this is
> my understanding of M-Systems / Sandisk :
>  - M-Systems creates several diskonchip chips, especially docg3

Ok, so I'd label those devices with an M-Systems vendor prefix
("m-systems", I guess, if we don't already have one).

>  - M-Systems is bought and absorbed by Sandisk

For the devices sold during this time where nothing has changed other
than the label, I'd keep the M-Systems vendor.

>  - Sandisk creates and ships other diskonchip, under sandisk brand

These new devices I would label with a sandisk vendor-prefix.

> Now I'll put in the compat whatever you advice for, I have no opinion on
> that. I'm telling you this because I have another patch to submit for a camera
> sensor made by Aptina. Aptina was absorbed by Micron, and the sensor was
> released under Aptina/Micron brand (ie. Aptina team in Micron corp. if I
> understood correctly).
> 
> Therefore, I'll take your advice for both sandisk/msystems and aptina/micron :)

I'd label something as the original brand it shipped under, unless
there's a compelling reason not to. We can add notes in the binding
documentation to make the bindings easier to find where a device has
been labelled by different manufacturers.

> > Are we able to detect the particular variant by reading registers on the
> > device? Are there any differences that we can probe dynamically (even if
> > we don't care about those at the moment)?
> 
> Yes, what defines a docg3 is :
>  - a device mapped at address 0
>  - a read of the chip id gives DOC_CHIPID_G3
> 
> But there is a catch : the read is not a simple memory read, it's a write to a
> register to set the "register to read", then a read in the iospace. Doing this
> implies you know you are in the iospace of a docg3 ...

I was more concerned with the identifying information that we can
acquire from the device than the precise sequence of steps that have to
be performed to extract that information.

You mention that the size of the flash is variable (it could be 64MB,
256MB, etc), but this isn't described in the binding. Therefore I assume
there is some mechanism by which I can query this from the device?

Are there other parameters that vary across instances? Even those for
which we currently don't care? If so, can these be queried from the
device?

> >
> >> +
> >> +Required properties:
> >> + - compatible: Should be "sandisk,docg3"
> >> + - reg: register base and size
> >> +
> >> +Example:
> >> +	docg3 {
> >> +		compatible = "sandisk,docg3";
> >> +		reg = <0x0 0x2000>;
> >
> > There should be a unit-address on the node to match the address in the
> > first reg entry.
> You mean "#address-cells = <1>;", right ?

No, the unit-address is the bit after the '@' on the node name. I'm
asking for:

docg3: flash@0 {
	...
	reg = <0x0 0x2000>;
	...
};

Thanks,
Mark.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
