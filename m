From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 09/17] tegra: usb: fdt: Add additional device tree
 definitions for USB ports
Date: Mon, 12 Dec 2011 11:13:04 -0700
Message-ID: <4EE64430.5070508@nvidia.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>	<1322878300-5551-10-git-send-email-sjg@chromium.org>	<4EDD52D4.7090906@nvidia.com>	<CAPnjgZ1J_cOS_E+ZiDoZUh79V7LUFzVkx-0nhbPTDwuGCGvDnQ@mail.gmail.com>	<4EDE7B06.7060401@nvidia.com>	<CAPnjgZ035Cen11ObFXjKUCqypvVKzkewhfY2F=yGH8=RWxVuSA@mail.gmail.com>	<4EDFF898.1070708@nvidia.com>
 <CAPnjgZ1adfU652Z2ob30GTWZiCnah4WsJNfVrroWvtM5LXW93Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ1adfU652Z2ob30GTWZiCnah4WsJNfVrroWvtM5LXW93Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/08/2011 02:10 PM, Simon Glass wrote:
> Hi Stephen,
> 
> On Wed, Dec 7, 2011 at 3:36 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 12/06/2011 02:09 PM, Simon Glass wrote:
>>> On Tue, Dec 6, 2011 at 12:28 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>> On 12/05/2011 05:55 PM, Simon Glass wrote:
>>>>> On Mon, Dec 5, 2011 at 3:25 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>>>>> On 12/02/2011 07:11 PM, Simon Glass wrote:
>>>>>>> This adds peripheral IDs and timing information to the USB part of the
>>>>>>> device tree for U-Boot.
>>>>>>>
>>>>>>> The peripheral IDs provide easy access to clock registers. We will likely
>>>>>>> remove this in favor of a full clock tree when it is available in the
>>>>>>> kernel (but probably still retain the peripheral ID, just move it into
>>>>>>> a clock node).
>>>>>>>
>>>>>>> The USB timing information does apparently vary between boards sometimes,
>>>>>>> so is include in the fdt for convenience.
>>
>>>>>>>       usb@c5000000 {
>>>>>>>               compatible = "nvidia,tegra20-ehci", "usb-ehci";
>>>>>>>               reg = <0xc5000000 0x4000>;
>>>>>>>               interrupts = < 52 >;
>>>>>>>               phy_type = "utmi";
>>>>>>> +             periph-id = <22>;       // PERIPH_ID_USBD
>>>>>>
>>>>>> Given this is a temporary U-Boot-specific solution, can the property be
>>>>>> named u-boot,periph-id so it's obvious that when writing a .dts for the
>>>>>> kernel only, you don't care about this value.
>>>>>
>>>>> ok. I suggest the kernel does something similar.
>>>>
>>>> The kernel will use the standardized clock bindings once they're ready
>>>> and we convert Tegra over to use them. The kernel is extremely unlikely
>>>> to ever use "periph-id" or "u-boot,periph-id".
>>>
>>> What is the time frame on this working be completed and merged?
>>
>> Sorry, I have no idea. I've been focusing on other subsystems (pinmux,
>> audio) and haven't been following the clock stuff at all. Hopefully
>> someone will start driving Tegra kernel towards common clock soon, but I
>> don't think exactly who and when has been nailed down yet.
>>
>>>> Right now, the kernel's clock driver contains a mapping table from
>>>> device name (e.g. tegra-ehci.2) to clock name (e.g. usb3). This allows
>>>> the kernel USB driver to work without any explicit periph-id or similar
>>>> DT property.
>>>
>>> Where does tegra-ehci.2 come from? I don't see that in the fdt.
>>
>> Pre-DT, everything was instantiated from platform devices. Each one had
>> a name ("tegra-ehci") and an instance number ("2"), which concatenate to
>> "tegra-ehci.2". All the clocks (and I think other resources like
>> regulators) in the kernel were marked as being for use by a particular
>> device name. For example in arch/arm/mach-tegra/tegra2_clocks.c:
>>
>> static struct clk tegra_list_clks[] = {
>> ...
>>        PERIPH_CLK("usb3",      "tegra-ehci.2", ...),
>>
>> With DT, the device names typically don't follow this format (in this
>> case, it'd be something more like "/usb@c5008000"). However, this
>> prevented the clock lookups by device name from working, so a temporary
>> scheme was put in place to keep the same device names. This is driven by
>> "AUXDATA", for example in arch/arm/mach-tegra/board-dt.c:
>>
>>
>> struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
>> ...
>> //             compatible, unit address, device name
>> OF_DEV_AUXDATA("nvidia,tegra20-ehci", TEGRA_USB3_BASE, "tegra-ehci.2",
>>
>> This means that any device with the given compatible property value, the
>> given unit address will be named accordingly.
>>
>> This allows the existing clock/regulator lookups to work unmodified.
>>
>> Once DT bindings are in place for clocks, regulators, etc., the clock
>> tables can be derived from DT, phandles will be used to match clocks and
>> devices rather than device names, and the AUXDATA table can go away.
>>
>> The equivalent in U-Boot would be a table that maps from driver type
>> (e.g. COMPAT_NVIDIA_TEGRA20_USB or perhaps NVIDIA_TEGRA20_USB?) and
>> address to periph id. Again, once the clock bindings are complete and
>> the nodes present in the .dts file, that mapping table can be removed
>> and everything will work based on phandles.
>>
>> I'd like to point out here that everything is in a pretty big state of
>> flux/development, since DT support for ARM is new. Temporary workarounds
>> like AUXDATA allow us to make as much work as possible using device
>> tree, but without having to put temporary nodes/properties into the .dts
>> files themselves. That way, the DT bindings will only ever get added to
>> in a compatible fashion, rather than going through multiple incompatible
>> sets of requirements.
> 
> Gosh.
> 
> I have to say that I feel that peripheral IDs are the best solution
> for Tegra U-Boot until everything is worked out in the kernel.

The problem here is that it requires the DT to change incompatibly
later; it adds a property to the DT now that will be at best
meaningless/unused in the future.

If we simply don't add anything to the DT now, there's nothing to remove
from the DT later. Newer U-Boots might require additional information in
the DT (i.e. perhaps rely on full clock bindings) but won't deprecate
any existing fields.

> We can't rely on phandles since they don't exist without an fdt,
> unless we mandate that everyone must use an fdt. I don't feel
> comfortable doing that until things are a bit more stable with all the
> things you are working on.

Sure, phandles won't work until the complete clock binding is implemnted.

> I really can't see why we want to put a table in U-Boot which does a
> mapping that is clear a hardware feature and IMO belongs in the fdt
> (why repeat peripheral addresses in the code and the fdt?).

It's a HW feature of the clock/reset controller, not the USB controller.

> Plus I still don't have an answer to my question about how we can
> ensure that instance 0 is a particular device.

As I said before, in the context of USB (where IIRC the question was
asked), you can enable just a single USB controller. The code only
supports a single controller anyway.

For SD/MMC, it does make sense to statically name some/all devices. That
is what /aliases is for. It's just that as I said, /aliases is meant to
control naming of devices that have been enumerated, not control the
enumeration itself.

-- 
nvpublic
