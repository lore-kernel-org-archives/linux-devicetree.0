From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] kbuild: remove all "obj- := dummy.o" tricks
Date: Wed,  8 Nov 2017 01:31:45 +0900
Message-ID: <1510072307-16819-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Arnd Bergmann <arnd@arndb.de>, linux-mips@linux-mips.org, netdev@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Russell King <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Michal Marek <mmarek@suse.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


This clean-up was prompted by Sam
when I refactored DT building:
https://patchwork.kernel.org/patch/10041881/

If you want to test this series,
apply the following 3 patches:
https://patchwork.kernel.org/patch/10037891/
https://patchwork.kernel.org/patch/10041877/
https://patchwork.kernel.org/patch/10041881/

I CCed DT forks to informs them of conflicts
with those patches Rob Herring offered to apply.
I doubt if he wants to review this series...



Masahiro Yamada (2):
  kbuild: create built-in.o automatically if parent directory wants it
  kbuild: remove all dummy assignments to obj-

 Makefile                                  | 2 +-
 arch/arm/mach-uniphier/Makefile           | 1 -
 arch/mips/boot/dts/brcm/Makefile          | 3 ---
 arch/mips/boot/dts/cavium-octeon/Makefile | 3 ---
 arch/mips/boot/dts/img/Makefile           | 3 ---
 arch/mips/boot/dts/ingenic/Makefile       | 3 ---
 arch/mips/boot/dts/lantiq/Makefile        | 3 ---
 arch/mips/boot/dts/mti/Makefile           | 3 ---
 arch/mips/boot/dts/netlogic/Makefile      | 3 ---
 arch/mips/boot/dts/ni/Makefile            | 3 ---
 arch/mips/boot/dts/pic32/Makefile         | 3 ---
 arch/mips/boot/dts/qca/Makefile           | 3 ---
 arch/mips/boot/dts/ralink/Makefile        | 3 ---
 arch/mips/boot/dts/xilfpga/Makefile       | 3 ---
 firmware/Makefile                         | 3 ---
 samples/bpf/Makefile                      | 3 ---
 samples/hidraw/Makefile                   | 3 ---
 samples/seccomp/Makefile                  | 3 ---
 samples/sockmap/Makefile                  | 3 ---
 samples/statx/Makefile                    | 3 ---
 samples/uhid/Makefile                     | 3 ---
 scripts/Makefile.build                    | 4 ++--
 22 files changed, 3 insertions(+), 61 deletions(-)

-- 
2.7.4
