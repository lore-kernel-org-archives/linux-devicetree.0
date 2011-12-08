From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 10/14] tegra: usb: Add support for USB
	peripheral
Date: Thu, 8 Dec 2011 13:24:56 -0800
Message-ID: <CAPnjgZ0AuBNkYKN0JHQyc7DdzwUSZivR+Dv2BkiFsKQBNMeP8A@mail.gmail.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
	<1322106896-23054-11-git-send-email-sjg@chromium.org>
	<4ED3DF1D.6080009@nvidia.com>
	<CAPnjgZ1-yxq-O-vsy1gNJ8AOzh7Sz9j5PG9Tx1sKpnAxhApJAQ@mail.gmail.com>
	<4EDD38AC.30908@nvidia.com>
	<CAPnjgZ0MTaPa4pq1VXk_XbmuDyWTfy-H33W4deNVn2ALUrcW_A@mail.gmail.com>
	<4EDD429E.8010507@nvidia.com>
	<CAPnjgZ2G220G-i3PPtS4XJYY0ornWFOoK3=b93jG-6GE_g2O5w@mail.gmail.com>
	<4EDD5F1B.5060205@nvidia.com>
	<CAPnjgZ2h7F228q=pXuf7M9vTASurY3R5an_QV-mrETLf8nzA1A@mail.gmail.com>
	<4EDE7E1C.2090203@nvidia.com>
	<CAPnjgZ1G+mv6uv8SrdMm7DoqFjeeyVHYv6nbQxn9qixfbQMGvA@mail.gmail.com>
	<4EDFFAC5.5070002@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4EDFFAC5.5070002@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, Dec 7, 2011 at 3:46 PM, Stephen Warren <swarren@nvidia.com> wrote:
> On 12/06/2011 02:23 PM, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Tue, Dec 6, 2011 at 12:42 PM, Stephen Warren <swarren@nvidia.com> wrote:
>>> On 12/05/2011 06:14 PM, Simon Glass wrote:
>>>> Hi Stephen,
>>>>
>>>> On Mon, Dec 5, 2011 at 4:17 PM, Stephen Warren <swarren@nvidia.com> wrote:
>>>>> On 12/05/2011 04:35 PM, Simon Glass wrote:
> ...
>>>>>> Also the only way I can see it being hard-coded is by the kernel
>>>>>> looking at the peripheral address and converting this to an ID. That
>>>>>> seems really ugly to me. Or am I missing something?
>>>>>
>>>>> Well, the Tegra SD/MMC driver works exactly that way (well, mapping an
>>>>> instance ID to both base address and periph ID), so there's certainly
>>>>> precedent for this. And that driver is not unique.
>>>>
>>>> I don't know if I can NAK a comment but I would like to NAK this one.
>>>
>>> I don't know what that means; that you believe my statement is
>>> incorrect, or you don't like the argument I'm basing on it or ...?
>>
>> What happens is that the SD/MMC driver (dating from pre-FDT days) has
>> a hard-coded base address and peripheral ID, based on an instance ID
>> (0, 1, 2).
>
> That's basically the exact same thing, it's just the exact fields that
> are the key into and output from the table are different.
>
>> I would expect that we want the FDT to control all of this - it
>> already has the base address, can have the peripheral ID, and the
>> instance ID (ordering) should be set by the FDT not hard-coded IMO.
>> That's the reason for my NAK comment. It just seems completely wrong
>> to duplicate this information in the driver and require the instance
>> ordering to be hard-coded in the driver. It means that boards that
>> want to change this ordering must fiddle around in the driver to make
>> this work.
>>
>> Also this is U-Boot, not the kernel. Commands like 'ext2load' require
>> that you pass the instance ID to indicate which device to use.
>
> SD/MMC is a very different use-case, and not a good analogy to USB.
>
> With SD, the user always wants to identify a specific device that they
> know contains their files.
>
> With USB, the user doesn't care that there are multiple USB host
> controllers in the SoC; they just want to plug in their device somewhere
> and have it work. Having to decide which USB controller to enable at a
> time is pretty hokey, given there's unlikely to be any indication at all
> on the PCB or case which ports map to which USB controllers.
>
> What the user might care about is selecting a enumerated particular USB
> device. They'd only know which one after looking at some "lsusb" command
> (or whatever it's called in U-Boot) in the general case.
>
> Hence, I assert that USB host controller number is completely
> irrelevant, and all should be active at once.

In our case we do not want to look at the USB port the contains the 3G
modem, for example, just the external one which can contain a USB
stick.

>
> This of course is all somewhat moot given that I pointed out
> ehci-tegra.c only supports one of the hosts anyway...
>
>> OK, so is your objection that we ignore a peripheral that has no
>> alias?
>
> Yes.

OK. We will ignore it anyway since USB2 is marked as disabled, but I
agree that isn't true in general.

>
> And that enumeration is based on alias nodes not enumerating all nodes
> that match the compatible flag.
>
>> If I change the code to locate these and add them at the end
>> would that be better?
>
> Sure.
>
> I think the best implementation would be to enumerate everything solely
> based on compatible flags, and allowing "usb start" to accept either an
> alias name (which would be fixed) or a DT unit address or node name
> (which would be fixed) or a controller index (which might vary based on
> enumeration order) to select the controller.
>
> The next best implementation would be to enumerate solely based on
> compatible flags, then sort the list based on alias, thus allowing alias
> to cause a static order.
>
> However, enumerating based on alias, then enumerating based on
> compatible flags and adding any missing nodes would be fine.

Well ok. Since this is basically a small *addition* to the code
(scanning things that don't have an alias), and will have no effect
with the device tree as included in this series, I would like to do
this as a follow-on patch after the series. I hope you can live with
that also?

>
>>> As I mentioned elsewhere, the patches only allow one to actually use usb
>>> controller 0; ehci-tegra.c's ehci_hcd_init() hard-codes port 0 when
>>> calling tegrausb_start_port(). Rather than relying on non-standard
>>> aliases usage to restrict the set of USB devices that get instantiated,
>>> why not just add status = "disabled" to all but one USB host's node in
>>> each board's .dts file; that's the standard way to disable devices.
>>
>> I can do that, but how do I solve the ordering problem?
>
> If you only have one enabled controller in the .dts file, there can't be
> any ordering issue since there is always only 1 controller.

I really was referring to how it should be done. We will enable two
points. Only one is currently accessible due to us needing either a
parameter to 'usb start' or the virtual ehci hub code. But USB
upstreaming is not complete after this series - it is only a step in
the process. I feel that 14 patches is big enough for a series :-)

Regards,
Simon

>
> --
> nvpublic
