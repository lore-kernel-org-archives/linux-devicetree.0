From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 03/20] firmware: arm_scmi: add basic driver
 infrastructure for SCMI
Date: Wed, 8 Nov 2017 16:33:41 +0000
Message-ID: <d51a66a0-9272-ff93-ff99-28d0928950a8@arm.com>
References: <1509720477-18936-1-git-send-email-sudeep.holla@arm.com>
 <1509720477-18936-4-git-send-email-sudeep.holla@arm.com>
 <CABb+yY0KR7rzUSqrG7vPJDZONK3rXtk03WX2eTGAdmkpvTUEbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY0KR7rzUSqrG7vPJDZONK3rXtk03WX2eTGAdmkpvTUEbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On 04/11/17 11:51, Jassi Brar wrote:
> On Fri, Nov 3, 2017 at 8:17 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> 
> .....
> 
>> +int scmi_do_xfer(const struct scmi_handle *handle, struct scmi_xfer *xfer)
>> +{
>> +       int ret;
>> +       int timeout;
>> +       struct scmi_info *info = handle_to_scmi_info(handle);
>> +       struct device *dev = info->dev;
>> +
>> +       ret = mbox_send_message(info->tx_chan, xfer);
>>                                                                           ^^^^^^^^
> The call still remains unchanged and broken.
> https://lkml.org/lkml/2017/7/24/502
> 

Yes, since you are in favor of abstraction on top of mailbox while Arnd,
Bjorn, and me prefer to deal with that in mailbox framework itself, I
thought I will keep that discussion separate and get the remaining parts
of SCMI reviewed.

I have not forgotten about it, just trying to keep it separate. Sorry, I
could have been more specific.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
