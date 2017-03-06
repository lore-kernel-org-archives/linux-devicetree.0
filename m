From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: Re: [PATCH 2/2] MIPS: NI 169445 board support
Date: Mon, 6 Mar 2017 17:14:24 -0600
Message-ID: <20170306231424.GA1503@nathan3500-linux-VM>
References: <1488830761-681-1-git-send-email-nathan.sullivan@ni.com>
 <1488830761-681-3-git-send-email-nathan.sullivan@ni.com>
 <20170306230413.GF2878@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <20170306230413.GF2878@jhogan-linux.le.imgtec.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 06, 2017 at 11:04:13PM +0000, James Hogan wrote:
> Hi Nathan,
> 
> On Mon, Mar 06, 2017 at 02:06:01PM -0600, Nathan Sullivan wrote:
> > Support the National Instruments 169445 board.
> > 
> > Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>
> > ---
> >  Documentation/devicetree/bindings/mips/ni.txt   |   7 ++
> >  arch/mips/boot/dts/Makefile                     |   1 +
> >  arch/mips/boot/dts/ni/169445.dts                | 101 ++++++++++++++++++++
> >  arch/mips/boot/dts/ni/Makefile                  |   7 ++
> >  arch/mips/configs/generic/board-ni169445.config | 117 ++++++++++++++++++++++++
> >  arch/mips/generic/Kconfig                       |   6 ++
> >  arch/mips/generic/vmlinux.its.S                 |  25 +++++
> >  7 files changed, 264 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mips/ni.txt
> >  create mode 100644 arch/mips/boot/dts/ni/169445.dts
> >  create mode 100644 arch/mips/boot/dts/ni/Makefile
> >  create mode 100644 arch/mips/configs/generic/board-ni169445.config
> > 
> 
> nice :)
> 
> I reckon an entry in MAINTAINERS listing the board specific
> files/directories would probably be worthwhile too.
> 

OK, will do.

> > diff --git a/arch/mips/configs/generic/board-ni169445.config b/arch/mips/configs/generic/board-ni169445.config
> > new file mode 100644
> > index 0000000..2c950a8
> > --- /dev/null
> > +++ b/arch/mips/configs/generic/board-ni169445.config
> > @@ -0,0 +1,117 @@
> > +CONFIG_MIPS_GENERIC=y
> > +CONFIG_FIT_IMAGE_FDT_NI169445=y
> > +CONFIG_CPU_LITTLE_ENDIAN=y
> > +CONFIG_CPU_MIPS32_R2=y
> > +CONFIG_HZ_100=y
> > +CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER=y
> > +# CONFIG_SWAP is not set
> > +CONFIG_SYSVIPC=y
> > +CONFIG_HZ_PERIODIC=y
> > +CONFIG_NO_HZ=y
> > +CONFIG_HIGH_RES_TIMERS=y
> > +CONFIG_IKCONFIG=y
> > +CONFIG_IKCONFIG_PROC=y
> > +CONFIG_LOG_BUF_SHIFT=15
> > +CONFIG_BPF_SYSCALL=y
> > +# CONFIG_SHMEM is not set
> > +CONFIG_USERFAULTFD=y
> > +CONFIG_EMBEDDED=y
> > +# CONFIG_COMPAT_BRK is not set
> > +CONFIG_SLAB=y
> > +CONFIG_PROFILING=y
> > +CONFIG_CC_STACKPROTECTOR_REGULAR=y
> > +# CONFIG_LBDAF is not set
> > +# CONFIG_BLK_DEV_BSG is not set
> > +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> > +# CONFIG_SUSPEND is not set
> > +CONFIG_NET=y
> > +CONFIG_PACKET=y
> > +CONFIG_UNIX=y
> > +CONFIG_INET=y
> > +# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> > +# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> > +# CONFIG_INET_XFRM_MODE_BEET is not set
> > +# CONFIG_INET_DIAG is not set
> > +# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
> > +# CONFIG_INET6_XFRM_MODE_TUNNEL is not set
> > +CONFIG_NETFILTER=y
> > +CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
> > +CONFIG_IP_NF_IPTABLES=y
> > +CONFIG_IP_NF_FILTER=y
> > +CONFIG_IP6_NF_IPTABLES=y
> > +CONFIG_IP6_NF_FILTER=y
> > +# CONFIG_WIRELESS is not set
> > +CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
> > +CONFIG_DEVTMPFS=y
> > +CONFIG_DEVTMPFS_MOUNT=y
> > +CONFIG_MTD=y
> > +CONFIG_MTD_CMDLINE_PARTS=y
> > +CONFIG_MTD_BLOCK_RO=y
> > +CONFIG_MTD_NAND=y
> > +CONFIG_MTD_NAND_ECC_BCH=y
> > +CONFIG_MTD_NAND_GPIO=y
> > +CONFIG_MTD_UBI=y
> > +CONFIG_MTD_UBI_BLOCK=y
> > +# CONFIG_BLK_DEV is not set
> > +CONFIG_NETDEVICES=y
> > +# CONFIG_NET_VENDOR_ALACRITECH is not set
> > +# CONFIG_NET_VENDOR_AMAZON is not set
> > +# CONFIG_NET_VENDOR_AQUANTIA is not set
> > +# CONFIG_NET_VENDOR_ARC is not set
> > +# CONFIG_NET_CADENCE is not set
> > +# CONFIG_NET_VENDOR_BROADCOM is not set
> > +# CONFIG_NET_VENDOR_EZCHIP is not set
> > +# CONFIG_NET_VENDOR_INTEL is not set
> > +# CONFIG_NET_VENDOR_MARVELL is not set
> > +# CONFIG_NET_VENDOR_MICREL is not set
> > +# CONFIG_NET_VENDOR_NATSEMI is not set
> > +# CONFIG_NET_VENDOR_NETRONOME is not set
> > +# CONFIG_NET_VENDOR_QUALCOMM is not set
> > +# CONFIG_NET_VENDOR_RENESAS is not set
> > +# CONFIG_NET_VENDOR_ROCKER is not set
> > +# CONFIG_NET_VENDOR_SAMSUNG is not set
> > +# CONFIG_NET_VENDOR_SEEQ is not set
> > +# CONFIG_NET_VENDOR_SOLARFLARE is not set
> > +# CONFIG_NET_VENDOR_SMSC is not set
> > +CONFIG_STMMAC_ETH=y
> > +CONFIG_DWMAC_DWC_QOS_ETH=y
> > +# CONFIG_NET_VENDOR_VIA is not set
> > +# CONFIG_NET_VENDOR_WIZNET is not set
> > +# CONFIG_NET_VENDOR_XILINX is not set
> > +# CONFIG_WLAN is not set
> > +# CONFIG_INPUT_KEYBOARD is not set
> > +# CONFIG_INPUT_MOUSE is not set
> > +# CONFIG_SERIO is not set
> > +# CONFIG_VT is not set
> > +CONFIG_LEGACY_PTY_COUNT=32
> > +CONFIG_SERIAL_8250=y
> > +# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> > +CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_8250_NR_UARTS=2
> > +CONFIG_SERIAL_8250_RUNTIME_UARTS=2
> > +CONFIG_SERIAL_OF_PLATFORM=y
> > +# CONFIG_PTP_1588_CLOCK is not set
> > +CONFIG_GPIOLIB=y
> > +CONFIG_GPIO_SYSFS=y
> > +CONFIG_GPIO_GENERIC_PLATFORM=y
> > +# CONFIG_HWMON is not set
> > +# CONFIG_HID is not set
> > +# CONFIG_USB_SUPPORT is not set
> > +# CONFIG_MIPS_PLATFORM_DEVICES is not set
> > +# CONFIG_IOMMU_SUPPORT is not set
> > +CONFIG_FANOTIFY=y
> > +CONFIG_UBIFS_FS=y
> > +CONFIG_SQUASHFS=y
> > +CONFIG_SQUASHFS_XATTR=y
> > +# CONFIG_SQUASHFS_ZLIB is not set
> > +CONFIG_SQUASHFS_LZO=y
> > +# CONFIG_NETWORK_FILESYSTEMS is not set
> > +CONFIG_PRINTK_TIME=y
> > +CONFIG_DEBUG_INFO=y
> > +CONFIG_DEBUG_INFO_REDUCED=y
> > +CONFIG_DEBUG_FS=y
> > +# CONFIG_SCHED_DEBUG is not set
> > +CONFIG_RCU_TRACE=y
> > +# CONFIG_FTRACE is not set
> > +# CONFIG_CRYPTO_ECHAINIV is not set
> > +# CONFIG_CRYPTO_HW is not set
> 
> I think this file is intended to be more minimal than a normal
> defconfig, only enabling hardware device drivers (and related options)
> and FIT IMAGE on top of the generic_defconfig and other snippets in this
> directory, e.g. have you seen the other board config examples here?
> 
> https://git.linux-mips.org/cgit/linux-mti.git/tree/arch/mips/configs/generic?h=eng
> 
> If specific generic kernel features are desired we should probably
> consider whether it makes sense to add them to the generic_defconfig so
> other generic boards can benefit.
> 
> Cheers
> James

I was a little confused here, I'll rewrite this by hand for v3 and follow the
examples. I see the intent now.

Thanks,
Nathan
