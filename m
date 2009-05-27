From: Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 22:32:33 +0100
Message-ID: <h4o0f6-k5o.ln1@woodchuck.wormnet.eu>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
	<ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<20090527150527.GK6805@pengutronix.de>
	<fa686aa40905270839m375bbdacqb1acb1be0a2d2da0@mail.gmail.com>
	<2ve0f6-8fn.ln1@woodchuck.wormnet.eu>
	<fa686aa40905271346l737cb0e5x7d62c581b40c2d4c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

In gmane.linux.kernel Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Wed, May 27, 2009 at 12:56 PM, Alexander Clouter <alex-L4GPcECwBoDe9xe1eoZjHA@public.gmane.org> =
wrote:
>> In gmane.linux.kernel Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>>> On Wed, May 27, 2009 at 9:05 AM, Robert Schwebel
>>>
>>> [snipped]
>>>
>> Although I have no input of value here, I'm hoping I do not become the
>> next posterchild for "pain++".
>>
>> I'm working through redo'ing the FPGA support in the TS-7800[1] into a
>> new bus rather than just continuing the messy direction I have been
>> going to date[2].
>>
>> My current approach is that the bus handles the 'hotplug'ing of the FPGA
>> bitstream by unregistering all the devices and then when it's informed
>> the new bitstream is ready it prods all the registered drivers if any
>> devices need bringing up (obviously drivers can be modprobe'd as and
>> when).
>>
>> The 'magic' is that the FPGA code has some special value[3] that what it
>> is and the drivers (outside the platform code) have a list of FPGA magic
>> values (with a mask) that they are willing to service. =A0The *bus*
>> (platform code) is what installs the devices effectively and only does
>> so if the loaded driver says it can drive a particular loaded bitstream
>> (in the bus driver struct is a array of ID's it checks).
>>
>> Does this sound sane? =A0Is it an approach that could be ACKed one day?
>> Currently the bit that might be considered sinful is there is for some
>> of the drivers (rtc-m48t86, timeriomem-rng and plat_nand) the FPGA bus
>> 'driver' is a light wrapper around the platform device driver. =A0This is
>> so that the hooks still exist so the bus know what to load and unload as
>> and when.
> =

> Personally, I'd not write a separate bus.  I'd write a platform driver
> which turns around and registers more platform devices with the
> original device as the parent in the _probe routine, and unregisters
> them in _remove.  Should have the same affect with less complex code.
> However, someone with more device-model-foo may have better advice.
> =

That's a thought, but this 'bus' does not just drive platform devices, =

there are other drivers that will live outside the scope.

I have a half completed GPIO expander for the 'factory' FPGA bitstream =

that could not be done as a platform device.  The GPIO pin's also =

multiplex as an ISA (PC/104) bus and chip select's a SPI bus too.

Another driver is a DMA engine provisioned by the factory bitstream too =

as well as AVR+ADC+watchdog system too.

What would make sense for this approach would be if it was to drive =

bit's from the opencores.org website.

Because there is a mix of platform devices and 'awkward' bit's, this is =

why I was thinking about a seperate bus.

Cheers for the suggestion, it's got me thinkingthat there still has to =

be a better way :)

Cheers

-- =

Alexander Clouter
.sigmonster says: Who goeth a-borrowing goeth a-sorrowing.
