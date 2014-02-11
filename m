From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS files.
Date: Wed, 12 Feb 2014 00:43:35 +0100
Message-ID: <52FAB5A7.7080208@gmail.com>
References: <OF784BA598.ACFE9DA4-ONCA257C76.00827472-CA257C77.000BCFAD@csc.com> <20140206082635.GA7048@visitor2.iram.es> <OFA4C1AF9F.B23E83EC-ONCA257C78.00044235-CA257C78.00080D50@csc.com> <20140207101036.GA823@visitor2.iram.es> <alpine.LRH.2.00.1402071348380.10318@ra8135-ec1.am.freescale.net> <20140210110342.GA15806@visitor2.iram.es> <alpine.LRH.2.00.1402101056410.10318@ra8135-ec1.am.freescale.net> <20140211072606.GA26514@visitor2.iram.es> <OF6F6A0029.3B20EF5B-ONCA257C7C.0071BFDA-CA257C7C.00732AD3@csc.com> <63AEBD99-AA87-4FD7-BBDA-0CE419959F14@kernel.crashing.org> <52FAA97F.4060600@gmail.com> <OFB203CA90.B048F8AA-ONCA257C7C.0081A816-CA257C7C.0081DCE3@csc.com>
Content-Type: multipart/mixed;
 boundary="------------020000010007060001030309"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <OFB203CA90.B048F8AA-ONCA257C7C.0081A816-CA257C7C.0081DCE3-SmukeSwxQOQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------020000010007060001030309
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/12/2014 12:38 AM, Stephen N Chivers wrote:
> Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote on
>> On 02/11/2014 11:33 PM, Kumar Gala wrote:
>>> On Feb 11, 2014, at 2:57 PM, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org> wrote:
>>>> I have been trial booting a 3.14-rc2 kernel for a 85xx platform
>>>> (dtbImage).
[...]
>>>>
>>>> of_serial f1004500.serial: Unknown serial port found, ignored.
>>>>
>>>> The serial nodes in boards dts file are specified as:
>>>>
>>>>          serial0: serial@4500 {
>>>>                          cell-index = <0>;
>>>>                          device_type = "serial";
>>>>                          compatible = "fsl,ns16550", "ns16550";
>>>>                          reg = <0x4500 0x100>;
>>>>                          clock-frequency = <0>;
>>>>                          interrupts = <0x2a 0x2>;
>>>>                          interrupt-parent = <&mpic>;
>>>>                  };
>>>
>>> Wondering if this caused the issue:
>>>
>>> commit 105353145eafb3ea919f5cdeb652a9d8f270228e
>>> Author: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Date:   Tue Dec 3 14:52:00 2013 +0100
>>>
>>>       OF: base: match each node compatible against all given matches first
>>
[...]
>>
>> I don't think the missing compatible is causing it, but of_serial
>> provides a DT match for .type = "serial" just to fail later on
>> with the error seen above.
>>
>> The commit in question reorders of_match_device in a way that match
>> table order is not relevant anymore. This can cause it to match
>> .type = "serial" first here.
>>
>> Rather than touching the commit, I suggest to remove the problematic
>> .type = "serial" from the match table. It is of no use anyway.
> Deleting the "serial" line from the match table fixes the problem.
> I tested it for both orderings of compatible.

I revert my statement about removing anything from of_serial.c. Instead
we should try to prefer matches with compatibles over type/name without
compatibles. Something like the patch below (compile tested only)






--------------020000010007060001030309
Content-Type: text/x-patch;
 name="of_base_match.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="of_base_match.patch"

diff --git a/drivers/of/base.c b/drivers/of/base.c
index ff85450d5683..60da53b385ff 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -734,6 +734,7 @@ static
 const struct of_device_id *__of_match_node(const struct of_device_id *matches,
 					   const struct device_node *node)
 {
+	const struct of_device_id *m;
 	const char *cp;
 	int cplen, l;
 
@@ -742,15 +743,15 @@ const struct of_device_id *__of_match_node(const struct of_device_id *matches,
 
 	cp = __of_get_property(node, "compatible", &cplen);
 	do {
-		const struct of_device_id *m = matches;
+		m = matches;
 
 		/* Check against matches with current compatible string */
 		while (m->name[0] || m->type[0] || m->compatible[0]) {
 			int match = 1;
-			if (m->name[0])
+			if (m->name[0] && m->compatible[0])
 				match &= node->name
 					&& !strcmp(m->name, node->name);
-			if (m->type[0])
+			if (m->type[0] && m->compatible[0])
 				match &= node->type
 					&& !strcmp(m->type, node->type);
 			if (m->compatible[0])
@@ -770,6 +771,21 @@ const struct of_device_id *__of_match_node(const struct of_device_id *matches,
 		}
 	} while (cp && (cplen > 0));
 
+	/* Check against matches without compatible string */
+	m = matches;
+	while (m->name[0] || m->type[0]) {
+		int match = 1;
+		if (m->name[0])
+			match &= node->name
+				&& !strcmp(m->name, node->name);
+		if (m->type[0])
+			match &= node->type
+				&& !strcmp(m->type, node->type);
+		if (match)
+			return m;
+		m++;
+	}
+
 	return NULL;
 }
 

--------------020000010007060001030309--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
