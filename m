From: =?UTF-8?q?Marc=20Mar=C3=AD?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: QEMU fw_cfg DMA interface
Date: Mon, 31 Aug 2015 11:08:53 +0200
Message-ID: <1441012133-8154-1-git-send-email-markmb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, seabios-VcxPKcuBGKdAfugRpC6u6w@public.gmane.org
Cc: Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laszlo <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Marc=20Mar=C3=AD?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Implementation of the FW CFG DMA interface.

When running a Linux guest on top of QEMU, using the -kernel options, this
is the timing improvement for x86:

QEMU commit 090d0bf and SeaBIOS commit 2fc20dc
QEMU startup time: .078
BIOS startup time: .060
Kernel setup time: .578
Total time: .716

QEMU with this patch series and SeaBIOS with this patch series
QEMU startup time: .080
BIOS startup time: .039
Kernel setup time: .002
Total time: .121

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
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
