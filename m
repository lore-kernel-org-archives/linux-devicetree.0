From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] ptp: ines_ptp_probe_channel() can be static
Date: Sat, 1 Jun 2019 04:22:23 +0800
Message-ID: <20190531202223.GA97559@lkp-kbuild06>
References: <297281011d671dafdced87755fd6e2bd41c6d141.1559281985.git.richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <297281011d671dafdced87755fd6e2bd41c6d141.1559281985.git.richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: kbuild-all@01.org, netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org


Fixes: 49268f31cc1f ("ptp: Add a driver for InES time stamping IP core.")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ptp_ines.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ptp/ptp_ines.c b/drivers/ptp/ptp_ines.c
index 59cb3f1..52c1e85 100644
--- a/drivers/ptp/ptp_ines.c
+++ b/drivers/ptp/ptp_ines.c
@@ -753,8 +753,8 @@ static u8 tag_to_msgtype(u8 tag)
 	return 0xf;
 }
 
-struct mii_timestamper *ines_ptp_probe_channel(struct device *device,
-					       unsigned int index)
+static struct mii_timestamper *ines_ptp_probe_channel(struct device *device,
+						      unsigned int index)
 {
 	struct device_node *node = device->of_node;
 	struct ines_port *port;
@@ -782,7 +782,7 @@ static void ines_ptp_release_channel(struct device *device,
 {
 }
 
-struct mii_timestamping_ctrl ines_ctrl = {
+static struct mii_timestamping_ctrl ines_ctrl = {
 	.probe_channel = ines_ptp_probe_channel,
 	.release_channel = ines_ptp_release_channel,
 };
