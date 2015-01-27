From: "christophe.ricard" <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 27/34] NFC: st21nfcb: Add HCI protocol over NCI protocol
 support
Date: Tue, 27 Jan 2015 23:16:32 +0100
Message-ID: <54C80E40.7020707@gmail.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com> <1418072919-10535-28-git-send-email-christophe-h.ricard@st.com> <20150127004958.GB31396@ribalta.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150127004958.GB31396-41CF7WKNp/FoDWY/xQGDymt3HXsI98Cx0E9HWUfgJXw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

The main reason for making an st21nfcb_hci_core is because the hci 
network initialization procedure is proprietary.
It is almost using only NCI standard commands but some id's and commands 
could be proprietary.

I would ideally rely on the hci core framework but i run out of idea 
when trying this.
However i think "exporting the relevant API for drivers to send HCI 
commands/events through their NCI connections."
is a good idea i need to dig into. It will then needs to hci/nci hook 
for the proprietary stuff.

I have just one worry, when do you think those updates (patch 20 & 27) 
needs to be ready for your 3.20 pull request ?

Best Regards
Christophe
On 27/01/2015 01:49, Samuel Ortiz wrote:
> Christophe,
>
> On Mon, Dec 08, 2014 at 10:08:32PM +0100, Christophe Ricard wrote:
>> Some st21nfcb features are only available through HCI commands. Those
>> HCI commands can be address over NCI by sending data using a dynamic
>> conn_id. This is useful for example for Secure Element communication.
>>
>> The HCI core brings the minimal HCI functions required to communicate with
>> a secure element.
>>
>> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
>> ---
>>   drivers/nfc/st21nfcb/Makefile            |   2 +-
>>   drivers/nfc/st21nfcb/st21nfcb_hci_core.c | 783 +++++++++++++++++++++++++++++++
>>   drivers/nfc/st21nfcb/st21nfcb_hci_core.h | 134 ++++++
>>   3 files changed, 918 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/nfc/st21nfcb/st21nfcb_hci_core.c
>>   create mode 100644 drivers/nfc/st21nfcb/st21nfcb_hci_core.h
> I may be missing some details, but I believe most of this code could be
> made part of the core NCI implementation. I don't mind creating an
> hci_dev from there and exporting the relevant API for drivers to send
> HCI commands/events through their NCI connections.
> You would not need to bring chunks of the HCI core into a driver, and
> as a side effect, patch #21 would no longer be needed.
>
> Cheers,
> Samuel.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
