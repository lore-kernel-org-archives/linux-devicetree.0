From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 06/18] tegra: fdt: Add LCD definitions for
	Tegra
Date: Thu, 27 Sep 2012 16:37:41 -0700
Message-ID: <CAPnjgZ3JuE_jiSRGW6o3eCbp4cLCf1uenKz4kPCpfqLJ3Mdmjw@mail.gmail.com>
References: <1342106718-3058-1-git-send-email-sjg@chromium.org>
	<1342106718-3058-7-git-send-email-sjg@chromium.org>
	<CAPnjgZ2SbVVKxUdW1cvLf_9rAWLWeiVr-y6S_sz-Uw5_O_AyQA@mail.gmail.com>
	<501803F3.6090803@wwwdotorg.org>
	<CAPnjgZ2NAf4PF0_U9hQeJzpdL87ZNq+WpxsbFJQHbh4rY2MoEg@mail.gmail.com>
	<50647594.9060404@wwwdotorg.org>
	<CAPnjgZ2R=G=xmjdoP74JeAknwH9QGx8+mED7TQ8Kd_zEmcVwtQ@mail.gmail.com>
	<5064DF73.8000006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <5064DF73.8000006@wwwdotorg.org>
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

On Thu, Sep 27, 2012 at 4:21 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 09/27/2012 02:27 PM, Simon Glass wrote:
>> On Thu, Sep 27, 2012 at 8:49 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>> On 09/27/2012 07:58 AM, Simon Glass wrote:
> ...
>>>> Really this is just a way of getting U-Boot and Linux to agree on the
>>>> address, by having U-Boot know the address that the kernel will happen
>>>> to use. It isn't very robust, but we have found it useful as a means
>>>> of avoiding problems in this area.
>>>
>>> Right, but again, why can't the display driver simply read the address
>>> out of the register; why is there a need to duplicate the data?
>>>
>>> I guess one possibility is that the register only gives the base address
>>> and not the size/mode of the allocated surface, but I don't recall if
>>> this proposed binding did that either?
>>
>> So here is my explanation:
>>
>> 1. U-Boot would normally put the display right near the top of memory.
>> Instead, it figures out where the kernel will put it (somehow this
>> seems to often be at a fixed address) and uses that address.
>>
>> 2. That means that U-Boot will now have the display exactly where the
>> kernel wants it.
>
> Oh, the DT property is telling U-Boot where to put the surface so that
> when the kernel determines where to put it, it'll already be there?
>
> That seems completely backwards. It's also extremely fragile; what if
> the kernel suddenly starts allocating at some other random address,
> which stops matching what U-Boot expects?

The screen will flicker, or may fill up with junk as the kernel boots.
We did have that happen once when the driver changed.

>
> Far better would be for U-Boot to put the surface wherever it wants,
> then manipulate the DT that's passed to the kernel to:
>
> a) Add a /memreserve/ so that memory doesn't get re-used for anything
> else during boot.
>
> b) Add a property to the display node indicating which memreserve
> represents the frame-buffer location.

Yes, I believe the Tegra video driver we used (and I take your point
that it doesn't exist upstream so there is no point in discussing it
:-) always had to use the same frame buffer address. The memory was
statically allocated. Certainly this could be encoded in the fdt.

>
> When the kernel boots, it can:
>
> * Copy the content from the U-Boot-allocated buffer to whatever display
> buffer the kernel allocated before writing the new address to the HW.
>
> * Undo the memory reservation triggered by the /memreserve/ to allow the
> memory to be re-used.
>
>> So what do you think? Should we remove this entirely, or is it a useful hack?
>
> Yes, I think in its current form, it isn't useful.

Thanks for the thorough response. Let's remove it, particularly as
there isn't even a kernel driver upstream yet.

I will do that before sending out the LCD v4 series. Thanks for your
timely comments.

Regards,
Simon
