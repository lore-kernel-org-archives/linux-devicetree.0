From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 04/22] firmware: arm_scmi: add basic driver
 infrastructure for SCMI
Date: Wed, 4 Oct 2017 18:37:22 +0100
Message-ID: <a98be359-64a7-230f-dce7-82c34c83b3c3@arm.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-5-git-send-email-sudeep.holla@arm.com>
 <CAK8P3a06PM-2t4FpnMaj+57Fp6MvZ8KLo2bcLMRVCO8=K92u4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a06PM-2t4FpnMaj+57Fp6MvZ8KLo2bcLMRVCO8=K92u4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 04/10/17 11:59, Arnd Bergmann wrote:
> On Thu, Sep 28, 2017 at 3:11 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> 
>> +/**
>> + * struct scmi_msg_hdr - Message(Tx/Rx) header
>> + *
>> + * @id: The identifier of the command being sent
>> + * @protocol_id: The identifier of the protocol used to send @id command
>> + * @seq: The token to identify the message. when a message/command returns,
>> + *       the platform returns the whole message header unmodified including
>> + *      the token.
>> + */
>> +struct scmi_msg_hdr {
>> +       u8 id;
>> +       u8 protocol_id;
>> +       u16 seq;
>> +       u32 status;
>> +       bool poll_completion;
>> +};
> 
> Is this structure part of the protocol, or just part of the linux
> implementation?
> If this is in the protocol, you should not have a 'bool' member in there, which
> does not have a well-defined binary representation across architectures.
> 

No, it's not part of specification just linux, added to support polling
based DVFS messages.

>> +/*
>> + * The SCP firmware providing SCM interface to OSPM and other agents must
>> + * execute only in little-endian mode as per SCMI specification, so any buffers
>> + * shared through SCMI should have their contents converted to little-endian
>> + */
> 
> That is a very odd thing to put into a specification, are you sure it requires
> a specific runtime endian-mode? I would bet that it only requires the protocol
> to use little-endian data, so better describe it like that.
> 

Right, my bad. Not sure where I copied that text from, but as you
mention specification just expects data to be in LE format.

[..]

> 
>> +#if IS_REACHABLE(CONFIG_ARM_SCMI_PROTOCOL)
>> +int scmi_handle_put(const struct scmi_handle *handle);
>> +const struct scmi_handle *scmi_handle_get(struct device *dev);
>> +const struct scmi_handle *devm_scmi_handle_get(struct device *dev);
> 
> IS_REACHABLE() can easily lead to confusion when the driver is
> a loadable module but never gets used by a built-in driver. Maybe use
> IS_ENABLED() here, and add a Kconfig symbol that other drivers
> can depend on if you want them to optionally use it, like:
> 
> config MAYBE_ARM_SCMI_PROTOCOL
>         default y if ARM_SCMI_PROTOCOL=n
>         default ARM_SCMI_PROTOCOL

OK, will check, we may not need that yet.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
