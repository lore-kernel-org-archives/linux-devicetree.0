From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v12 1/6] fpga: Add flag to indicate SPI bitstream is bit-reversed
Date: Fri,  2 Jun 2017 13:30:47 -0700
Message-ID: <684ea151ba9aa2c6555a299daf56552ddc11f596.1496434383.git.stillcompiling@gmail.com>
References: <20170525172911.11467-1-stillcompiling@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170525172911.11467-1-stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Bastian Stender <bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>

Add a flag that is passed to the write_init() callback,
indicating that the SPI bitstream starts with LSB first.
SPI controllers usually send data with MSB first. If an
FPGA expects bitstream data as LSB first, the data must
be reversed either by the SPI controller or by the driver.

Alternatively the bitstream could be prepared as bit-reversed
to avoid the bit-swapping while sending. This flag indicates
such bit-reversed SPI bitstream. The low-level driver will
deal with the flag and perform bit-reversing if needed.

Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Changes from v11 (all in patch 4/4)
- Change "Altera V FPGA" to simply "Altera FPGA"
- Change the devicetree name to a generic "fpga: fpga@0"
  from "fpga_spi: cyclonespi@0"

 include/linux/fpga/fpga-mgr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
index b4ac24c4411d..01c348ca38b7 100644
--- a/include/linux/fpga/fpga-mgr.h
+++ b/include/linux/fpga/fpga-mgr.h
@@ -67,10 +67,12 @@ enum fpga_mgr_states {
  * FPGA Manager flags
  * FPGA_MGR_PARTIAL_RECONFIG: do partial reconfiguration if supported
  * FPGA_MGR_EXTERNAL_CONFIG: FPGA has been configured prior to Linux booting
+ * FPGA_MGR_BITSTREAM_LSB_FIRST: SPI bitstream bit order is LSB first
  */
 #define FPGA_MGR_PARTIAL_RECONFIG	BIT(0)
 #define FPGA_MGR_EXTERNAL_CONFIG	BIT(1)
 #define FPGA_MGR_ENCRYPTED_BITSTREAM	BIT(2)
+#define FPGA_MGR_BITSTREAM_LSB_FIRST	BIT(3)
 
 /**
  * struct fpga_image_info - information specific to a FPGA image
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
