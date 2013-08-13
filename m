Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:50692 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836Ab3HMGBl (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2013 02:01:41 -0400
Received: by mail-la0-f53.google.com with SMTP id el20so2899233lab.12
        for <devicetree@vger.kernel.org>; Mon, 12 Aug 2013 23:01:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <9BC13262-0803-4790-B1B5-0B46F7DB8D30@codeaurora.org>
References: <1375128719-23642-1-git-send-email-galak@codeaurora.org>
 <E9700EA7-7154-46C5-9258-03F030DF69F6@codeaurora.org> <20130729214035.GC8868@codeaurora.org>
 <9EB1A821-7137-4812-B58A-20F669BCA7DD@codeaurora.org> <0A09DA0F-86B4-4961-88E2-64FA0A4D380D@codeaurora.org>
 <CAK=WgbZSJmMz_U56ZsppBrB64XvTHBqJM4L+uFY1kKxhMCCtMQ@mail.gmail.com> <9BC13262-0803-4790-B1B5-0B46F7DB8D30@codeaurora.org>
From: Ohad Ben-Cohen <ohad@wizery.com>
Date: Tue, 13 Aug 2013 09:01:17 +0300
Message-ID: <CAK=WgbbdY-uZjiO2KBsYGshagykcL0X8PYEByb9K-Wp5R5g+hQ@mail.gmail.com>
Subject: Re: [PATCH] hwspinlock/msm: Add support for Qualcomm MSM HW Mutex block
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, "linux-kernel@vger.kernel.org list" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Eric Holmberg <eholmber@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 12, 2013 at 8:24 PM, Kumar Gala <galak@codeaurora.org> wrote:
> So I think I'd ask you to recommend a name, should we just us 'hwspinlock'.  The general view from ePAPR and dts is the node name should be a bit more generic (like ethernet or pci).  So what would you suggest?

How about 'hwlock' ?

This should be generic enough to cover all instances of hardware locks
(we already know hwspinlock isn't generic enough, as there are some
mutex-like hardware locks which doesn't require busy looping).
