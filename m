Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CA5C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 14:30:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE0CA20774
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 14:30:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+Snyi0J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMOaU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Aug 2020 10:30:20 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51517 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726334AbgHMOaS (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Aug 2020 10:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597329016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ngrd9iO7gH5kwVen44fh0j9zP/cJbsfrvv+CYGwkKx8=;
        b=I+Snyi0J/Vk+BV9J4CDK36mVGFaWl4BK/oyFhNGbGca4IBXx5vrG8O62woE90gSAprbFRe
        XGWW5ToqYcvxe7VOah48mAheL099jwx1LgL+zcWzMQSHfQ50K5d/6gMJiQyJqXY/TBHRe2
        dUWW1qr4i59B45Mrcrb1pS9wr3r+jdw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-JNiHHzoKPDaJw_QQ4d7c4g-1; Thu, 13 Aug 2020 10:30:14 -0400
X-MC-Unique: JNiHHzoKPDaJw_QQ4d7c4g-1
Received: by mail-ed1-f71.google.com with SMTP id j14so2090782edk.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2020 07:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ngrd9iO7gH5kwVen44fh0j9zP/cJbsfrvv+CYGwkKx8=;
        b=Cjs/Ja/UGqBsV230olgPlxl5GFbSAwJry/w8Zzb091gSuLvckxLNiIRGT1BF+3gQlq
         4bJitcFNQPNEr7Zc3WfRbyFsz2W8JsRFp+verXX13mR7TZx7tZjDgCxd/QK1qKMtBHJq
         0v673c8HhrZ5DJuEDVP2/TlrXBmMZZ4xFHQi5PgakhMUzkXCX4afgfiXS72HDw99fRmm
         vSwsbjsE2JSSdXXDnrnfczwLyNfe44aXZa4ua6anJJUoIFt1D/rxMc9RXzHBrZmWCE+U
         xebaAFPSkKHWUOH5MbVOgCDywxJ4fujkWDj/fPLm7+tfseUWd1uOzUsBm1svEJtJLc2d
         gLIg==
X-Gm-Message-State: AOAM530LwoSL25dsk07tzAR/JdudqRILrdEK0126FEJAud8JIde3zu2u
        g+35jpryck9ochlLxixx4Ky5yx/eDfc4K79CUD9gfuRF4C4mAbXpEHP3Nx4Qh7rea3rd6G8Velo
        ltn0PmdfmUOC4Suh+Qxb9Gg==
X-Received: by 2002:a17:906:4c46:: with SMTP id d6mr5274238ejw.14.1597329013213;
        Thu, 13 Aug 2020 07:30:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaaKNgoio9XPBrxaRtPT1t4xiVfjnoqlFS8zIL5JM+RaUx1LVOb/dIhD12yZxFf1C1j1p/Xw==
X-Received: by 2002:a17:906:4c46:: with SMTP id d6mr5274211ejw.14.1597329012934;
        Thu, 13 Aug 2020 07:30:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id l23sm4181306eje.46.2020.08.13.07.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 07:30:12 -0700 (PDT)
Subject: Re: [PATCH 2/4] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-3-hdegoede@redhat.com>
 <20200727130528.GB883641@kuha.fi.intel.com>
 <469f369a-73f4-c348-b9ee-1662956f45be@redhat.com>
 <20200811143833.GC627773@kuha.fi.intel.com>
 <6c223f20-cf63-392e-f694-869cb231c46d@redhat.com>
 <20200812124955.GB1169992@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <540117aa-1986-f817-654d-168268832086@redhat.com>
Date:   Thu, 13 Aug 2020 16:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812124955.GB1169992@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 8/12/20 2:49 PM, Heikki Krogerus wrote:
> On Wed, Aug 12, 2020 at 10:36:32AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 8/11/20 4:38 PM, Heikki Krogerus wrote:
>>> Hi,
>>>
>>>>>> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
>>>>>> +	const struct typec_altmode_ops *ops, void *drvdata,
>>>>>> +	struct typec_altmode **altmodes, size_t n,
>>>>>> +	struct fwnode_handle *fwnode)
>>>>>> +{
>>>>>> +	struct fwnode_handle *altmodes_node, *child;
>>>>>> +	struct typec_altmode_desc desc;
>>>>>> +	struct typec_altmode *alt;
>>>>>> +	size_t index = 0;
>>>>>> +	u32 svid, vdo;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
>>>>>> +	if (!altmodes_node)
>>>>>> +		return;
>>>>>
>>>>> Do we need that? Why not just make the sub-nodes describing the
>>>>> alternate modes direct children of the connector node instead of
>>>>> grouping them under a special sub-node?
>>>>
>>>> If you envision how this will look in e.g. DTS sources then I think
>>>> you will see that this grouping keeps the DTS source code more
>>>> readable. Grouping things together like this is somewhat normal in
>>>> devicetree files. E.g. PMIC's or other regulator providers typical
>>>> have a "regulators" node grouping all their regulators; and also the OF
>>>> graph bindings which are used in the USB-connector node start with a
>>>> "ports" parent / grouping node.
>>>>
>>>>> If the child node of the connector has device properties "svid" and
>>>>> "vdo" then it is an alt mode that the connector supports, and it can't
>>>>> be anything else, no?
>>>>
>>>> If you want to get rid of the altmodes parent/grouping node, then the
>>>> usual way to do this would be to add a compatible string to the nodes,
>>>> rather then check for the existence of some properties.
>>>
>>> I'm looking at this from ACPI PoW. We do not have compatible string in
>>> ACPI (and in case you are wondering, the _HID PRP0001 is not a
>>> reliable solution for that).
>>
>> Note my main use-case for this is the ACPI case too, remember the
>> infamous drivers/platform/x86/intel_cht_int33fe_typec.c that is my
>> main consumer for this patch. Although there the info is lacking in ACPI
>> so I need to inject it with c-code.
>>
>>> If you wish to group the altmodes under a subnode, then that's fine, but
>>> the "altmodes" node will need to be optional, just like the "ports"
>>> OF-graph node is optional. So we need to be able to support systems
>>> where the alternate mode subnodes are directly under the connector as
>>> well.
>>
>> So for the ports case, AFAIK not having a ports subnode to group them
>> is only used in the case there are no other type of subnodes.
>>
>> With the existing usb-connector devicetree-bindings we will have both
>> ports subnodes and altmode subnodes. The usb-connector devicetree-bindings
>> already specify that the port subnodes *must* be grouped together under
>> a single ports subnode (for usb-connector nodes).
>>
>> So it seems logical and much cleaner to me to also group the altmodes
>> together under an altmodes subnode. This also solves the problem of
>> having to due heuristics to tell different kinds of subnodes apart.
>>
>> Question: why do you write: "we need to be able to support systems
>> where the alternate mode subnodes are directly under the connector as
>> well" are there already systems out there (or on their way) which
>> contain ACPI table which contain a fwnode adhering to the usb-connector
>> bindings + having subnodes which set a svid + vdo ?
> 
> There are indeed platforms on their way, but I'll see if I can still
> influence what goes into the ACPI tables of those platforms.
> 
>> Because unless such systems already exist I don't see why we need to
>> be able to support them ?  New systems can use whatever scheme we
>> can come-up with and unless existing systems already have what we
>> need, except for the altmodes grouping node, then we will need some
>> translating code which generates the expected swnodes anyways and
>> then the translator can easily inject the grouping node.
>>
>> So I do not see why we would " need to be able to support systems
>> where the alternate mode subnodes are directly under the connector as
>> well" ?
>>
>> If you insist I can make the altmodes node optional and simply
>> skip any child nodes which do not have both a svid and a vdo
>> property, but having the subnode (and then logging an error on
>> missing svid or vdo props) seems cleaner to me.
> 
> I'm trying to get the way the USB Type-C connectors are described
> in ACPI (including the alternate modes) documented somewhere.

Yes that would be very good to have.

> I think
> I already mentioned that to you already. There is now a discussion
> with our Windows folks how to move forward with that. In any case,
> additional nodes like that "altmodes" node are really problematic in
> Windows because of way they handle the nodes, and to be honest, I
> don't see any way I could convince those guys to accept it.

Ok.

> But all that is really not your problem. I have now a feeling that the
> way we will end up describing the alternate modes in ACPI will not be
> compatible with DT :-(. So I guess we can just go ahead with this, and
> then add support for ACPI later?

Sounds good. Note my use case is not really DT though, it is software
fw-nodes injected by drivers/platform/x86/intel_cht_int33fe_typec.c
because the ACPI tables on devices do not contain any info on altmodes
at all. I tried to come up with something which works for the DT case
too. But as long as we do not have actual DT users we can actually change
things if necessary since the interface between the injected
software fw-nodes and the typec_port_register_altmodes_from_fwnode()
code parsing it is purely an in kernel interface (*).

Regards,

Hans


*) This stops being purely in kernel once we get actual dts files
using it.

