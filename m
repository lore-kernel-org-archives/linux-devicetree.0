Return-Path: <SRS0=ESTK=RT=mansr.com=mans@kernel.org>
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH v2 0/4] Patches to allow consistent mmc / mmcblk numbering w/ device tree
References: <1461951139-6109-1-git-send-email-dianders@chromium.org>
	<yw1x5zsx5wc7.fsf@mansr.com>
	<CAJ+vNU1PxK-B63Dc3AgzYb9POyxxoF-xPOWBEpxJ+3eVNK8xqw@mail.gmail.com>
	<d5310138-7fdd-973d-5210-3fc91c4686ee@denx.de>
Date: Sat, 16 Mar 2019 12:22:22 +0000
In-Reply-To: <d5310138-7fdd-973d-5210-3fc91c4686ee@denx.de> (Marek Vasut's
	message of "Sat, 16 Mar 2019 00:00:08 +0100")
Message-ID: <yw1xftrn2em9.fsf@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
To: Marek Vasut <marex@denx.de>
Cc: Tim Harvey <tharvey@gateworks.com>, Douglas Anderson <dianders@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, shawn.lin@rock-chips.com, Adrian Hunter <adrian.hunter@intel.com>, stefan@agner.ch, Linux MMC List <linux-mmc@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@marvell.com>, linux-rockchip@lists.infradead.org, devicetree-spec@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, open list <linux-kernel@vger.kernel.org>, vbyravarasu@nvidia.com, Lars-Peter Clausen <lars@metafoo.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, grundler@chromium.org, Kumar Gala <galak@codeaurora.org>, lporzio@micron.com, Rob Herring <robh+dt@kernel.org>, chaotian.j ing@mediatek.com, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, sudeep.holla@arm.com, zhonghui.fu@linux.intel.com, kirill.shutemov@linux.intel.com
List-ID: <devicetree@vger.kernel.org>

Marek Vasut <marex@denx.de> writes:

> On 3/15/19 10:52 PM, Tim Harvey wrote:
>> Tim Harvey - Principal Software EngineerGateworks Corporation -
>> http://www.gateworks.com/3026 S. Higuera St. San Luis Obispo CA
>> 93401805-781-2000
>> On Tue, Mar 5, 2019 at 4:39 AM M=E5ns Rullg=E5rd <mans@mansr.com> wrote:
>>>
>>> Douglas Anderson <dianders@chromium.org> writes:
>>>
>>>> This series picks patches from various different places to produce what
>>>> I consider the best solution to getting consistent mmc and mmcblk
>>>> ordering.
>>>>
>>>> Why consistent ordering and why not just use UUIDs?  IMHO consistent
>>>> ordering solves a few different problems:
>>>>
>>>> 1. For poor, feeble-minded humans like me, have sane numbering for
>>>>    devices helps a lot.  When grepping through dmesg it's terribly han=
dy
>>>>    if a given SDMMC device has a consistent number.  I know that I can
>>>>    do "dmesg | grep mmc0" or "dmesg | grep mmcblk0" to find info about
>>>>    the eMMC.  I know that I can do "dmesg | grep mmc1" to find info
>>>>    about the SD card slot.  I don't want it to matter which one probed
>>>>    first, I don't want it to matter if I'm working on a variant of the
>>>>    hardware that has the SD card slot disabled, and I don't want to ca=
re
>>>>    what my boot device was.  Worrying about what device number I got
>>>>    increases my cognitive load.
>>>>
>>>> 2. There are cases where it's not trivially easy during development to
>>>>    use the UUID.  Specifically I work a lot with coreboot / depthcharge
>>>>    as a BIOS.  When configured properly, that BIOS has a nice feature =
to
>>>>    allow you to fetch the kernel and kernel command line from TFTP by
>>>>    pressing Ctrl-N.  In this particular case the BIOS doesn't actually
>>>>    know which disk I'd like for my root filesystem, so it's not so easy
>>>>    for it to put the right UUID into the command line.  For this
>>>>    purpose, knowing that "mmcblk0" will always refer to eMMC is handy.
>>>>
>>>> Changes in v2:
>>>> - Rebased atop mmc-next
>>>> - Stat dynamic allocation after fixed allocation; thanks Wolfram!
>>>> - rk3288 patch new for v2
>>>>
>>>> Douglas Anderson (1):
>>>>   ARM: dts: rockchip: Add mmc aliases for rk3288 platform
>>>>
>>>> Jaehoon Chung (1):
>>>>   Documentation: mmc: Document mmc aliases
>>>>
>>>> Stefan Agner (2):
>>>>   mmc: read mmc alias from device tree
>>>>   mmc: use SD/MMC host ID for block device name ID
>>>>
>>>>  Documentation/devicetree/bindings/mmc/mmc.txt | 11 +++++++++++
>>>>  arch/arm/boot/dts/rk3288.dtsi                 |  4 ++++
>>>>  drivers/mmc/card/block.c                      |  2 +-
>>>>  drivers/mmc/core/host.c                       | 17 ++++++++++++++++-
>>>>  4 files changed, 32 insertions(+), 2 deletions(-)
>>>
>>> Did anyone ever come up with an acceptable solution for this?  After
>>> three years, I'm getting tired of rebasing these patches onto every new
>>> kernel.
>>>
>>> UUIDs or similar are NOT an option for multiple reasons:
>>>
>>> - We have two rootfs partitions for ping-pong updates, so simply
>>>   referring to "the thing with ID foo" doesn't work.
>>>
>>> - Installing said updates needs direct access the device/partition,
>>>   which may not even have a filesystem.
>>>
>>> - The u-boot environment is stored in an eMMC "boot" partition, and
>>>   userspace needs to know where to find it.
>>>
>>> I'm sure I'm not the only one in a similar situation.
>>>
>>> Russel, feel free to shout abuse at me.  I don't care, but it makes you
>>> look stupid.
>>>
>>=20
>> Completely agree here - we need a dt solution that allows us to
>> specify ordering.
>
> Nope, ordering would be a policy and does not describe hardware, thus it
> shouldn't be in the DT. Use UUID or PARTUUID, they apply both to raw FS
> (fsuuid) and to partitions (part uuid). Linux kernel can mount FS using
> PARTUUID, to support UUID you need initramfs.

That doesn't address how to find eMMC boot partitions.

I don't care the slightest what the numbering is, as long as it is
stable.  On some hardware, with an unpatched kernel, the mmc device
numbering changes depending on whether or not an SD card is inserted on
boot.  Getting rid of that behaviour is really all I want.

--=20
M=E5ns Rullg=E5rd
