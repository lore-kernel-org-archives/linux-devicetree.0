From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] MPIC Bindings and Bindings for AMP Systems
Date: Fri, 7 Jan 2011 08:48:04 -0700
Message-ID: <AANLkTikROM4MtmLYEK_6ndRzbDJ3xjMM5iSPzDhpRWLy@mail.gmail.com>
References: <4D12F171.7010103@mentor.com>
	<20101223185623.GA20384@angua.secretlab.ca>
	<4D13C402.2090209@mentor.com>
	<20101223223325.GK20384@angua.secretlab.ca>
	<20110103135120.32aeb60d@udp111988uds.am.freescale.net>
	<4D24E99F.90908@mentor.com>
	<20110105160918.2b530fea@udp111988uds.am.freescale.net>
	<DD7A9A95166BF4418C4C1EB2033B6EE2038FA8E4@na3-mail.mgc.mentorg.com>
	<20110105170725.1a82c5a6@udp111988uds.am.freescale.net>
	<DD7A9A95166BF4418C4C1EB2033B6EE2038FA8FD@na3-mail.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <DD7A9A95166BF4418C4C1EB2033B6EE2038FA8FD-1KJr3DFo5IITHwIYFunNKKbYDNqAj0Ws@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Blanchard, Hollis" <Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Inge,
	Meador" <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 6, 2011 at 2:52 PM, Blanchard, Hollis
<Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
> On 01/05/2011 03:07 PM, Scott Wood wrote:
>> On Wed, 5 Jan 2011 14:49:40 -0800
>> "Blanchard, Hollis"<Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> =A0wrote:
>>
>>> On 01/05/2011 02:09 PM, Scott Wood wrote:
>>>> On Wed, 5 Jan 2011 15:58:55 -0600
>>>> Meador Inge<meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> =A0 wrote:
>>>>
>>>>> We need some sort of mapping between a message register and a message
>>>>> register number so that the message registers can be referenced throu=
gh
>>>>> some sort of API (e.g. 'mpic_msgr_read(0)'). =A0One way to do that wo=
uld
>>>>> be by putting an order on the registers. =A0Maybe there is a better w=
ay,
>>>>> though ...
>>>> A message register is uniquely identified by a reference to the device
>>>> tree node, plus a 0-3 index into that node's message registers.
>>> Really what we're talking about is software configuration, not hardware
>>> description.
>> Part of that software configuration involves identifying the hardware
>> being referenced.
>>
>>> We've gone back and forth on representing this information
>>> in the device tree, and most recently decided against it. Outside the
>>> kernel, a device node reference isn't really practical.
>> Global enumeration isn't much fun either. =A0For something like this
>> where it's very unlikely that additional MPIC message units will be
>> added to the system dynamically, it's managable, but it's not a good
>> habit to get into. =A0Look at the pain that's been caused by such
>> assumptions in the i2c subsystem, in kernel interrupt management, etc.
>>
>> A reference to a node is just a pointer to a software message driver
>> object, which can be obtained from looking up an alias. =A0It's a little
>> less simple than just using a number, but it's not impractical. It also
>> provides a natural place to put a layer of indirection in the code that
>> isolates the upper-layer protocol from the details of what sort of
>> message transport it is using.
>>
>> Now, if you don't care about this, and want to just use numbers in your
>> application, go ahead. =A0But I don't think that such an assumption
>> should go into the device tree binding. =A0Have the software number the
>> message register banks in increasing physical address order, or based
>> on numbered aliases similar to how U-Boot enumerates ethernet nodes, or
>> something similar.
> Using physical addresses doesn't solve the enumeration problem either,
> but I think it's beside the point: userspace must refer to the device.
> There is a rich history of userspace *not* walking /proc/device-tree in
> order to refer to a physical device. Are you suggesting this case is
> special?

Actually, for a while now the kernel has been moving towards userspace
being responsible for device identification.  That's what udev is for.
 The kernel udev looks at the available information when a device is
registered/bound, and it creates useful symlinks to the dynamically
assigned major/minor devices.  The rest of userspace doesn't need to
know about it; it can simply use the symlinks in /dev, but it is
appropriate to let udev figure out the correct naming.

Also, if you want to do global enumeration of devices, the accepted
way to do so is to use properties in the /aliases node in the form:
'<type><number> =3D "/path/to/device/node";'

g.
