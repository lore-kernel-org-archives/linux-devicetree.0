Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5258AC2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 21:52:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B409206D6
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 21:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="saxIS9Bo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgDPVw2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 17:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725960AbgDPVw1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 17:52:27 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F95C061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 14:52:27 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id w24so257494qts.11
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 14:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5muy41xpG05GO44qMPdBBo4WoMG+wseXc4iMRPJrNUY=;
        b=saxIS9BoL7RKAWOSyLjOwifTJ95qb6v4SLpXdkrzPI5XKOPPyPhDg8vhlRhy64i3JG
         5byLCgHgHocCFOeMZHuAX+Uwhqc7pBkIKTSmf4b4lfDZC7HERvHuBCTtkR+1VbKVS4lZ
         Bn8Uwew0/rYkUwFTYypc5KBPHPgzclfZgLgKhafeZ4wN7RoygowpUkfZvQv0jWy/1oI5
         ryW9LOdWBF2hgld2rbIrFOn9b9U9PKtcuK64Zk1Y+I868xInwWWYDhOxELwhbcXQ3U7Q
         Jdbo8HYso7Ki5BrTcIuiBdb/uikj0d40tj36joPNm3t58W/b5BCF5y4wq+LMZ24zKdb4
         ziqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5muy41xpG05GO44qMPdBBo4WoMG+wseXc4iMRPJrNUY=;
        b=pGaPWuuBR9Tjf34m3+HfHrGfAxQJsZUpMhhMpBy1Dm/yGcL/GcR65C8ON5wd01y3um
         aUMycyeGbAtuQy6ir4GVBRbWCl6XpXWSIdE3Uc2qHYKzQInQM4An/28k6R94HB+dfyuG
         BvByqQCseabbDZT1v7lTV8xVAo+TG4BZ9VjaEOpwvg1nQVycacgof8c4rNECn0+3z44q
         lP9LXLko3JtE9iyAZzT7FOESlDwUeqxz5fX20rVsx+W5124XH3cee0AE8X07QFyveAsA
         B7fwgUNq3lFQquy68XgV36K678jZNWZvwXPGexqTazgOsrxQUNiRPGmoDOTW48XJw2Nw
         6j8g==
X-Gm-Message-State: AGi0PubJw1W+5BexGsWRaGFDWf5cJDtLk2Ie3DFK4F9wiHR1KmStjxyw
        MI0vQSSdG/OjdkvG1h4KL9U=
X-Google-Smtp-Source: APiQypI/pCBWiEgBYpC56NwpN5qL4psYkP6Xnj5lSjzPlcFkrEmKNuFx1DD6GfhH3+VuOENfMJVz9g==
X-Received: by 2002:ac8:46d1:: with SMTP id h17mr25328726qto.72.1587073946674;
        Thu, 16 Apr 2020 14:52:26 -0700 (PDT)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id m7sm7671620qke.124.2020.04.16.14.52.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Apr 2020 14:52:26 -0700 (PDT)
Subject: Re: [Bug 206203] kmemleak reports various leaks in
 drivers/of/unittest.c
From:   Frank Rowand <frowand.list@gmail.com>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
References: <bug-206203-206035@https.bugzilla.kernel.org/>
 <bug-206203-206035-Y3snhDMDgJ@https.bugzilla.kernel.org/>
 <877dyqlles.fsf@mpe.ellerman.id.au>
 <8383090b-f8d1-f346-5ff3-7234a9d44092@gmail.com>
 <a717b335-de6c-46eb-1daa-ae5054664e93@gmail.com>
Message-ID: <8ff9a2e5-9b49-73d3-6f57-2c5a62bc4f97@gmail.com>
Date:   Thu, 16 Apr 2020 16:52:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a717b335-de6c-46eb-1daa-ae5054664e93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 4/15/20 10:27 PM, Frank Rowand wrote:
> On 4/8/20 10:22 AM, Frank Rowand wrote:
>> Hi Michael,
>>
>> On 4/7/20 10:13 PM, Michael Ellerman wrote:
>>> bugzilla-daemon@bugzilla.kernel.org writes:
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=206203
>>>>
>>>> Erhard F. (erhard_f@mailbox.org) changed:
>>>>
>>>>            What    |Removed                     |Added
>>>> ----------------------------------------------------------------------------
>>>>  Attachment #286801|0                           |1
>>>>         is obsolete|                            |
>>>>
>>>> --- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
>>>> Created attachment 288189
>>>>   --> https://bugzilla.kernel.org/attachment.cgi?id=288189&action=edit
>>>> kmemleak output (kernel 5.6.2, Talos II)
>>>
>>> These are all in or triggered by the of unittest code AFAICS.
>>> Content of the log reproduced below.
>>>
>>> Frank/Rob, are these memory leaks expected?
>>
>> Thanks for the report.  I'll look at each one.
> 
> Only one of the leaks was expected.  I have patches to fix the
> unexpected leaks and to remove the expected leak so that the
> kmemleak report of it will not have to be checked again.
> 
> I expect to send the patch series tomorrow (Thursday).

The patches for the memory leaks that I saw on an ARM board are at:

   https://lore.kernel.org/r/1587073370-25963-1-git-send-email-frowand.list@gmail.com

-Frank

< snip >
