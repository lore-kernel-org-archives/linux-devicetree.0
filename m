From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Thu, 25 Mar 2010 14:53:56 -0500
Message-ID: <4BABBF54.3010104@freescale.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
	<4BAA4C8A.70104@freescale.com>
	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
	<4BAB7E67.6040707@freescale.com> <4BAB816F.5060405@firmworks.com>
	<fa686aa41003250916t3d0839e5m42d7f7f6540e821a@mail.gmail.com>
	<4BAB9120.1060600@freescale.com>
	<fa686aa41003250959v401d14e0g151aa54a57eea39@mail.gmail.com>
	<4BAB9755.2080408@freescale.com>
	<fa686aa41003251035h3574a2bahce183ca6056e5f7e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41003251035h3574a2bahce183ca6056e5f7e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> On Thu, Mar 25, 2010 at 11:03 AM, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> Grant Likely wrote:
>>> For indirect firmware, create a /chosen/firmware node.  Don't add a
>>> compatible property,
>> Oh, I don't like that idea at all.  The compatible property is useful for me to know *how* to parse the binary blob.
> 
> Compatible is for devices.

Compatible is for matching.  Who cares what category the thing being 
matched is in?  What is the definition of a device, and why does it matter?

> This is not a device.  Drivers cannot bind
> against it.  Use a different mechanism if you have metadata about the
> blob.  If your driver doesn't know how to validate its own firmware
> blobs, then you've got bigger problems.

One could also say, if your hardware can't be probed at runtime, you've 
got bigger problems. :-)

What's wrong with an indication of what type of "thing" a node is 
supposed to be?  There could be multiple microcode formats, for example.

I don't know that it's strictly necessary in this case --  it looks like 
there is a magic number in the firmware blob -- but I don't understand 
the objection as a matter of principle.  These device tree discussions 
have a tendency to get awfully bikesheddy.

>>>  Put each firmware blob into a separate property, and make
>>> the names reasonable (ie. mpc<blah>-qe-firmware).  Have the QE
>>> reference the firmware blob by property name.
>> I don't like the idea of using the property name as a pseudo-compatible string.
> 
> It's a name, not a pseudo compatible string, and your device node will
> explicitly reference it by name.  There is not backwards compatibility
> or fuzzy binding issues at play here.

There is a forward compatibility issue, in that we'll have to update the 
code with every new mpc<blah> (or p<blah>rev<n>) that comes along.

Or are we supposed to pick some random chip to request the firmware for, 
like with compatibles?  What would be the point?  This isn't being used 
to bind a driver.

> It is a way for your driver
> node to state, "I want *that exact* firmware blob".

The driver wants the firmware blob that the device tree provides.  The 
device tree knows better than the driver, being that the device tree is 
the describer of the hardware.

> You could make
> the property name "george" 

If "george" is fine, then so is "fsl,firmware".  Maybe "fsl,qe-firmware".

> and it would still be completely clear (if
> a little weird) because all the references are contained within the
> tree.

How are the references contained within the tree?  The driver has to 
know which property to read.

-Scott
