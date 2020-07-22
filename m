Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814A0C433E6
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 07:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C789206F5
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 07:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TQhpq9XZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731452AbgGVHSN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 03:18:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54053 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730351AbgGVHSM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jul 2020 03:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595402290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gtsyT4mz+LNAUNpKdG4kBHqIVduUS0Y9Bmc1QqpE/F8=;
        b=TQhpq9XZns6pUWHmcC8ojfVkrjuehr4G8YJEIb27s3q3qzP3mztlgAzySqlf5o33+SKOw0
        qSRfmOi/0m2jrE9NmeKY4ni2jLlvKU8Z1AI86Y6wwa94ILROX6iIEY0i7U3soc8npew2ED
        cSzorXISLTeQgkWM103RWNBTNqiO0so=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-w9wrKJIBML6gua-2ym4aRA-1; Wed, 22 Jul 2020 03:18:05 -0400
X-MC-Unique: w9wrKJIBML6gua-2ym4aRA-1
Received: by mail-ej1-f72.google.com with SMTP id op28so641514ejb.15
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 00:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gtsyT4mz+LNAUNpKdG4kBHqIVduUS0Y9Bmc1QqpE/F8=;
        b=cIcKoTWHVyPX+ddzrr9VNlL5IHsr4E59Ga6fB/0xbyXDmT/APZsHvsdR+7+8xDkya4
         rSRs2lCw1pgVnpSwd8sAV9bmj5LQ8ox0eKWSsXxkNYWVQq+iFG7Jp6V+RjGQPfANqqXH
         p/N3aLvgojhFlvg8rdDKUOlZpORr3nr51AMgPi048bF/wxXzWwwJy0p/P2WqZsCnk03b
         3I38+9+Jlpuu9w7nfKcEkG+ESC1w9H/xlXYBpe78Xa7kuF1F86ZbdvtutEB67TimjWpn
         eG+XWXTCsZv6VnFTPIV9GQszWmi2OTY3gpRtVVSf7eZN0WtxfqX1wX2ZM3QPlwI116/w
         ENtA==
X-Gm-Message-State: AOAM5329qJGRoZ4v+XBY83ZxhkpjtXUR7NbX5u1U+z2N1iAjMyIZ0KGm
        o4upiptDY8EEA23reSRw1IT4wXmczIZ1dkW1oY3bhHEzY6bcVZxI5kTMXfQCjPMEMhU9Je/x61h
        g41ctIIyE382VM3f0unFpVA==
X-Received: by 2002:a17:906:57c5:: with SMTP id u5mr27834203ejr.311.1595402283741;
        Wed, 22 Jul 2020 00:18:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyceOzzKjVYzoyGWeTz9chUJQE8t5Cdl25VlPyxcK/im99H2NYsEVDg7gPuHMxJ5fCOsgw1Og==
X-Received: by 2002:a17:906:57c5:: with SMTP id u5mr27834183ejr.311.1595402283431;
        Wed, 22 Jul 2020 00:18:03 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f17sm18076914ejr.71.2020.07.22.00.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 00:18:02 -0700 (PDT)
Subject: Re: [PATCH 1/4] dt-bindings: usb-connector: Add support for Type-C
 alternate-modes
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-2-hdegoede@redhat.com> <20200721022610.GA3391383@bogus>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f143d626-2a78-e32f-b122-7dbae1b3a50e@redhat.com>
Date:   Wed, 22 Jul 2020 09:18:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200721022610.GA3391383@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 7/21/20 4:26 AM, Rob Herring wrote:
> On Tue, Jul 14, 2020 at 01:36:14PM +0200, Hans de Goede wrote:
>> This commit adds the minimum bindings required to allow describing which
>> altmodes a port supports. Currently this is limited to just specifying:
>>
>> 1. The svid, which is the id of the altmode, e.g. displayport altmode has
>> a svid of 0xff01.
>>
>> 2. The vdo, a 32 bit integer, typically used as a bitmask describing the
>> capabilities of the altmode, the bits in the vdo are specified in the
>> specification of the altmode, the dt-binding simply refers to the
>> specification as that is the canonical source of the meaning of the bits.
> 
> What if this information should be derived from information already in
> DT (or would be there if alt mode connections are described)?
> 
>>
>> Later on we may want to extend the binding with extra properties specific
>> to some altmode, but for now this is sufficient to e.g. hook up
>> displayport alternate-mode.
> 
> I don't think this is sufficient as it doesn't describe how alternate
> modes are connected to various components. This has been discussed some
> here[1] with the CrOS folks. Maybe this is orthogonal, IDK, but I really
> need something that is somewhat complete and not sprinkle a few new
> properties at a time.

Right, but that is an orthogonal problem, this is telling the Type-C
controller which modes it is allowed to negotiate and which capabilties
(altmode specific, stored in the vdo) it should advertise.

I agree that if the connector is connected to a mux and how that mux is then
connected to the SoC, or if the SoC has a multi-mode phy also needs to be
specified in some cases. But that is mostly a separate problem.
One thing which we will want to add to this part of the bindings when that
other part is in place is a link to the endpoint *after* the mux, that is
after the mode- and role-switch in Prashant's example here:
https://lkml.org/lkml/2020/6/12/602

The Type-C controller may receive out-of-band messages related to the
altmode (through USB-PD messages) which need to be communicated to
the endpoint, so in the case of display-port altmode, the dp0_out_ep
from Prashant's example. Note the link/object reference I'm suggesting
here deliberately skips the mux, since the oob messages need to be
send through the endpoint without the mux being involved since they are
oob after all.

Specifically there is no pin on the Type-C connector for the display-port
hotplug-detect pin, so hot(un)plug is signaled through altmode specific
USB-PD messages.

Note that this binding and the 2 patches implementing it for x86
devices (*), are already useful / functional. The user just needs to
manually run "xrandr" to force the video-output driver to manually
recheck for new/changed monitors, just like an old VGA ports without
load detection.

I haven't fully figured out how to wire up the hotplug signal in the
kernel yet, which is why the link to the DP endpoint is not yet part of
the bindings.

*) Using sw-fw-nodes to pass the info from a drivers/platform/x86/
driver to the Type-C controller code which uses fw_nodes to get this info

So since this is x86 only for now; and AFAIK you don't want to take bindings
upstream until there is an actual DT user anyways, my main goal of including
this was to see if we are at least on the right way with this. With x86 it
is all in the kernel, so if the binding changes a bit we can easily adjust the
drivers/platform/x86/ code generating the nodes at the same time as we
update the Type-C controller code to implement the final binding. But it
would be good to know that we are at least going in the right direction.

BTW note that making the binding look like this was proposed by Heikki,
the Type-C subsys maintainer, I ended up implementing this because Heikki
did no have the time for it.

Regards,

Hans





> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Note I hope I got the yaml correct, this is my first time writing a
>> dt-binding in the new yaml style. I did run:
>> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/connector/usb-connector.yaml
>> and that was happy.
> 
> That aspect of it looks fine.
> 
> Rob
> 
> [1] https://lkml.org/lkml/2020/4/22/1819
> 

