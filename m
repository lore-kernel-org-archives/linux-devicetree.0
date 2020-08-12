Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60126C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 08:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C6FC207DE
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 08:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="emENPMus"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgHLIgh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 04:36:37 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26163 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726595AbgHLIgh (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Aug 2020 04:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597221395;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aU3HA05Op9nzcUSBykYGFF9yu8Zbve2PUKHl7lE6dBg=;
        b=emENPMusZRTkSjmOF/e+xa0iadalLoSLMMdp0LcFh4JnFwSzwLE1W2Jz1yAOM26kNfdGou
        zkqbSmlm48cF6obbCKS7lO+0DP6FzVS1/QS6FwtRsypqBNRgiPlCfy/7bGmmbLx38BngTh
        3Sr1SN8LlANZTF/+jhvuuoHNffNr72A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-JGdFyCEvN5W2MRWkYyR8Ng-1; Wed, 12 Aug 2020 04:36:33 -0400
X-MC-Unique: JGdFyCEvN5W2MRWkYyR8Ng-1
Received: by mail-ed1-f70.google.com with SMTP id dd25so574859edb.6
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 01:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aU3HA05Op9nzcUSBykYGFF9yu8Zbve2PUKHl7lE6dBg=;
        b=H9og+TQR6qTZKzwowCLL4w2jOcU8auhsbjfiBQg6Ea36xah/diQP54CCu6LvtVollc
         jtZHXO5Yup1fC3WlcXZd2D57UV9aJhhygNQZojeismeTk5llHxmli7MXAyCyL7hrlxec
         ms5nI9w2AHeMeeP/JAJCFni+84JX7RWm8db8p0MWt68aU9CrIO5BYug/e6fXWwC0yFv5
         gvLuT5kVr0zcQ02+FjV5Ol7IX7Tq8roaDiywN1JuSS08B8xRqnp0T7UJxnmHUGUX4kfX
         9i9LtLVtuobb2S3V6sbfzpA+zkDWpJj0oSL18ZW3D0aflKmC4HooJIpwvdce2tyhgLk0
         yUWQ==
X-Gm-Message-State: AOAM531jzm4nqhLHKmNxznF2oGEq4DrjPaHU5qnD2WoazB+vTASqYIYZ
        SIv8MH3zVgazapmSlimQ8n9QP3JuSEV824EvpHgGGd5NH0AGxGvpbkt/q/x/jNvVve61VLLZHUV
        nJb0hVJgt11ximqhHnshf9w==
X-Received: by 2002:a05:6402:297:: with SMTP id l23mr30203804edv.145.1597221391967;
        Wed, 12 Aug 2020 01:36:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh/5kSwjj/FYRqmKuTksRnhIu5O95ZxYv36KmlTRtltj5MECUob6P2g/bPGbyE7hOrqnAwhg==
X-Received: by 2002:a05:6402:297:: with SMTP id l23mr30203784edv.145.1597221391741;
        Wed, 12 Aug 2020 01:36:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id d2sm710992ejm.19.2020.08.12.01.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 01:36:30 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c223f20-cf63-392e-f694-869cb231c46d@redhat.com>
Date:   Wed, 12 Aug 2020 10:36:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811143833.GC627773@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 8/11/20 4:38 PM, Heikki Krogerus wrote:
> Hi,
> 
>>>> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
>>>> +	const struct typec_altmode_ops *ops, void *drvdata,
>>>> +	struct typec_altmode **altmodes, size_t n,
>>>> +	struct fwnode_handle *fwnode)
>>>> +{
>>>> +	struct fwnode_handle *altmodes_node, *child;
>>>> +	struct typec_altmode_desc desc;
>>>> +	struct typec_altmode *alt;
>>>> +	size_t index = 0;
>>>> +	u32 svid, vdo;
>>>> +	int ret;
>>>> +
>>>> +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
>>>> +	if (!altmodes_node)
>>>> +		return;
>>>
>>> Do we need that? Why not just make the sub-nodes describing the
>>> alternate modes direct children of the connector node instead of
>>> grouping them under a special sub-node?
>>
>> If you envision how this will look in e.g. DTS sources then I think
>> you will see that this grouping keeps the DTS source code more
>> readable. Grouping things together like this is somewhat normal in
>> devicetree files. E.g. PMIC's or other regulator providers typical
>> have a "regulators" node grouping all their regulators; and also the OF
>> graph bindings which are used in the USB-connector node start with a
>> "ports" parent / grouping node.
>>
>>> If the child node of the connector has device properties "svid" and
>>> "vdo" then it is an alt mode that the connector supports, and it can't
>>> be anything else, no?
>>
>> If you want to get rid of the altmodes parent/grouping node, then the
>> usual way to do this would be to add a compatible string to the nodes,
>> rather then check for the existence of some properties.
> 
> I'm looking at this from ACPI PoW. We do not have compatible string in
> ACPI (and in case you are wondering, the _HID PRP0001 is not a
> reliable solution for that).

Note my main use-case for this is the ACPI case too, remember the
infamous drivers/platform/x86/intel_cht_int33fe_typec.c that is my
main consumer for this patch. Although there the info is lacking in ACPI
so I need to inject it with c-code.

> If you wish to group the altmodes under a subnode, then that's fine, but
> the "altmodes" node will need to be optional, just like the "ports"
> OF-graph node is optional. So we need to be able to support systems
> where the alternate mode subnodes are directly under the connector as
> well.

So for the ports case, AFAIK not having a ports subnode to group them
is only used in the case there are no other type of subnodes.

With the existing usb-connector devicetree-bindings we will have both
ports subnodes and altmode subnodes. The usb-connector devicetree-bindings
already specify that the port subnodes *must* be grouped together under
a single ports subnode (for usb-connector nodes).

So it seems logical and much cleaner to me to also group the altmodes
together under an altmodes subnode. This also solves the problem of
having to due heuristics to tell different kinds of subnodes apart.

Question: why do you write: "we need to be able to support systems
where the alternate mode subnodes are directly under the connector as
well" are there already systems out there (or on their way) which
contain ACPI table which contain a fwnode adhering to the usb-connector
bindings + having subnodes which set a svid + vdo ?

Because unless such systems already exist I don't see why we need to
be able to support them ?  New systems can use whatever scheme we
can come-up with and unless existing systems already have what we
need, except for the altmodes grouping node, then we will need some
translating code which generates the expected swnodes anyways and
then the translator can easily inject the grouping node.

So I do not see why we would " need to be able to support systems
where the alternate mode subnodes are directly under the connector as
well" ?

If you insist I can make the altmodes node optional and simply
skip any child nodes which do not have both a svid and a vdo
property, but having the subnode (and then logging an error on
missing svid or vdo props) seems cleaner to me.

Regards,

Hans

