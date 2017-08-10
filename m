From: Corey Minyard <tcminyard@gmail.com>
Subject: Re: [PATCH v2 0/4] ipmi: bt-i2c: added IPMI Block Transfer over I2C
Date: Wed, 9 Aug 2017 21:26:40 -0500
Message-ID: <9c0aef7c-6dcc-2328-f712-d35ef81ebc41@gmail.com>
References: <20170805011855.1027-1-brendanhiggins@google.com>
 <8f5579cb-2c4d-2cd0-e874-a44374e08417@acm.org>
 <CAFd5g46LmyjPnjKis7c-F9FbjzyU1MgvrVkR7vjrEC4oWV1doQ@mail.gmail.com>
 <fd82d68b-0ca4-fa43-4ed4-e18f684f6dee@acm.org>
 <CAFd5g47FmTiygHDjm0-h2NAz8qa85zZVLKgCf9vGYP8iK6_+ZQ@mail.gmail.com>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------47B7031DEBBC6A1C1BCC5C0B"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFd5g47FmTiygHDjm0-h2NAz8qa85zZVLKgCf9vGYP8iK6_+ZQ@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>, Corey Minyard <minyard@acm.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Benjamin Fair <benjaminfair@google.com>, linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, openipmi-developer@lists.sourceforge.net, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------47B7031DEBBC6A1C1BCC5C0B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2017 08:04 PM, Brendan Higgins wrote:
>> Perhaps that is some level of abuse, but it's pretty common.  I'm not
>> against it.
>>
>> There is standard IPMI firmware NetFN (though no commands defined) that if
>> you use
>> the driver automatically goes into "Maintenance mode" and modified the
>> timeouts
>> and handling to some extent to help with this.
> That is a really good point, I missed that.
> ...
>>
>> There are ways to accomplish this that aren't that complex.  You can create
>> an OEM
>> command that can query the maximum message size and the ability to do
>> sequence
>> numbers in the messages.
>>
>> If messages larger than 32-bytes are supported, and the host I2C/SMBus
>> driver
>> supports it, you could use the standard SSIF SMBus commands to do this, they
>> have an 8-bit length field.
>>
>> If sequence numbers are supported, The SSIF could use different SMBus
>> commands
>> to do the write and read requests.  Since this is only if you get an OEM
>> command,
>> and if you put the sequence numbers at the end where they are easy to add on
>> the send side, this is a small change to the driver.
> What if we just had an OEM command that changed the message structure from
> that point on? We could abuse the "maintenance mode" NetFN to get back into
> normal SSIF if necessary.

Actually, I wouldn't have a separate "openbmc mode".  I would have 
OpenBMC always
work with standard SSIF, and have separate SMBus commands for messages with
the sequence number and messages larger than 32 bytes.

I've attached a patch with what I would expect the changes to be to the 
host driver.
It doesn't handle multiple outstanding messages, but it shows what 
detection and a
separate SMBus command would look like.

>> So I think the changes would be small and contained.  I'm actually ok with a
>> different driver, but I think it would be more valuable to the OpenBMC
>> project
>> to have a standardized interface that would work (in a not quite as
>> efficient
>> mode) with software that does not use the Linux IPMI driver.
> I guess I see the all of my asks as hacky things which we can hopefully remove
> at some point. Hopefully, most OpenBMC users won't want or need these things.
> ...
>>> Regardless of what we do with the "BT-I2C" stuff, I am still interested in
>>> what
>>> you think about this.
>>
>> I think you are right, it probably belongs some place else.  The way that
>> makes the most
>> sense to me would be to have an "ipmi" directory with a "host" and "slave"
>> side, and since
>> ipmi is not really a char driver, to move it to the main driver directory.
>> That might be
>> fairly disruptive, though.
> That was my thinking exactly.
>
>> The other option that makes sense to me would be to add a
>> drivers/char/ipmi_slave directory,
>> or something like that, and put the slave code there.  That would be less
>> disruptive.
> Right that is the approach I took, except I called it drivers/char/ipmi_bmc.
>
> I originally thought doing the less disruptive thing is best; however, I know
> there are also some OpenBMC people who are interested in implementing
> IPMB. So maybe now is the time to bite the bullet and create an ipmi
> directory under drivers/.

I'm not sure IPMB would make much difference, there's no host side 
change as it's
already supported.  I don't think there would be any significant code 
sharing
between the two.

If there end up being a significant amount of common code, then it would
definitely be worth the effort to move it.

>> -corey
> In summary, I think I can live with making it a mangled form of SSIF, but
> I would prefer to put it in its own driver.

You can look at the patch and consider it, and consider that you would 
need to
implement flag and event handling.  On an x86 host there would be SMBIOS
and ACPI stuff to deal with somehow for discovery.  There's probably few 
other
things to deal with.

> In any case, I think I would rather focus on the the BMC side IPMI framework
> now, since it is a bigger change and would also reduce the work of
> implementing a BMC side SSIF driver.
>
> Here is what I propose: we focus on the BMC side IPMI framework RFC that
> I sent out the other day:
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1463473.html
> I will add a change to the BMC side IPMI framework patchset to move all the
> IPMI stuff to the new drivers/ipmi directory as discussed and then drop the
> patch in that patchset that depends on this patchset.
>
> Let me know what you think

Let's hold off on the new directory, there's probably some convincing of 
the "powers
that be" for that.

I'll look at the patch set tomorrow, unless something critical comes up.

Thanks,

-corey


--------------47B7031DEBBC6A1C1BCC5C0B
Content-Type: text/x-patch;
 name="ssif-openbmc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ssif-openbmc.patch"

diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index 11237e8..d467b1a 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -60,6 +60,11 @@
 
 #define IPMI_GET_SYSTEM_INTERFACE_CAPABILITIES_CMD	0x57
 
+static u8 openbmc_iana[3] = { 0x10, 0x20, 0x30 };
+#define IPMI_OPENBMC_CAPABILITY_REQUEST_CMD	0x01
+#define SSIF_OPENBMC_REQUEST	0x80
+#define SSIF_OPENBMC_RESPONSE	0x81
+
 #define	SSIF_IPMI_REQUEST			2
 #define	SSIF_IPMI_MULTI_PART_REQUEST_START	6
 #define	SSIF_IPMI_MULTI_PART_REQUEST_MIDDLE	7
@@ -224,6 +229,12 @@ struct ssif_info {
 	bool		    supports_alert;
 
 	/*
+	 * OpenBMC mode, with large message and sequence number
+	 * support.  An int because we use it as a number, too.
+	 */
+	unsigned int	    is_openbmc;
+
+	/*
 	 * Used to tell what we should do with alerts.  If we are
 	 * waiting on a response, read the data immediately.
 	 */
@@ -537,12 +548,13 @@ static void msg_done_handler(struct ssif_info *ssif_info, int result,
 static void start_get(struct ssif_info *ssif_info)
 {
 	int rv;
+	int command = ssif_info->is_openbmc ? SSIF_OPENBMC_RESPONSE :
+			SSIF_IPMI_RESPONSE;
 
 	ssif_info->rtc_us_timer = 0;
 	ssif_info->multi_pos = 0;
 
-	rv = ssif_i2c_send(ssif_info, msg_done_handler, I2C_SMBUS_READ,
-			  SSIF_IPMI_RESPONSE,
+	rv = ssif_i2c_send(ssif_info, msg_done_handler, I2C_SMBUS_READ, command,
 			  ssif_info->recv, I2C_SMBUS_BLOCK_DATA);
 	if (rv < 0) {
 		/* request failed, just return the error. */
@@ -611,7 +623,8 @@ static void msg_done_handler(struct ssif_info *ssif_info, int result,
 	 * start messing with driver states or the queues.
 	 */
 
-	if (result < 0) {
+	if (result < 0 || len < 3) {
+	ignore_msg:
 		ssif_info->retries_left--;
 		if (ssif_info->retries_left > 0) {
 			ssif_inc_stat(ssif_info, receive_retries);
@@ -633,7 +646,13 @@ static void msg_done_handler(struct ssif_info *ssif_info, int result,
 		goto continue_op;
 	}
 
-	if ((len > 1) && (ssif_info->multi_pos == 0)
+	if (ssif_info->is_openbmc) {
+		if (len < 4)
+			goto ignore_msg;
+		/* Eventually extract sequence number from data[0]. */
+		data++;
+		len--;
+	} else if ((len > 1) && (ssif_info->multi_pos == 0)
 				&& (data[0] == 0x00) && (data[1] == 0x01)) {
 		/* Start of multi-part read.  Start the next transaction. */
 		int i;
@@ -966,7 +985,11 @@ static int start_resend(struct ssif_info *ssif_info)
 
 	ssif_info->got_alert = false;
 
-	if (ssif_info->data_len > 32) {
+	if (ssif_info->is_openbmc) {
+		ssif_info->multi_data = NULL;
+		command = SSIF_OPENBMC_REQUEST;
+		ssif_info->data[0] = ssif_info->data_len;
+	} else if (ssif_info->data_len > 32) {
 		command = SSIF_IPMI_MULTI_PART_REQUEST_START;
 		ssif_info->multi_data = ssif_info->data;
 		ssif_info->multi_len = ssif_info->data_len;
@@ -1000,7 +1023,11 @@ static int start_send(struct ssif_info *ssif_info,
 		return -E2BIG;
 
 	ssif_info->retries_left = SSIF_SEND_RETRIES;
-	memcpy(ssif_info->data + 1, data, len);
+	memcpy(ssif_info->data + 1 + ssif_info->is_openbmc, data, len);
+	if (ssif_info->is_openbmc) {
+		ssif_info->data[1] = 0; /* Sequence number eventually. */
+		len++;
+	}
 	ssif_info->data_len = len;
 	return start_resend(ssif_info);
 }
@@ -1507,7 +1534,7 @@ static struct ipmi_fw_revision_range ssif_broken_alert_bmcs[] = {
 
 static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
-	unsigned char     msg[3];
+	unsigned char     msg[6];
 	unsigned char     *resp;
 	struct ssif_info   *ssif_info;
 	int               rv = 0;
@@ -1643,6 +1670,24 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		ssif_info->supports_pec = 0;
 	}
 
+	msg[0] = IPMI_NETFN_OEM_GROUP_REQUEST << 2;
+	msg[1] = IPMI_OPENBMC_CAPABILITY_REQUEST_CMD;
+	memcpy(msg, openbmc_iana, sizeof(openbmc_iana));
+	rv = do_cmd(client, 5, msg, &len, resp);
+	if (!rv && (len >= 3) && (resp[2] == 0)) {
+		/* It appears we have an OpenBMC device. */
+
+		/* Turn of multi support. */
+		ssif_info->multi_support = SSIF_NO_MULTI;
+		ssif_info->max_xmit_msg_size = 32;
+		ssif_info->max_recv_msg_size = 32;
+		if (len > 3)
+			ssif_info->max_xmit_msg_size = resp[3];
+		if (len > 4)
+			ssif_info->max_recv_msg_size = resp[4];
+		ssif_info->is_openbmc = 1;
+	}
+
 	/* Make sure the NMI timeout is cleared. */
 	msg[0] = IPMI_NETFN_APP_REQUEST << 2;
 	msg[1] = IPMI_CLEAR_MSG_FLAGS_CMD;
diff --git a/include/uapi/linux/ipmi_msgdefs.h b/include/uapi/linux/ipmi_msgdefs.h
index df97e6e..bb0af2e 100644
--- a/include/uapi/linux/ipmi_msgdefs.h
+++ b/include/uapi/linux/ipmi_msgdefs.h
@@ -71,6 +71,9 @@
 #define IPMI_NETFN_FIRMWARE_REQUEST		0x08
 #define IPMI_NETFN_FIRMWARE_RESPONSE		0x09
 
+#define IPMI_NETFN_OEM_GROUP_REQUEST		0x2e
+#define IPMI_NETFN_OEM_GROUP_RESPONSE		0x2f
+
 /* The default slave address */
 #define IPMI_BMC_SLAVE_ADDR	0x20
 

--------------47B7031DEBBC6A1C1BCC5C0B--
