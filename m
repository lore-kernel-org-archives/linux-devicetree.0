From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: The usage of compatible 'simple-bus'
Date: Mon, 5 Jan 2009 23:35:38 -0700
Message-ID: <fa686aa40901052235t1342b6e2w4fde664f1ebb3aa3@mail.gmail.com>
References: <3A45394FD742FA419B760BB8D398F9ED0B37E7@zch01exm26.fsl.freescale.net>
	<20090105192053.GB23766@ld0162-tx32.am.freescale.net>
	<20090106014323.GB29456@yookeroo.seuss>
	<3A45394FD742FA419B760BB8D398F9ED0B38C9@zch01exm26.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <3A45394FD742FA419B760BB8D398F9ED0B38C9-bKEhWGtIRUJ4Lp7cDGe+DVjVikpgYyvb5NbjCUgZEJk@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Li Yang <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 5, 2009 at 10:46 PM, Li Yang <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> -----Original Message-----
>> From:
>> devicetree-discuss-bounces+leoli=freescale.com-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
>> [mailto:devicetree-discuss-bounces+leoli=freescale.com@ozlabs.
>> org] On Behalf Of David Gibson
>> Sent: Tuesday, January 06, 2009 9:43 AM
>> To: Wood Scott-B07421
>> Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org; Li Yang-R58472;
>> devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
>> Subject: Re: The usage of compatible 'simple-bus'
>>
>> On Mon, Jan 05, 2009 at 01:20:53PM -0600, Scott Wood wrote:
>> > On Mon, Jan 05, 2009 at 06:27:39PM +0800, Li Yang wrote:
>> > > I got an assumption from the existing device trees that having
>> > > 'simple-bus' in the compatible property of a node means that all
>> > > child nodes should be added as of_platform_device in platform
>> > > initialization phase.  No matter it represents a bus in
>> common sense
>> > > or not.  Is this truly the case?
>> >
>> > Yes, simple-bus indicates that the children can be driven
>> standalone
>> > from any knowledge of the parent bus.
>>
>> Erm, well, sort of.  Strictly it indicates that the only way
>> to locate the child devices of this bus is by using the
>> address information in the device tree - there's no way to
>> dynamically probe the bus.
>
> So if I understand correctly, "simple-bus" is intended to be used for
> true buses.
>
>>
>> The fact that this causes of_platform_devices to be
>> instantiated is a Linux implementation specific detail (and
>> one we might change in future).
>
> Here we have a common case for SoC that part of a device has its
> separate driver besides the driver for the main feature of the whole
> device.  The resources used by the sub-device is usually part of the
> resources of the parent device.  So it makes sense to put the node of
> sub-device beneathe the node of main device.

First, repeat the following to yourself 10 times: "The device tree
describes the hardware; not the way Linux uses it".

Avoid thinking about how the of_platform bus works for a minute and
ask yourself this question.  If you're talking about several devices
which share the same set of resources; then are they really separate
devices, or is it a single device with more than one channel or slice?

If it is really just a single device, then I would avoid adding a
separate compatible value to each sub node and define the device
binding against the parent node compatible value and specify in the
binding documentation that the node needs to have one or more child
nodes to describe the channels.

If it is really multiple devices which share limited resources; then
it is fine for each sub node to have a compatible property; and the
binding documentation for that sub node must state that the parent
node describes the shared resources for the set.

In your specific case, you happen to have 2 drivers; but that is a
Linux internal implementation detail.  The driver that binds against
the parent node can just as easily instantiate the sub-device devices
instead of using the of_platform infrastructure.  In fact, it may even
be better if it does so; but this is not the kind of information that
you try to describe in the device tree.

Once again; describe the hardware; not the way Linux uses it.

> Shall we have a convention
> to mark such devices in device tree so that the sub-device can be
> scanned and probed as a standalone of_platform_device?

No.  Instead, document the binding; what properties it expects and
what it means.  So; if you want to give the child nodes a 'compatible'
value, then document what describes.  If you give the parent node a
compatible value, then in the same way document what it means.  Only
use simple-bus if it really is a simple bus translation to a child
node.

Then, adapt Linux to do what it must to bind a driver to the device.
One option is for the parent node driver to instantiate the child node
device.  Another is to explicitly add the parent node compatible
property to the list of probable of_platform busses in the board setup
code.

> If "simple-bus" may cause confusion to do this job as it's not a bus
> actually, I propose to use "has-subdevice".

It seems to me like the meaning of 'has-subdevice' will end up being
very open to interpretation and thus result in confusion and odd
workarounds in the future.  I don't think this is a very good idea.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
