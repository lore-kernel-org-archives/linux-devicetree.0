Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9844AC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 08:34:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71BD520714
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592210091;
	bh=QO5I7UdKNZGH1EgSgljjPrTCdDrfliFWuQpe4jpGydg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=rc5rJo2UU2Yp59dUotp9DXUrv6RoQt214kpdlaXcSMyYRvvMWqJTMGnpreC6Ajacb
	 mzMOJ1PV6C20VS/nvuZnx06vuakevxYSnD72/OMK+HNe84tbixR1kH3U+j7Ndh4gJp
	 bGqKCuicplq5qHYI9gT7avtOofoiW4+hrXUM+EU8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbgFOIev (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 04:34:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728451AbgFOIeu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 15 Jun 2020 04:34:50 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F93C2068E;
        Mon, 15 Jun 2020 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592210089;
        bh=QO5I7UdKNZGH1EgSgljjPrTCdDrfliFWuQpe4jpGydg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UO29b4Rs5W+wK46xfgIOrYnjY8HHXx3eOCuvwzLqsrCppZLuQIrFHCKxVoKyCiWmU
         siEa5/n+5Iw1+n895H2Z5ie0X0gC5b2cj7VoD7O26tmEtBIdEwY391NsMmgcQt0XSj
         284SqImetYz0+v1qeGqHrBozYkthLyu2/IeqIvH8=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jkkZr-0031xr-OX; Mon, 15 Jun 2020 09:34:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Jun 2020 09:34:47 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 04/12] dt-bindings: irqchip: ti, sci-intr: Update bindings
 to drop the usage of gic as parent
In-Reply-To: <d586e88c-2907-1771-dee2-32429082aa07@ti.com>
References: <20200520124454.10532-1-lokeshvutla@ti.com>
 <20200520124454.10532-5-lokeshvutla@ti.com> <20200528221406.GA769073@bogus>
 <f803f646-2a55-4f15-9682-1dc616d7c714@ti.com>
 <4ea8c6110a16900220a65f1d44145146@kernel.org>
 <3f253e25-2ee7-96f2-3158-7f6be0710a33@ti.com>
 <d586e88c-2907-1771-dee2-32429082aa07@ti.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <9afd8a79d9c9ecfd35b6a4e66c93e298@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: lokeshvutla@ti.com, nm@ti.com, robh@kernel.org, grygorii.strashko@ti.com, devicetree@vger.kernel.org, t-kristo@ti.com, nsekhar@ti.com, peter.ujfalusi@ti.com, ssantosh@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-06-15 09:03, Lokesh Vutla wrote:
> Hi Marc,
> 
> On 01/06/20 5:06 pm, Lokesh Vutla wrote:
>> Hi Marc,
>> 
>> On 29/05/20 3:48 pm, Marc Zyngier wrote:
>>> On 2020-05-29 11:14, Lokesh Vutla wrote:
>>>> Hi Rob,
>>>> 
>>>> On 29/05/20 3:44 am, Rob Herring wrote:
>>>>> On Wed, May 20, 2020 at 06:14:46PM +0530, Lokesh Vutla wrote:
>>>>>> Drop the firmware related dt-bindings and use the hardware 
>>>>>> specified
>>>>>> interrupt numbers within Interrupt Router. This ensures interrupt 
>>>>>> router
>>>>>> DT node need not assume any interrupt parent type.
>>>>> 
>>>>> I didn't like this binding to begin with, but now you're breaking
>>>>> compatibility.
>>>> 
>>>> Yes, I do agree that this change is breaking backward compatibility. 
>>>> But IMHO,
>>>> this does cleanup of firmware specific properties from DT. Since 
>>>> this is not
>>>> deployed out yet in the wild market, I took the leverage of breaking 
>>>> backward
>>>> compatibility. Before accepting these changes from firmware team, I 
>>>> did
>>>> discuss[0] with Marc on this topic.
>>> 
>>> And I assume that should anyone complain about the kernel being 
>>> broken
>>> because they have an old firmware, you'll be OK with the patches 
>>> being
>>> reverted, right?
>> 
>> I am assuming there is no one to complain as there is no product 
>> available yet
>> with upstream kernel. Internally everyone is aware of the changes. So, 
>> yes I
>> would agree with you to revert the changes if someone really needs it. 
>> :)
> 
> Any chance you can shower your blessings on this series :)

I have purposely ignored it just before and during the merge window. It 
is now firmly in my review queue.

         M.
-- 
Jazz is not dead. It just smells funny...
