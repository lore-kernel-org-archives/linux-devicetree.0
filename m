From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 06/18] tegra: fdt: Add LCD definitions for Tegra
Date: Thu, 27 Sep 2012 17:21:23 -0600
Message-ID: <5064DF73.8000006@wwwdotorg.org>
References: <1342106718-3058-1-git-send-email-sjg@chromium.org>
 <1342106718-3058-7-git-send-email-sjg@chromium.org>
 <CAPnjgZ2SbVVKxUdW1cvLf_9rAWLWeiVr-y6S_sz-Uw5_O_AyQA@mail.gmail.com>
 <501803F3.6090803@wwwdotorg.org>
 <CAPnjgZ2NAf4PF0_U9hQeJzpdL87ZNq+WpxsbFJQHbh4rY2MoEg@mail.gmail.com>
 <50647594.9060404@wwwdotorg.org>
 <CAPnjgZ2R=G=xmjdoP74JeAknwH9QGx8+mED7TQ8Kd_zEmcVwtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ2R=G=xmjdoP74JeAknwH9QGx8+mED7TQ8Kd_zEmcVwtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/27/2012 02:27 PM, Simon Glass wrote:
> On Thu, Sep 27, 2012 at 8:49 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 09/27/2012 07:58 AM, Simon Glass wrote:
...
>>> Really this is just a way of getting U-Boot and Linux to agree on the
>>> address, by having U-Boot know the address that the kernel will happen
>>> to use. It isn't very robust, but we have found it useful as a means
>>> of avoiding problems in this area.
>>
>> Right, but again, why can't the display driver simply read the address
>> out of the register; why is there a need to duplicate the data?
>>
>> I guess one possibility is that the register only gives the base address
>> and not the size/mode of the allocated surface, but I don't recall if
>> this proposed binding did that either?
> 
> So here is my explanation:
> 
> 1. U-Boot would normally put the display right near the top of memory.
> Instead, it figures out where the kernel will put it (somehow this
> seems to often be at a fixed address) and uses that address.
> 
> 2. That means that U-Boot will now have the display exactly where the
> kernel wants it.

Oh, the DT property is telling U-Boot where to put the surface so that
when the kernel determines where to put it, it'll already be there?

That seems completely backwards. It's also extremely fragile; what if
the kernel suddenly starts allocating at some other random address,
which stops matching what U-Boot expects?

Far better would be for U-Boot to put the surface wherever it wants,
then manipulate the DT that's passed to the kernel to:

a) Add a /memreserve/ so that memory doesn't get re-used for anything
else during boot.

b) Add a property to the display node indicating which memreserve
represents the frame-buffer location.

When the kernel boots, it can:

* Copy the content from the U-Boot-allocated buffer to whatever display
buffer the kernel allocated before writing the new address to the HW.

* Undo the memory reservation triggered by the /memreserve/ to allow the
memory to be re-used.

> So what do you think? Should we remove this entirely, or is it a useful hack?

Yes, I think in its current form, it isn't useful.
