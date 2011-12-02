From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 05/14] tegra: fdt: Add Tegra2x device tree file
Date: Fri, 2 Dec 2011 08:47:04 -0800
Message-ID: <CAPnjgZ1cgkHWcqymrap=cD6hX+1HZhQ4tjX_c-+B4oDtXU+bdg@mail.gmail.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
	<1322106896-23054-6-git-send-email-sjg@chromium.org>
	<4ED3D975.4090903@nvidia.com>
	<CAPnjgZ11cFm15E9MHXno_YGp0NxdOHhGBavYbQBP5Nu_TOtx7A@mail.gmail.com>
	<4ED8F5A1.1010408@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4ED8F5A1.1010408@nvidia.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Fri, Dec 2, 2011 at 7:58 AM, Stephen Warren <swarren@nvidia.com> wrote:
> On 12/01/2011 06:24 PM, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Mon, Nov 28, 2011 at 10:56 AM, Stephen Warren <swarren@nvidia.com> wrote:
>>> On 11/23/2011 08:54 PM, Simon Glass wrote:
>>>> This was taken from commit 1ea6b8f at:
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git
>>>
> ...
>>> In particular, linux-next now includes a minimal USB binding. Should we
>>> just use this in U-Boot for now? We should get review on the kernel
>>> lists before bringing in this more advanced USB binding in U-Boot, and
>>> perhaps even add the binding into the kernel at the same time?
>>
>> I copied my email to the device-tree mailing list. Hopefully that is
>> enough to get a review there. It feels wrong to send U-Boot patches to
>> the kernel list...?
>
> I think the kernel and U-boot need to co-ordinate on the DT bindings.
> Posting at least to linux-tegra, the Tegra maintainers, and perhaps even
> the kernel's domain-specific list (i.e. linux-usb) seems appropriate to
> me. DT is a cross-functional thing, and really needs cross-functional
> discussion and review. devicetree-discuss will cover the DT experts, but
> probably not the CPU and subsystem experts.

I worry about the implication that I am blazing a trail here. I would
prefer to take the bindings as set down by the kernel and make them
work within U-Boot. The reasoning here is that Linux has more
demanding requirements, and more flexibility, so it is unlikely that
U-Boot would need more features in its fdt. The one exception might be
due to efficiency. If it takes 10ms and 50KB of code to figure out the
system state from the fdt then U-Boot people might get upset, so I do
want to make sure the bindings can be efficiently parsed by U-Boot
(hence my peripheral id approach).

Where those bindings don't exist yet, I would prefer to use a
place-holder until they are set, then change the U-Boot code later.
That process can take many months and we don't want to hold back
actual functionality in U-Boot just because we haven't finalized the
fdt definitions for a particular peripheral.

I will certainly widen my distribution list for fdt patches in the
hope that resolution can be reached then and there, but it will be
hard for kernel people to agree a binding until they have written /
modified the driver. IMO it would probably be a good idea for people
to subscribe to device-tree-discuss if they are interested in fdt
things, kernel or U-Boot or other. LKML already gets a huge amount of
traffic.

Regards,
Simon

>
> --
> nvpublic
>
