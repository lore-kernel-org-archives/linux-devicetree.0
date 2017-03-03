From: "Chuan Hua, Lei" <chuanhua.lei-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: OF section alignment issue
Date: Fri, 3 Mar 2017 01:34:30 +0000
Message-ID: <CB6EFEC79CF84D4FB62337DA644C21160A2B440F@PGSMSX101.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "'devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi All,

Open Firmware (OF) user section behavior depends on compiler instead of the coding itself. __clksrc_of_table(used in clocksource_probe from drivers/clocksource/clksrc-of.c) and __clk_of_table (used in of_clk_init from drivers/clk/clk.c) don't work at all which causes to fail to boot up Linux kernel in ATOM/x86 architecutre. The following is analysis for 32 bit CPU architecture.

- GCC doesn't define user defined section alignment and will not prevent compiler to adjust alignment for performance improvement.

- MIPS/ARM OF section alignment is 4 bytes

- x86 OF section alignment is 32 bytes. By default, vmlinux.lds.h only guarantees OF section is 8 byte alignment. Therefore, in x86, OF section will not work at all. The first try is to change alignment size in linker script to 32 byte. It solved the problem if OF section table has only one entry such as clocksource (Usually one clock source registered, but it is possible to have more than clock source in Linux kernel). However, if OF section has more than one entry, it still doesn't work in CCF(usually a lot of entries)

- Even if of_device_id data structure size is 196(32 * 6 + 4) bytes, it actually needs 224 bytes due to alignment requirement. For each __clksrc_of_table or __clk_of_table entry, Linux kernel uses pointer operation to iterate each entry. However, pointer operation is based on the type which the pointer pointers to, that is, size of of_device_id (196). Even with 32 alignment in linker scripts, it can only find first entry in OF section.

- OF section is widely used in Linux kernel for device tree so that it can reduce the duplicated code in different platforms. However, OF user defined section alignment depends on compiler if not explicitly specified.

Therefore, it is necessary to specify OF user defined section alignment explicitly as 4 bytes.

diff --git a/include/linux/of.h b/include/linux/of.h
old mode 100644 (file)
new mode 100755 (executable)
index 299aeb1..9fac5f4
--- a/include/linux/of.h
+++ b/include/linux/of.h

@@ -1120,6 +1120,7 @@ static inline int of_get_available_child_count(const struct device_node *np)

 #define _OF_DECLARE(table, name, compat, fn, fn_type)                  \
        static const struct of_device_id __of_table_##name                     \
                __used __section(__##table##_of_table)                             \
+               __aligned(4)  			                                                     \
                 = { .compatible = compat,                                                     \
                     .data = (fn == (fn_type)NULL) ? fn : fn  }
 #else

There is also this 10 years old post, where someone has a similar problem on x86: http://lkml.iu.edu/hypermail/linux/kernel/0706.2/2552.html

Any comment is welcome. Hope this issue can be closed:)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
