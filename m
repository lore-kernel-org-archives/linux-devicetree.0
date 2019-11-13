Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF12C432C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 16:52:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A3FE206D3
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 16:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tejH+RP8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbfKMQwY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 Nov 2019 11:52:24 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:35110 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfKMQwY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Nov 2019 11:52:24 -0500
Received: by mail-yw1-f65.google.com with SMTP id r131so928007ywh.2
        for <devicetree@vger.kernel.org>; Wed, 13 Nov 2019 08:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5ckW3vw7XsfTMSL/MnbzIQZZZdUauBkYULj9dHTlFqg=;
        b=tejH+RP8knzhpGF6+Od+Y6cjLj3n0TRX8IymDk9dOus7AYa1wqz44zIFvNEJSc2nUb
         fCU6Mv3RZJU0QQHbgygTujU8sPte/nMvzyxUVdtfYyQA5uF6V6R+YiEuaJefB+XYK+Ht
         HtfMtn+N4lxPvEityODI2M4XB+98wCtZwdWNQ9V1Y+cMsDU4rveb2K4Bom0Qf6pal5y1
         oK/kwHgc9qhHSmqU9NB9BKKoAwnXlYURZF5+34n/kS1RFXnF+cwKJkYExr0lom54zJa6
         1RUJSB4Y5+asHEavjbC5jo0xWKKmQNIr2ymYD3P1npXmdacEpA+M93QXkcMiglvjH2nS
         7rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5ckW3vw7XsfTMSL/MnbzIQZZZdUauBkYULj9dHTlFqg=;
        b=RS1YW/yfe1dgmRFfVCU1LBLNzhWZ2l+QDDecF/YrvAzsKOOsOHQ8XuKLQ6WXJN4Ftm
         JDDn+4yvvEueDMZ28JkB6C9D6397Wt75DqS+/Q5I+3nrinP/sq/2Rw1UqVPdp0jQeH+k
         Bu5la0mja1VZkA8NZ/jqeFHSFem3nKeoHhX8CTizXrisPJf+f9qiIb0yLNi3sY5AkwXg
         HR3MxHm2PZ4eSej3B6r2k2J2PT0dMezTziinoDxjXNXzwo+l4eX4qwyOHfSmN21ZUdIo
         SDO4YLv+80cNpOJvyaA/QkzZkbAhSh9jlWy66nGsizdh0QR7vMC6Gd/Alo44ARgy0Htb
         EXTQ==
X-Gm-Message-State: APjAAAVYywioDAomq/dK0ck6XLDjOFUcE64Cz1E35EYUoyaJB7JVf/Fh
        Hwh4aTD3Dyt9hNc9tCeSa9U=
X-Google-Smtp-Source: APXvYqzF6HsVoObmXtQ42xv4Wh/pporQd2MVSa9R4+gSP7xkIoLE4znI7Mx9ygSDmkji6PsylRx3vQ==
X-Received: by 2002:a81:c20d:: with SMTP id z13mr2649394ywc.383.1573663943615;
        Wed, 13 Nov 2019 08:52:23 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id n128sm1557658ywc.99.2019.11.13.08.52.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Nov 2019 08:52:23 -0800 (PST)
Subject: Re: [PATCH] of: allocate / free phandle cache outside of the
 devtree_lock
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
References: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
 <CAL_JsqLecYPGGP8grE7sUgD1ZBYeVhuqX_sOT_9Rw1LM1yhSmw@mail.gmail.com>
 <20191112091032.aa23wd24j4b324kw@linutronix.de>
 <CAL_Jsq+Rfguea+KO0kLKom=8t_oCnesT8cb833Y0fhsbu_a1Cg@mail.gmail.com>
 <c2c76ab9-9967-3cc3-fff2-5f791598c7e3@gmail.com>
 <CAL_JsqJODons-CL9epGj2QXSyiE17N_a6W-Cyzb=2KKaePT0QQ@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <7693bf26-e4c5-3952-3a3b-a9cb60feb9fa@gmail.com>
Date:   Wed, 13 Nov 2019 10:52:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJODons-CL9epGj2QXSyiE17N_a6W-Cyzb=2KKaePT0QQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 11/12/19 6:48 PM, Rob Herring wrote:
> On Tue, Nov 12, 2019 at 5:46 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 11/12/19 9:55 AM, Rob Herring wrote:
>>> On Tue, Nov 12, 2019 at 3:10 AM Sebastian Andrzej Siewior
>>> <bigeasy@linutronix.de> wrote:
>>>>
>>>> On 2019-11-11 21:35:35 [-0600], Rob Herring wrote:
>>>>>>    28d0e36bf9686 ("OF: Fixup resursive locking code paths")
>>>>>>    d6d3c4e656513 ("OF: convert devtree lock from rw_lock to raw spinlock")
>>>>>
>>>>> So to summarize, we changed mainline to fix RT which then broke RT. :)
>>>>
>>>> correct, but we were good until v4.17-rc1 :)
>>>>
>>>>>> I've been looking into making devtree_lock a spinlock_t which would
>>>>>> avoid this patch. I haven't seen an issue during boot on arm64 even
>>>>>> with hotplug.
>>>>>
>>>>> Did you look into using RCU reader locks any more?
>>>>
>>>> A little bit. The writers, which modify the node, would need to replace
>>>> the whole node. So this is where things got a little complicated.
>>>
>>> Why is that exactly? That's pretty much how node and property updates
>>> work anyways though maybe not strictly enforced. The other updates are
>>> atomic flags and ref counts which I assume are fine. The spinlock
>>> protects traversing the tree of nodes and list of properties.
>>> Traversing and updates would need to follow similar semantics as
>>> rculist, right? BTW, there's been some thoughts to move node and
>>> property lists to list_head. We may want to do that rather than trying
>>> to roll our own RCU code.
>>>
>>>> Frank wasn't a big fan of it back then and he still wasn't a few weeks
>>>> back.
>>>
>>> I guess you spoke at ELCE. RCU seems like the right locking to me as
>>> we're almost entirely reads and I haven't seen another proposal.
>>>
>>>> If you two agree to prefer RCU over this patch then I would look more
>>>> into adding RCU into the lookup path. The argument was that this isn't
>>>> time critical. I'm just trying to avoid to replace the locking for
>>>> nothing.
>>>> So, should I come up with a RCU patch?
>>>
>>> Lets see what Frank says first.
>>
>> RCU is good for adding list entries, deleting list entries, and updating
>> the value(s) of a list element.
>>
>> RCU is not good for excluding readers of a data structure while multiple
>> entries are being added, deleted, and/or modified, such that the readers
>> only see the state of the data structure either (1) before any changes
>> or (2) after all changes occur.  Overlay application and removal require
>> multiple modifications, with readers seeing either the before state of
>> the after state.
> 
> Do we ensure that currently? The of_mutex provides what you describe,

No, we don't.  I've been saying that our locking is horribly broken and
that is one of the items that needs to be fixed for overlays.  Overlays
weren't contemplated in the design of the devicetree locking architecture.

So I don't want to change over to RCU which continues the same issues.

> but most or all the reader paths don't take the mutex. Even the
> changeset API takes the spinlock a single node or property at a time.
> 
> Rob
> 

