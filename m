From: =?UTF-8?q?Marc=20Mar=C3=AD?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [cross-post] QEMU fw_cfg DMA interface
Date: Thu,  8 Oct 2015 17:02:03 +0200
Message-ID: <1444316523-21711-1-git-send-email-markmb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, seabios-VcxPKcuBGKdAfugRpC6u6w@public.gmane.org
Cc: Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laszlo <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Marc=20Mar=C3=AD?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Implementation of the FW CFG DMA interface.

When running a Linux guest on top of QEMU, using the -kernel option and with
fw_cfg DMA Linux boot support, this is the timing improvement for x86:

Original QEMU and SeaBIOS
QEMU startup time: .080
BIOS startup time: .060
Kernel setup time: .586
Total time: .726

QEMU and SeaBIOS with this patch series and fw_cfg DMA Linux boot support
QEMU startup time: .080
BIOS startup time: .039
Kernel setup time: .005
Total time: .126

QEMU startup time is the time between the start and the first kvm_entry.
BIOS startup time is the time between the first kvm_entry and the start of
function do_boot, in SeaBIOS.
Kernel setup time is the time between the start of the function do_boot in
SeaBIOS and the jump to the Linux kernel.

As you can see, both the BIOS (because of ACPI tables and other configurations)
and the Linux kernel boot (because of the copy to memory) are greatly
improved with this new interface.

Also, this new interface is an addon to the old interface. Both interfaces
are compatible and interchangeable.

Changes from v1:
 - Take into account order of fields in the FWCfgDmaAccess structure
 - Check and change endianness of FWCfgDmaAccess fields
 - Change order of fields in the FWCfgDmaAccess structure
 - Add FW_CFG_DMA_CTL_SKIP feature for control field
 - Split FW_CFG_SIZE in QEMU
 - Make FW_CFG_ID a bitmap of features
 - Add 64 bit address support for the transfer. Trigger when writing the low
   address, and address is 0 by default and at the end of each transfer.
 - Align ports and addresses.
 - Preserve old fw_cfg_comb_valid behaviour in QEMU
 - Update documentation to reflect all these changes

Changes from v2:
 - Make IOports fw_cfg DMA region a different IO region.
 - Reuse everything for MMIO and IOport DMA regions
 - Make transfer status only based on control field
 - Use DMA helpers instead of direct map/unmap
 - Change ARM fw_cfg DMA address space
 - Change Linux boot process to match linuxboot.S
 - Add select capabilities in the FWCfgDmaAccess struct
 - Update documentation to reflect all these changes

Changes from v3:
 - Set properly fw_cfg DMA fields in ARM
 - Set fw_cfg DMA boot process properly (by Laszlo Ersek)
 - Add signature to fw_cfg DMA address field (by Kevin O'Connor)
 - Minor nitpicks

Changes from v4:
 - Remove Linux fw_cfg boot from this series (will be sent separately)
 - Minor nitpicks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
