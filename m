From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 18/30] nfc: st-nci: Add support for proprietary commands
 for factory tests
Date: Sat, 24 Oct 2015 14:19:03 +0200
Message-ID: <562B7737.6000106@gmail.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
 <1445377701-8353-19-git-send-email-christophe-h.ricard@st.com>
 <20151024064835.GD23609@zurbaran.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151024064835.GD23609-nKCvNrh56OoJmsy6czSMtA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

On 24/10/2015 08:48, Samuel Ortiz wrote:
> Hi Christophe,
>
> Just a couple of nitpicks:
>
> On Tue, Oct 20, 2015 at 11:48:09PM +0200, Christophe Ricard wrote:
>> diff --git a/drivers/nfc/st-nci/Makefile b/drivers/nfc/st-nci/Makefile
>> index 348ce76..60e569b 100644
>> --- a/drivers/nfc/st-nci/Makefile
>> +++ b/drivers/nfc/st-nci/Makefile
>> @@ -2,7 +2,7 @@
>>   # Makefile for ST21NFCB NCI based NFC driver
>>   #
>>   
>> -st-nci-objs = ndlc.o core.o st-nci_se.o
>> +st-nci-objs = ndlc.o core.o st-nci_se.o st-nci_vendor_cmds.o
> Please rename that file to vendor_cmds.c.
> I pushed a change to rename st-nci_se.c to se.c already, to keep the
> file names consistent there.
I think your latest change introduced a build break :(. The log message 
mention also MFC instead of NFC ;).

"In file included from drivers/nfc/st-nci/ndlc.c:23:0:
drivers/nfc/st-nci/st-nci.h:22:23: fatal error: st-nci_se.h: No such 
file or directory
#include "st-nci_se.h""
I will send a fix in the v2 ;).

>
>>   obj-$(CONFIG_NFC_ST_NCI)     += st-nci.o
>>   
>>   st-nci_i2c-objs = i2c.o
>> diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
>> index c419d39..fd2a5ca 100644
>> --- a/drivers/nfc/st-nci/core.c
>> +++ b/drivers/nfc/st-nci/core.c
>> @@ -25,6 +25,7 @@
>>   
>>   #include "st-nci.h"
>>   #include "st-nci_se.h"
>> +#include "st-nci_vendor_cmds.h"
> Ditto: Please rename it to vendor_cmds.h.
Don't you think it would be better for headers to either:
- merge st-nci_se.h and st-nci_vendor_cmds.h in st-nci.h
- or keep st-nci_ prefix for header files only.
Which option do you prefer ?

I have no concern to remove the st-nci prefix and the st21nfca for .c 
file in their respective directory.
>
>> +void st_nci_hci_loopback_event_received(struct nci_dev *ndev, u8 event,
>> +					struct sk_buff *skb)
>> +{
>> +	struct st_nci_info *info = nci_get_drvdata(ndev);
>> +
>> +	switch (event) {
>> +	case ST_NCI_EVT_POST_DATA:
>> +		info->vendor_info.rx_skb = skb;
>> +
>> +		complete(&info->vendor_info.req_completion);
>> +	break;
>> +	}
> Wouldn't it make sense to complete regardless of the event you're
> receiving ?
> Since you're checking for rx_skb after the completion, it's safe and
> would prevent you from being stuck waiting for the right event in the
> below routine.
The only reason for receiving a EVT_POST_DATA from the CLF loopback gate 
should come from a
previous EVT_POST_DATA sent from the Device Host.
The loopback gate is a standard hci echo test mechanism.

Also, according to etsi 102 622 and ST implementation, the loopback gate 
only support EVT_POST_DATA.

I believe a "complete regardless of the event" we are receiving (on the 
loopback gate) may hide a CLF firmware bug and should not happen...

Are you in favour of hiding a potential bug ?

[snip]

Best Regards
Christophe
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
