From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Thu, 04 Jul 2013 11:10:35 +0200
Message-ID: <51D53C0B.6060106@gmail.com>
References: <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk> <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <20130703095248.GG13924@flint.arm.linux.org.uk>
 <20130704083307.GH10414@pengutronix.de> <51D53634.5040405@gmail.com>
 <20130704085313.GY516@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130704085313.GY516-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/04/13 10:53, Sascha Hauer wrote:
> On Thu, Jul 04, 2013 at 10:45:40AM +0200, Sebastian Hesselbarth wrote:
>> On 07/04/13 10:33, Sascha Hauer wrote:
>>>
>>> A componentized device never completes and it doesn't have to. A
>>> componentized device can start once there is a path from an input
>>> (crtc, i2s unit) to an output (connector, speaker).
>>>
>>> Consider what happens with a supernode approach. Your board provides a
>>> devicetree which has a supernode with hdmi and lvds referenced. Now you
>>> build a kernel with the hdmi driver disabled. You would still expect the
>>> lvds port to be working without having the kernel wait for the supernode
>>> being complete.
>>>
>>> Without supernode you can just start once you have everything between
>>> the crtc and lvds nodes. If later a hdmi device joins in then you can
>>> either notify the users (provided the DRM/KMS API supports it) or just
>>> ignore it until the DRM device gets reopened.
>>
>> Sascha,
>>
>> that is what it is all about. You assume you a priori know what devices
>> will be required for the componentized device to successfully output
>> a video stream.
>>
>> We have shown setups where you don't know what is required. Cubox
>> _needs_ lcd0 and hdmi-transmitter,
>
> Then your Cubox devicetree has a link (that's how they call it in v4l2,
> a link doesn't necessarily is a direct connection but can have multiple
> devices in it) between lcd0 and hdmi.

I haven't looked up v4l2 "link" yet. But (a) if it is a separate node
how is that different from the "super-node" we are talking about or (b)
if it is a property, where do you put it?

>>   olpc just needs lcd0 and has built-in hdmi in the SoC (IIRC).
>
> And olpc has a link with lcd0 as the source and the builtin hdmi.

Sure, as my DT proposal that Inki shamelessly copied, has a "link"
property for lcd0 on Cubox, while OPLC's lcd0 hasn't.

>> The driver needs to know what to wait for, and that is given by the DT super-node.
>
> You need a source (described in the devicetree), a sink (also described
> in the devicetree) and a link between them, nothing more.

What if you need source-to-multi-sink or source-to-transceiver-to-sink?
The DT proposal I have given, is source-to-sink on a per device node
basis. If you don't like OPLC's lcd0 having no "link" while Cubox' lcd0
has, put a fake node for the possibly connected HDMI monitor in there.
ASoC does that for SPDIF jack by also having a "codecs" driver although
there is nothing to control.

>> I consider kernels with missing drivers compared to what is given in
>> the DT as broken setup.
>
> What if your devicetree describes components not yet in mainline. Would
> you consider mainline kernels broken then?

No. But I do not 1:1 match device tree nodes with subsystem drivers.
The devices are there, there is no driver.

Currently, for CuBox DT, video _is_ broken because there is no way to
represent the way lcd0, hdmi-transmitter, and pll are connected to form
a single video card. All separate drivers exist, you may be lucky to get
video out of the CuBox because of some reset values that allow you to
get it by coincidence. But as soon as you try the very same kernel on a
different board, your experience will change quickly.

Sebastian
