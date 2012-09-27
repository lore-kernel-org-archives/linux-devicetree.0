From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 06/18] tegra: fdt: Add LCD definitions for
	Tegra
Date: Thu, 27 Sep 2012 13:27:05 -0700
Message-ID: <CAPnjgZ2R=G=xmjdoP74JeAknwH9QGx8+mED7TQ8Kd_zEmcVwtQ@mail.gmail.com>
References: <1342106718-3058-1-git-send-email-sjg@chromium.org>
	<1342106718-3058-7-git-send-email-sjg@chromium.org>
	<CAPnjgZ2SbVVKxUdW1cvLf_9rAWLWeiVr-y6S_sz-Uw5_O_AyQA@mail.gmail.com>
	<501803F3.6090803@wwwdotorg.org>
	<CAPnjgZ2NAf4PF0_U9hQeJzpdL87ZNq+WpxsbFJQHbh4rY2MoEg@mail.gmail.com>
	<50647594.9060404@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <50647594.9060404@wwwdotorg.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Stephen Warren <swarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Thu, Sep 27, 2012 at 8:49 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 09/27/2012 07:58 AM, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Tue, Jul 31, 2012 at 9:12 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>> On 07/31/2012 03:27 AM, Simon Glass wrote:
>>>> On Thu, Jul 12, 2012 at 4:25 PM, Simon Glass <sjg@chromium.org> wrote:
>>>>> Add LCD definitions and also a proposed binding for LCD displays.
>>>>>
>>>>> The PWM is as per what will likely be committed to linux-next soon.
>>>>>
>>>>> The displaymode binding comes from a proposal here:
>>>>>
>>>>> http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
>>>>>
>>>>> The panel binding is new, and fills a need to specify the panel
>>>>> timings and other tegra-specific information. Should a binding appear
>>>>> that allows the pwm to handle this automatically, we can revisit
>>>>> this.
>>>>
>>>> Any comments on this binding please? The main addition from Thierry's
>>>> one posted on LMKL is the LCD resolution selection.
>>>
>>> I have some concerns about the way the mode is represented in the
>>> binding; the timing parameters are quite different to how e.g. an EDID
>>> DTD would represent them, which I think will lead to conversion mistakes
>>> when writing the DT.
>>>
>>> I'm trying to get along of Sascha's original email so I can join in on
>>> that discussion.
>>
>> Did you get any resolution here?
>
> I think an updated version of those patches was published.
>
>>>>> diff --git a/doc/device-tree-bindings/video/tegra20-dc.txt b/doc/device-tree-bindings/video/tegra20-dc.txt
>>>
>>>>> +Optional properties (rgb):
>>>>> + - nvidia,frame-buffer: address of frame buffer (if omitted it will be
>>>>> +               calculated)
>>>>> +       - This may be useful to share an address between U-Boot and Linux and
>>>>> +               avoid boot-time corruption / flicker
>>>
>>> Why can't the display driver read this out of the display registers,
>>> instead of requiring the same information to be passed using DT too?
>>
>> The U-Boot display driver needs to set this value in the display
>> registers - at reset I don't think we can rely on any particular
>> value.
>>
>> Do you mean the kernel display driver?
>
> Yes.
>
>> Well it could, but it doesn't.
>
> Well, there is no display driver in the upstream kernel at the moment,
> so it's not possible to make assertions about what it does or not.
>
> Any downstream kernels aren't relevant, since their DT bindings and/or
> behaviour have not been through public review.

OK, but typically the kernel selects its own address for the display.
It might be quite hard for the kernel to use the one defined by
U-Boot.

>
>> Really this is just a way of getting U-Boot and Linux to agree on the
>> address, by having U-Boot know the address that the kernel will happen
>> to use. It isn't very robust, but we have found it useful as a means
>> of avoiding problems in this area.
>
> Right, but again, why can't the display driver simply read the address
> out of the register; why is there a need to duplicate the data?
>
> I guess one possibility is that the register only gives the base address
> and not the size/mode of the allocated surface, but I don't recall if
> this proposed binding did that either?

So here is my explanation:

1. U-Boot would normally put the display right near the top of memory.
Instead, it figures out where the kernel will put it (somehow this
seems to often be at a fixed address) and uses that address.

2. That means that U-Boot will now have the display exactly where the
kernel wants it.

3. When U-Boot boots the kernel, it leaves the display running,
knowing that the kernel will not overwrite the frame buffer with its
own code / data.

4. The effect is that there is a seamless display transition from
U-Boot to the kernel.

Note this is only a hint - it can be omitted i.w.c. it isn't used.

So what do you think? Should we remove this entirely, or is it a useful hack?

Regards,
Simon
