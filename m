Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16ECEC3A5A0
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 16:16:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9D4A206F6
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 16:16:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgDTQQj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 12:16:39 -0400
Received: from foss.arm.com ([217.140.110.172]:51682 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbgDTQQj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 12:16:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6440C31B;
        Mon, 20 Apr 2020 09:16:38 -0700 (PDT)
Received: from [10.57.33.63] (unknown [10.57.33.63])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C420E3F73D;
        Mon, 20 Apr 2020 09:16:36 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] iommu: Add Allwinner H6 IOMMU driver
To:     Maxime Ripard <maxime@cerno.tech>, Joerg Roedel <joro@8bytes.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org
References: <cover.a31c229a83f1d92e6928ae2adb70887da0fd44b3.1582222496.git-series.maxime@cerno.tech>
 <6864f0f28825bb7a2ec1c0d811a4aacdecf5f945.1582222496.git-series.maxime@cerno.tech>
 <20200302153606.GB6540@8bytes.org>
 <20200401114710.doioefzmjhte7jwu@gilmour.lan>
 <20200408140649.GI3103@8bytes.org>
 <20200420143958.rdn3j27tu3umtkrh@gilmour.lan>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <af745738-9e0f-40b6-9a20-19c233a7e52a@arm.com>
Date:   Mon, 20 Apr 2020 17:16:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420143958.rdn3j27tu3umtkrh@gilmour.lan>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-04-20 3:39 pm, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Apr 08, 2020 at 04:06:49PM +0200, Joerg Roedel wrote:
>> On Wed, Apr 01, 2020 at 01:47:10PM +0200, Maxime Ripard wrote:
>>> As far as I understand it, the page table can be accessed concurrently
>>> since the framework doesn't seem to provide any serialization /
>>> locking, shouldn't we have some locks to prevent concurrent access?
>>
>> The dma-iommu code makes sure that there are no concurrent accesses to
>> the same address-range of the page-table, but there can (and will) be
>> concurrent accesses to the same page-table, just for different parts of
>> the address space.
>>
>> Making this lock-less usually involves updating non-leaf page-table
>> entries using atomic compare-exchange instructions.
> 
> That makes sense, thanks!
> 
> I'm not sure what I should compare with though, do you want to compare with 0 to
> check if there's already a page table assigned to that DTE? If so, then we
> should also allocate the possible page table before the fact so that we have
> something to swap with, and deallocate it if we already had one?

Indeed, for an example see arm_v7s_install_table() and how 
__arm_v7s_map() calls it. The LPAE version in io-pgtable-arm.c does the 
same too, but with some extra software-bit handshaking to track the 
cache maintenance state as an optimisation, which you can probably do 
without trying to make sense of ;)

Robin.
