From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] mpc85xx_edac: change to use new definitions for PCI
	EDAC regspace
Date: Fri, 23 Jul 2010 18:56:49 -0600
Message-ID: <AANLkTinKVet56HEnirf_Q5bbjT1a-D+mb6XoPNW3ZMTp@mail.gmail.com>
References: <1279756992-29543-1-git-send-email-dbaryshkov@gmail.com>
	<1279756992-29543-2-git-send-email-dbaryshkov@gmail.com>
	<566EC982-1CDA-4806-8EC0-8C9F36448F83@kernel.crashing.org>
	<AANLkTim7kbHsouc==7gRAuRO6AYMNVdA4yyPFpRBC+QR@mail.gmail.com>
	<AANLkTimsKcn3n90cyqQTQ4Ycy2dlsHdi7afeiNX4M0v5@mail.gmail.com>
	<AANLkTik-3cujkh774H6WQB8sHD+gkKLT2FQp=8HYaWBt@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTik-3cujkh774H6WQB8sHD+gkKLT2FQp=8HYaWBt-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, bluesmoke-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 23, 2010 at 6:20 PM, Dmitry Eremin-Solenikov
<dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> On 7/22/10, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> On Thu, Jul 22, 2010 at 10:48 AM, Dmitry Eremin-Solenikov
>> <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Hello,
>>>
>>> On Thu, Jul 22, 2010 at 7:38 PM, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>>> wrote:
>>>>
>>>> On Jul 21, 2010, at 7:03 PM, Dmitry Eremin-Solenikov wrote:
>>>>
>>>>> Currently (as mpc8540-pci) devices are not created on of_platform bus,
>>>>> mpc85xx_edac can't probe to them. Follow the change to dts trees to b=
ind
>>>>> not to the main mpc8540-pci node but to special mpc85xx-pci-error nod=
es,
>>>>> present on soc bus.
>>>>>
>>>>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>> ---
>>>>> drivers/edac/mpc85xx_edac.c | =A0 18 +++++++++---------
>>>>> 1 files changed, 9 insertions(+), 9 deletions(-)
>>>>
>>>> Nak.
>>>>
>>>> We already have a node in the dts for the PCI controller. =A0Lets upda=
te
>>>> the platform code to add the pci controller to the of_platform_bus_pro=
be
>>>> list.
>>>
>>> I've had that idea. However it's really look strange to me to call
>>> of_platform_bus_probe() on the bus node, for which we (IMO) explicitly
>>> won't like for
>>> child devices (PCI devices) to be added to of_platform bus. Would it
>>> be suitable to just call of_platform_device_create for it (Or do i
>>> miss someth<ing)?
>>
>> Try the attached patch (lightly tested). =A0If it works for you then
>> I'll post it for wider review.
>
> Yes, this patch worked for me. However it looks a bit like a hack for me.

I'll probably refine it a bit before merging, but I don't think it is
a hack.  It reflects the behaviour that makes sense when registering
devices hanging off the root node.  If a device node is a child of the
root, then we know it isn't hanging off an i2c or pci bus, or anything
else.  It is essentially a system device.

The troublesome bit is that the root node also has memory, cpus,
chosen and aliases nodes which are not devices.  In the vast majority
of cases, we want all the device nodes that are children of the root
to be registered, but we don't want to register the special nodes.
Checking for the presence of a compatible property is a pretty good
test for determining whether or not a node actually represents a
device, especially because all users of of_platform_bus_probe() seem
to be FDT users where we've been very strict about enforcing that
drivers must use the compatible property for matching to device nodes.

Cheers,
g.
