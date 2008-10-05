From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree for c67x00
Date: Sat, 4 Oct 2008 23:58:01 -0600
Message-ID: <20081005055800.GA14172@secretlab.ca>
References: <20080926230904.3E572C60081@mail63-dub.bigfish.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080926230904.3E572C60081-elvp7KehBMsEb1aXSZwOPPYhGscHeamf@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, git-dev <git-dev-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Walter Tomkoski <waltert-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Jim Hwang <jhwang-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

(added devicetree-discuss mailing list to cc: list since some of the
content is relevant to current discussions about device tree syntax.)

On Fri, Sep 26, 2008 at 04:09:01PM -0700, Stephen Neuendorffer wrote:
> 
> Below is an fdt patch for the cypress USB.  It generates fragments like:
> 
>                 ext_usb: xps-epc@85000000 {
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>                         compatible = "xlnx,compound";
>                         ranges = < 0x85000000 0x85000000 0x10000 >;

Aside: Considering that this is a 1:1 mapping, you could just specify
"ranges;" here instead...  Of course, since the epc devices really are
bridges, it probably is appropriate for ranges to be explicit.

However, since the epc devices have multiple chip selects, it might be
better to use #address-cells = <2> and encode the chip select in the
first address cell.  Then ranges would look something like this:
	ranges = < 0 0 0x85000000 0x10000 >; (CS0, offset 0)

Additional chip selects would add additional tuples to the ranges
property:
	ranges = < 0 0 0x85000000 0x10000    (CS0, offset 0)
	           1 0 0x86000000 0x10000 >; (CS1, offset 0)

and the reg property for the c67x00 would be:
	reg = <0 0 0x10000>;

This scheme would be an accurate representation of what the FPGA design
is actually doing.

>                         usb@85000000 {
>                                 compatible = "cypress,c67x00";
>                                 reg = < 0x85000000 0x10000 >;
>                         } ;
>                 } ;
> 
> Assuming, of course, that we connect through the epc core.
> There are two pieces of trickiness:
> 
> 1) How do we know that the epc connects to a cypress chip outside of the
> FPGA.  This needs to be encoded in the EDK project somehow..  We have
> the same problem with FLASH.

This is a major use-case for the new syntax being discussed to add to dtc.
Specifically being able to include one file into another.  It would be
desirable for EDK to generate a base layout that describes the FPGA
design, and then have a board file that includes the generated file and
adds the nodes/properties that are board, not FPGA, specific.

I'll try to write up some specific use cases that would help in
evaluating new dts syntax.  (Jon, David; I can't help much with the dtc
code, but I can at least provide my impressions from the user side of
the equation).

> 2) There is also an external interrupt line, but the interrupt line
> doesn't connect through the core.  Presumably, we need someway of
> representing this association in the EDK project as well..

Ditto for this.

> In both cases, this information could be neatly stored in a hierarchical
> design, that described what was inside the FPGA *AND* what was outside,
> but today, we'll just have to hack something in...  Any suggestions?
