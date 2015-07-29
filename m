From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 02/10] usb: chipidea: define stream mode disable for both roles
Date: Wed, 29 Jul 2015 10:42:06 +0800
Message-ID: <1438137734-27311-3-git-send-email-peter.chen@freescale.com>
References: <1438137734-27311-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438137734-27311-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The system bus and chipidea IP have different limitations for
both host and device mode.
=46or example, with below errata, we need to enable SDIS(Stream Disable=
 Mode)
at host mode. But we don't want it for device mode at the same system.

TAR 9000378958
Title: Non-Double Word Aligned Buffer Address Sometimes Causes Host to =
Hang on OUT Retry
Impacted Configuration: Host mode, all transfer types
Description:
The host core operating in streaming mode may under run while sending t=
he data packet of an OUT transaction. This under run can occur if there=
 are unexpected system delays in fetching the remaining packet data fro=
m memory. The host forces a bad CRC on the packet, the device detects t=
he error and discards the packet. The host then retries a Bulk, Interru=
pt, or Control transfer if an under run occurs according to the USB spe=
cification.
During simulations, it was found that the host does not issue the retry=
 of the failed bulk OUT. It does not issue any other transactions excep=
t SOF packets that have incorrect frame numbers.
The second failure mode occurs if the under run occurs on an ISO OUT tr=
ansaction and the next ISO transaction is a zero byte packet. The host =
does not issue any transactions (including SOFs). The device detects a =
Suspend condition, reverts to full speed, and waits for resume signalin=
g.
A third failure mode occurs when the host under runs on an ISO OUT and =
the next ISO in the schedule is an ISO OUT with two max packets of 1024=
 bytes each.
The host should issue MDATA for the first OUT followed by DATA1 for the=
 second. However, it drops the MDATA transaction, and issues the DATA1 =
transaction.
The system impact of this bug is the same regardless of the failure mod=
e observed. The host core hangs, the ehci_ctrl state machine waits for =
the protocol engine to send the completion status for the corrupted tra=
nsaction, which never occurs. No indication is sent to the host control=
ler driver, no register bits change and no interrupts occur. Eventually=
 the requesting application times out.
Detailed internal behavior:
The EHCI control state machine (ehci_ctrl) in the DMA block is responsi=
ble for parsing the schedules and initiating all transactions. The ehci=
_ctrl state machine passes the transaction details to the protocol bloc=
k by writing the transaction information in to the TxFIFO. It then asse=
rts the pe_hst_run_pkt signal to inform the host protocol state machine=
 (pe_hst_state) that there is a packet in the TxFIFO.
A tag of 0x0 indicates a start of packet with the data providing the fo=
llowing information:

35:32 Tag
31:30 Reserved
29:23 Endpoint (lowest 4 bits)
22:16 Address
15:10 Reserved
9:8 Endpoint speed
7:6 Endpoint type
5:6 Data Toggle
3:0 PID
The pe_hst_state reads the packet information and constructs the packet=
 and issues it to the PHY interface.
The ehci_ctrl state machine writes the start transaction information in=
 to the TxFIFO as 0x03002910c for the OUT packet that had the under run=
 error. However, it writes 0xC3002910C for the retry of the Out transac=
tion, which is incorrect.
The pe_hst_state enters a bus timeout state after sending the bad CRC f=
or the packet that under ran. It then purges any data that was back fil=
led in to the TxFIFO for the packet that under ran. The pe_hst_state ma=
chine stops purging the TxFIFO when it is empty or if it reads a locati=
on that has a tag of 0x0, indicating a start of packet command.
The pe_hst_state reads 0xC3002910C and discards it as it does not decod=
e to a start of packet command. It continues to purge the OUT data that=
 has been pre-buffered for the OUT retry . The pe_hst_state detects the=
 hst_packet_run signal and attempts to read the PID and address informa=
tion from the TxFIFO. This location has packet data and so does not dec=
ode to a valid PID and so falls through to the PE_HST_SOF_LOAD state wh=
ere the frame_num_counter is updated. The frame_num_counter is updated =
with the data in the TxFIFO. In this case, the data is incorrect as the=
 ehci_ctrl state machine did not initiate the load. The hst_pe_state ma=
chine detects the SOF request signal and sends an SOF with the bad fram=
e number. Meanwhile, the ehci_ctrl state machine waits indefinitely in =
the run_pkt state waiting for the completion status from pe_hst_state m=
achine, which will never happen.
The ISO failure case is similar except that there is no retry for ISO. =
The ehci_ctrl state machine moves to the next transfer in the periodic =
schedule. If the under run occurs on the last entry of the periodic lis=
t then it moves to the Async schedule.
In the case of ISO OUT simulations, the next ISO is a zero byte OUT and=
 again the start of packet command gets corrupted. The TxFIFO is empty =
when the hst_pe_state attempts to read the Address and PID information =
as the transaction is a zero byte packet. This results in the hst_pe_st=
ate machine staying in the GET_PID state, which means that it does not =
issue any transactions (including SOFs). The device detects a Suspend c=
ondition and reverts to full speed mode and waits for a Resume or Reset=
 signal.
The EHCI specification allows a Non-DoubleWord (32 bits) offset to be u=
sed as a current offset for Buffer Pointer Page 0 of the qTD. In Non-Do=
ubleWord aligned cases, the core reads the packet data from the AHB mem=
ory, performs the alignment operation before writing it in to the TxFIF=
O as a 32 bit data word. An End Of Packet tag (EOP) is written to the T=
xFIFO after all the packet data has been written in to the TxFIFO. The =
alignment function is reset to Idle by the EOP tag. The corruption of t=
he start of packet command arises because the packet buffer for the OUT=
 transaction that under ran is not aligned to a DoubleWord, and hence n=
o EOP tag is written to the TxFIFO. The alignment function is still act=
ive when the start packet information is written in to the TxFIFO for t=
he retry of the bulk packet or for the next transaction in the case of =
an under run on an ISO. This results in the corruption of the start tag=
 and the transaction information.
Click for waveform showing the command 0x 0000300291 being written in t=
o the TX FIFO for the Out that under ran.
Click for waveform showing the command 0xC3002910C written to the TxFIF=
O instead of 0x 0000300291
Versions affected: Versions 2.10a and previous versions
How discovered: Customer simulation
Workaround:
1- The EHCI specification allows a non-DoubleWord offset to be used as =
a current offset for Buffer Pointer Page 0 of the qTD. However, if a Do=
ubleWord offset is used then this issue does not arise.
2- Use non streaming mode to eliminate under runs.
Resolution:
The fix involves changes to the traffic state machine in the vusb_hs_dm=
a_traf block. The ehci_ctrl state machine updates the context informati=
on by encoding the transaction results on the hst_op_context_update sig=
nals at the end of a transaction. The signal hst_op_context_update is a=
dded to the traffic state machine, and the tx_fifo_under_ran_r signal i=
s generated if the transaction results in an under run error. Click for=
 waveform
The traffic state machine then traverses to the do_eop states if the tx=
_fifo_under_ran error is asserted. Thus an EOP tag is written in to the=
 TxFIFO as shown in this waveform .
The EOP tag resets the align state machine to the Idle state ensuring t=
hat the next command written by the echi_ctrl state machine does not ge=
t corrupted.
=46ile(s) modified:
RTL code fixed: =E2=80=A6..
Method of reproducing: This failure cannot be reproduced in the current=
 test bench.
Date Found: March 2010
Date Fixed: June 2010
Update information:
Added the RTL code fix

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/chipidea/core.c  | 13 ++++++++++++-
 include/linux/usb/chipidea.h |  5 ++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 9cbb846..38bd036 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -64,6 +64,7 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/regulator/consumer.h>
+#include <linux/usb/ehci_def.h>
=20
 #include "ci.h"
 #include "udc.h"
@@ -413,7 +414,17 @@ static int ci_usb_phy_init(struct ci_hdrc *ci)
  */
 void ci_platform_configure(struct ci_hdrc *ci)
 {
-	if (ci->platdata->flags & CI_HDRC_DISABLE_STREAMING)
+	bool is_device_mode, is_host_mode;
+
+	is_device_mode =3D hw_read(ci, OP_USBMODE, USBMODE_CM) =3D=3D USBMODE=
_CM_DC;
+	is_host_mode =3D hw_read(ci, OP_USBMODE, USBMODE_CM) =3D=3D USBMODE_C=
M_HC;
+
+	if (is_device_mode &&
+		(ci->platdata->flags & CI_HDRC_DISABLE_DEVICE_STREAMING))
+		hw_write(ci, OP_USBMODE, USBMODE_CI_SDIS, USBMODE_CI_SDIS);
+
+	if (is_host_mode &&
+		(ci->platdata->flags & CI_HDRC_DISABLE_HOST_STREAMING))
 		hw_write(ci, OP_USBMODE, USBMODE_CI_SDIS, USBMODE_CI_SDIS);
=20
 	if (ci->platdata->flags & CI_HDRC_FORCE_FULLSPEED) {
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.=
h
index aa49177..982f8cc 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -20,7 +20,6 @@ struct ci_hdrc_platform_data {
 	unsigned long	 flags;
 #define CI_HDRC_REGS_SHARED		BIT(0)
 #define CI_HDRC_SUPPORTS_RUNTIME_PM	BIT(2)
-#define CI_HDRC_DISABLE_STREAMING	BIT(3)
 	/*
 	 * Only set it when DCCPARAMS.DC=3D=3D1 and DCCPARAMS.HC=3D=3D1,
 	 * but otg is not supported (no register otgsc).
@@ -30,6 +29,10 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_FORCE_FULLSPEED		BIT(6)
 #define CI_HDRC_TURN_VBUS_EARLY_ON	BIT(7)
 #define CI_HDRC_SET_NON_ZERO_TTHA	BIT(8)
+#define CI_HDRC_DISABLE_DEVICE_STREAMING	BIT(9)
+#define CI_HDRC_DISABLE_HOST_STREAMING		BIT(10)
+#define CI_HDRC_DISABLE_STREAMING (CI_HDRC_DISABLE_DEVICE_STREAMING |	=
\
+		CI_HDRC_DISABLE_HOST_STREAMING)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
