From: Hanna Hawa <hhhawa@amazon.com>
Subject: [PATCH v6 0/3] Add support for Amazon's Annapurna Labs EDAC for L1/L2
Date: Mon, 7 Oct 2019 16:17:27 +0100
Message-ID: <20191007151730.7705-1-hhhawa@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, mchehab@kernel.org, mark.rutland@arm.com, james.morse@arm.com, robh+dt@kernel.org, frowand.list@gmail.com, davem@davemloft.net, gregkh@linuxfoundation.org, linus.walleij@linaro.org, daniel@iogearbox.net, paulmck@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, hhhawa@amazon.com
List-Id: devicetree@vger.kernel.org

This series adds L1 cache and L2 cache error detection and correction support
for Amazon's Annapurna Labs SoCs.

Alpine SoCs supports L1 and L2 single bit correction and two bits detection
capability based on ARM implementation.

The CPU cores in the SoC are the same and all of them support ECC.

Changes since v5:
-----------------
- Use top-level machine compatible to bind the EDAC device
- Remove DT bindings
- Add initcall to create platform device and register the edac driver
- follow 'next-level-cache' phandle to create CPU topology for L2 driver
- Change the driver to be tristate
- Move register read to function flow
- EXPORT_SYMBOL_GPL of_find_next_cache_node

Changes since v4:
-----------------
- Added include for cpumask.h in al_l2_edac.c
- Fix RAMID error print according to ARM TRM
- Use for_each_possible_cpu() to parse information for DT.
- Add missing of_node_put() call.

Changes since v3:
-----------------
- Added include for smp.h sysreg.h
- Use scnprintf instead of snprintf
- Move write_sysreg_s after valid check to minimize the window between
read/write.
- Use IS_ERR_OR_NULL instead of IS_ERR, because
edac_device_alloc_ctl_info may return NULL.

Changes since v2:
-----------------
- Use BIT for single bit instead of GENMASK
- Use BIT_ULL and GENMASK_ULL for 64bit vector
- Fix the mod_name/ctrl_name.

Changes since v1:
-----------------
- Split into two drivers
- Get cpu-mask according to l2-cache handler from devicetree
- Remove parameter casting
- Use GENMASK() in bit mask
- Use FIELD_GET()
- Update define description PLRU_RAM -> PF_RAM
- Use sys_reg() and read_sysreg_s()
- Remove all write/read wrappers
- Check fatal field to set if the error correctable or not
- Remove un-relevant information from error prints.
- Update smp_call_function_single() call function to wait
- remove usage of get_online_cpus/put_online_cpus
- Use on_each_cpu() and smp_call_function_any() instead of loop with for_each_cpu.
- use buffer for error prints and pass to edac API
- Remove edac_op_state set
- Add for loop to report on repeated errors of the same type
- Fix error name of the TLB to be L2_TLB as written in ARM TRM
- Minor change in Kconfig
- Minor changes in commit message

Hanna Hawa (3):
  edac: Add support for Amazon's Annapurna Labs L1 EDAC
  of: EXPORT_SYMBOL_GPL of_find_next_cache_node
  edac: Add support for Amazon's Annapurna Labs L2 EDAC

 MAINTAINERS               |  10 ++
 drivers/edac/Kconfig      |  16 +++
 drivers/edac/Makefile     |   2 +
 drivers/edac/al_l1_edac.c | 190 +++++++++++++++++++++++++++++
 drivers/edac/al_l2_edac.c | 251 ++++++++++++++++++++++++++++++++++++++
 drivers/of/base.c         |   1 +
 6 files changed, 470 insertions(+)
 create mode 100644 drivers/edac/al_l1_edac.c
 create mode 100644 drivers/edac/al_l2_edac.c

-- 
2.17.1
