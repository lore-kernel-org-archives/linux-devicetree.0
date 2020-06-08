Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2447DC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 11:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E06B22076A
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 11:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="WXQkfJPc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgFHLD5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 07:03:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:46585 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726202AbgFHLD5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Jun 2020 07:03:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iFZHjQS26CKzeiFZLjln8E; Mon, 08 Jun 2020 13:03:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591614235; bh=VEc0Aky6UOC+b4fLNZzvM8VIuVfyNuAhzTN1Bh5IfSI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WXQkfJPcZNRLJAiYoCZWm4HuSM2P+wN8ox40v6GtcvBIDjiu+q+G0FDCSuaHuziBt
         Irz5/fKHDDsU89CnlGUm10is9lAD/1aOuTf5Pf3w3NQU6q0A1uvYsw0z1nHNwfhyTN
         apqgrL3zowF5EOeFCTBs6h2JHsKrBaDJmsCZAbdUOUrmoNjr6e5hvnxpkPGsUysQL0
         NY3f0o0LBxr06y1+l3YPf2AuByAbeFRzuRRgwqUwoLeFeSndqbfsvJ/Bi7IBrB+Qpl
         oYVA3p4/haI51xhULu0fmv0Gq1d2ukRJ+v4AzkTHgTO5ZH730GkwiqEkFQQ6uPnJgP
         vU7tf93t1/8Ug==
Subject: Re: Fwd: [PATCH v3 2/2] media: cec: i2c: ch7322: Add ch7322 CEC
 controller driver
To:     Jeff Chase <jnchase@google.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20200529030012.254592-1-jnchase@google.com>
 <20200529030012.254592-3-jnchase@google.com>
 <CALTkaQ2OR+bc2QGeucA5aP3SiM5HLnx5=DoZQ51E_1d99Hb5Uw@mail.gmail.com>
 <CALTkaQ0NLgjS7H7De=7jy9jRG1xMFSbzdmxrFNerNU+o1rRzpg@mail.gmail.com>
 <d7e759d1-9bdf-0ab3-143a-f0e374667f04@xs4all.nl>
 <CALTkaQ3mq0iEPqSt92HVVkePRsUnuB2H=OZyp3O01jBSz=86_A@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <862e1e69-18ed-309a-4ddb-fc1e72dada29@xs4all.nl>
Date:   Mon, 8 Jun 2020 13:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CALTkaQ3mq0iEPqSt92HVVkePRsUnuB2H=OZyp3O01jBSz=86_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOvsJiZ4lUrENRwgvsVt33RtHbvz5NZItr8XqmP4sUq177ufZb3frhR8q3PRq8kKMq48MJ5dPaa+7Zs5ek7h/v7FHtAmh8Q5PnA5+UPqJSKbtvkwSxzx
 9YT4LDnBXvqKDpRenYQGMjOdzOdBbkkVT228XTNBD/xyNrRCRJze7LpacNBNbEXYf8IdGn5eW8OQO99NMbWG90fIB6kqE71SMa2iOLfYguxVHpmXHoaG+zqq
 3iSdj9GV8wt+x98Dk0aLpVXU9fjbBs8Sj3G6mZc3FdqqeqGHMhKbEOP9T2KXULKRCQKWP6QB2NWd3nzqtzcFLg==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 02/06/2020 20:17, Jeff Chase wrote:
>>> I haven't looked into the cec notifier mechanism yet but would it be
>>> better to try to use that instead if possible and just ignore this
>>> device's physical address detection? Then I could do more of a proper
>>> reset in this enable op. But I'm not sure if I can properly associate
>>> the device with an HDMI port on my platform unless I make some changes
>>> to coreboot.
>>
>> I don't think this is useful: it's nice to have the CEC adapter do the
>> physical address detection.
>>
>> One question about that though: if there is no physical address, can this
>> driver still transmit CEC messages? Specifically Image View On. This is
>> important to wake up displays that pull down the HPD when in standby.
> 
> Yes it can. I just verified this with the kwikwai analyzer.

Good.

Once I have Rob's Ack for the binding patch I will make a pull request for
this series.

BTW, you wouldn't happen to know a cheap device that uses this chip/driver?

It would be nice to add this to my collection of CEC devices.

Regards,

	Hans
