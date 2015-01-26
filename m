From: "christophe.ricard" <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 04/34] NFC: st21nfca: Remove unreachable code
Date: Tue, 27 Jan 2015 00:07:48 +0100
Message-ID: <54C6C8C4.4010807@gmail.com>
References: <1418072919-10535-1-git-send-email-christophe-h.ricard@st.com> <1418072919-10535-5-git-send-email-christophe-h.ricard@st.com> <20150126011001.GB28592@ribalta.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150126011001.GB28592-41CF7WKNp/FoDWY/xQGDymt3HXsI98Cx0E9HWUfgJXw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Samuel,

Unless i misunderstood the code i thought that skb is freed once used by 
an event_received hook.

For example if skb is relevant for st21nfca event_received hook, it will 
return 0. We then jump to exit_noskb in nfc_hci_event_received.
In st21nfca_dep_event_received, r = 0 is never changed or only for case 
ST21NFCA_EVT_SEND_DATA.

In case skb is not relevant for st21nfca event_received hook, it will 
return a value > 0. I have choosen 1. This way, nfc_hci_event_received
will continue to check for relevant event (aka: 
NFC_HCI_EVT_TARGET_DISCOVERED) and will then free the current skb.

So i am don't think  my there is an error in st21nfca_dep_event_received 
or there is one in nfc_hci_event_received as well ?

What do you think ?

Best Regards
Christophe

On 26/01/2015 02:10, Samuel Ortiz wrote:
> Hi Christophe,
>
> On Mon, Dec 08, 2014 at 10:08:09PM +0100, Christophe Ricard wrote:
>> kfree_skb(skb) in st21nfca_hci_event_received is never reach.
>>
>> Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
>> ---
>>   drivers/nfc/st21nfca/st21nfca.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
>> index f2596c8..880193b 100644
>> --- a/drivers/nfc/st21nfca/st21nfca.c
>> +++ b/drivers/nfc/st21nfca/st21nfca.c
>> @@ -845,8 +845,6 @@ static int st21nfca_hci_event_received(struct nfc_hci_dev *hdev, u8 gate,
>>   	default:
>>   		return 1;
>>   	}
>> -	kfree_skb(skb);
>> -	return 0;
> That make sense to me, but while looking at this function, I think your
> skb free in st21nfca_dep_event_received() is incorrect.
> The HCI core manages the SKBs it sends and frees this skb.
>
> Cheers,
> Samuel.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
