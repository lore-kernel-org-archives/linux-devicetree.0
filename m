From: =?UTF-8?q?Marc=20Mar=C3=AD?= <markmb@redhat.com>
Subject: QEMU fw_cfg DMA interface
Date: Fri, 18 Sep 2015 10:58:23 +0200
Message-ID: <1442566703-5091-1-git-send-email-markmb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, seabios@seabios.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, Drew <drjones@redhat.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Stefan Hajnoczi <stefanha@gmail.com>, Alexander Graf <agraf@suse.de>, Kevin O'Connor <kevin@koconnor.net>, Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?q?Marc=20Mar=C3=AD?= <markmb@redhat.com>, Laszlo <lersek@redhat.com>
List-Id: devicetree@vger.kernel.org

Implementation of the FW CFG DMA interface.

When running a Linux guest on top of QEMU, using the -kernel options, thi=
s
is the timing improvement for x86:

QEMU commit 16a1b6e and SeaBIOS commit e4d2b8c
QEMU startup time: .080
BIOS startup time: .060
Kernel setup time: .586
Total time: .726

QEMU with this patch series and SeaBIOS with this patch series
QEMU startup time: .080
BIOS startup time: .039
Kernel setup time: .002
Total time: .121

QEMU startup time is the time between the start and the first kvm_entry.
BIOS startup time is the time between the first kvm_entry and the start o=
f
function do_boot, in SeaBIOS.
Kernel setup time is the time between the start of the function do_boot i=
n
SeaBIOS and the jump to the Linux kernel.

As you can see, both the BIOS (because of ACPI tables and other configura=
tions)
and the Linux kernel boot (because of the copy to memory) are greatly
improved with this new interface.

Also, this new interface is an addon to the old interface. Both interface=
s
are compatible and interchangeable.

Changes from v1:
 - Take into account order of fields in the FWCfgDmaAccess structure
 - Check and change endianness of FWCfgDmaAccess fields
 - Change order of fields in the FWCfgDmaAccess structure
 - Add FW_CFG_DMA_CTL_SKIP feature for control field
 - Split FW_CFG_SIZE in QEMU
 - Make FW_CFG_ID a bitmap of features
 - Add 64 bit address support for the transfer. Trigger when writing the =
low
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
