Return-Path: <SRS0=sOYF=2R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC51C2D0C6
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 11:03:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B7A920828
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 11:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KAoNsNwO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfL0LDp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Dec 2019 06:03:45 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59160 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfL0LDp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Dec 2019 06:03:45 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191227110342euoutp027ad7879946fedfce28ecbdd515f14468~kNYbkDbLg0344603446euoutp02Y
        for <devicetree@vger.kernel.org>; Fri, 27 Dec 2019 11:03:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191227110342euoutp027ad7879946fedfce28ecbdd515f14468~kNYbkDbLg0344603446euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1577444622;
        bh=7CiodF6lhHlhDpRiOd/eKxBgSk8F/RyuGNECvUfKCw0=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=KAoNsNwOMlXQ0Pzi9lShO69iktQ2sUc9dsB8Rdc/raBB9TLppk8+ctMTWhHNvJ2dF
         pUhj348RJRsAoWNGkEwJseUkiodpP5n5cpz/Cq+4wNtmBworOU9W0HShbDDnCXB5wV
         F3M8IRr3rb/2KrMs8V0S5so6mldIdz2VbL9RICp0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191227110342eucas1p28cd23e3b2a98d7177cb1446bf78cef27~kNYbL9yew2930829308eucas1p2Y;
        Fri, 27 Dec 2019 11:03:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 26.D9.61286.E05E50E5; Fri, 27
        Dec 2019 11:03:42 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191227110341eucas1p29b093c32e47d33e641d6211f447b8d9c~kNYaf0QF50089800898eucas1p2x;
        Fri, 27 Dec 2019 11:03:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191227110341eusmtrp2e4938dd116e6bede0f69e187b2b01795~kNYae_giY1700917009eusmtrp2V;
        Fri, 27 Dec 2019 11:03:41 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-c1-5e05e50e82dc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 2C.E0.08375.D05E50E5; Fri, 27
        Dec 2019 11:03:41 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191227110340eusmtip1fcceb1a658a39abae4f90874dfe174b6~kNYZohbVj2252922529eusmtip1G;
        Fri, 27 Dec 2019 11:03:40 +0000 (GMT)
Subject: Re: [PATCH v4 04/11] drm/bridge: Make the bridge chain a
 double-linked list
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
        Chris Healy <cphealy@gmail.com>
Message-ID: <ca3b7b5a-3706-22ab-beee-98d892af5511@samsung.com>
Date:   Fri, 27 Dec 2019 12:03:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <32c4c99a-c943-b1e8-d342-2fd8e8719ff0@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxNYRj3nnPuuafmtNfFelbGdof5mD7kj9cQhu1gM8xnSJfO0ure7B75
        iD/Sl0pR6Os2hFtyRybdVsnmxtxu6S6X8jFFw1qURrUW6rr3HtF/v+f3PL/3+f3ePRytOsP6
        cdG6I6Jep4lVs95M9dMR+yKfz4rwoMFuP/K2wq4gyekrSPOzJopY6q0UufrERb0c6mdJ23AP
        TWy9bQy5b89SkJakXiXJyDUqSemr5xRpOLeHfLgbQ1IfPlGS8hEzIoUXe1gyUneFWaUSbl+5
        jYT+16lK4UOekxJqOoxIqDV0KIXi9CKFUGnKYIXGHAclvD9rpQRjfhsrnKsyIeFR9kVGGKic
        uZkP814eKcZGHxX1gaER3ofqazvpwzZy/Hu2iU1EaYGZyIsDvARK7p9n3ViFyxHkpoRmIm8X
        HkSQcq9TIRcDCPIbS5TjCtNgBSM3biIYzemm5KIPQXfXR89bU/EOsP1O9ChYHAyZfZkefhoO
        g89dHR41jYcZKM9+7NrBcTwOhdKWHe4ZBs+B1tHLyI2n433gLDJTbszjKWAr+sS4sRdeCb/M
        vxRuTONZkGwupmXsC28/XfUYAvyIg/eOMUq2vRaqSmoZGU+FL9aqv3FmgLN2XJCMoMt+RykX
        WQheJBUieWoZvLP/ZN1OaTwf7tb9/b3VUFp/2kMD9oHXfVNkEz5wobqAlmke0tNU8vRcMFgr
        /q21tDroHKQ2TIhmmBDHMCGO4f/eEsSYkK8YL2mjRClYJx4LkDRaKV4XFXAwTluJXOfZPGb9
        UYOGHAcaEOaQejIfVMOEqxSao9IJbQMCjlZP43VRinAVH6k5kSDq4/br42NFqQH5c4zalw+5
        3rNPhaM0R8QYUTws6se7FOfl5zqbmgwoG7C2z5h+qhzniYMxNwKTnKnzlijjsyq2BazbXZb7
        IKmzwHhqXtr2dUH1+e0bZtPa47usD5L3fl2o/t66MTDlGrkUZLa0l91rtG0KW0MvkG45X2m/
        efnUxRUktDwMSRUjHcZJlkkni5duXVnc9Ga9/5Dl65rYnVu6Fkccs/NqRjqkCV5A6yXNHy5/
        doGaAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsVy+t/xu7q8T1njDDrf6VjcWneO1aK5w9bi
        9JlTTBYH9xxnsph/BCh05et7Nour318yW5x8c5XFYvO5HlaLs01v2C06Jy5ht1h6/SKTxaG+
        aIsH67MtWvceYbdY8XMro8WMyS/ZLH7umsfiIOSxZt4aRo/3N1rZPR5M/c/ksePuEkaPnbPu
        snvM7pjJ6rFpVSebx4kJl5g87ncfZ/JYMu0qm0ffllWMHgd6J7N4fN4kF8AbpWdTlF9akqqQ
        kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJexZ+c95oKTFhUfe1ex
        NTC26XcxcnJICJhIrPqyjqWLkYtDSGApo8Ss9cdZIBIyEienNbBC2MISf651sUEUvWaUuHbo
        CTNIQlggTOLknwZ2EJtNwFCi6y1IESeHiECURPenz8wgDcwCv1kk/j9dzAjRvY5VYmfDSqAV
        HBy8AnYSS8+GgTSwCKhKXPg7lxHEFhWIldi++SHYAl4BQYmTM5+AXcQpYC/xe+tvsIuYBcwk
        5kHVMAvISzRvnQ1li0vcejKfaQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFhnrFibnF
        pXnpesn5uZsYgeli27Gfm3cwXtoYfIhRgINRiYe3YxdLnBBrYllxZe4hRgkOZiUR3rx01jgh
        3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgemsrySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLp
        iSWp2ampBalFMH1MHJxSDYwR9SHtaqafZDgPr35t2WbQfzN8Z/BaxvlC3p+vp+wQzIuecHXN
        yQrxt9x2pRLV4Xrmxpe0Hrz2cdzXeDdSKE/kq1i5y1edy4qta5bcCTj35N7OJr+ju2Z4XfJl
        mb1gcX/lWSbOnk1HD8xa1XA4nbUn6mrS1HKL3i6dfx6TDopv27H5xvcfs3qVWIozEg21mIuK
        EwHKGG7cLQMAAA==
X-CMS-MailID: 20191227110341eucas1p29b093c32e47d33e641d6211f447b8d9c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
        <CGME20191203141542eucas1p23771a9c49ef18144c832fc536bdae61a@eucas1p2.samsung.com>
        <20191203141515.3597631-5-boris.brezillon@collabora.com>
        <4e901ab9-07d4-4238-7322-c7c5a3959513@samsung.com>
        <20191216155551.083dcbaf@collabora.com>
        <75a06e2a-4587-ee16-0f5d-af75fbe89793@samsung.com>
        <20191216162542.261c821c@collabora.com>
        <60f03d50-7c0f-c3d0-920f-0625c08b2171@samsung.com>
        <1010f5fc-0672-643c-4410-e053a928cb66@samsung.com>
        <20191224104422.25dbf980@collabora.com>
        <20191224104936.6a7c4977@collabora.com>
        <20191224110307.00ca841d@collabora.com>
        <32c4c99a-c943-b1e8-d342-2fd8e8719ff0@samsung.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi All,

On 27.12.2019 11:25, Marek Szyprowski wrote:
> On 24.12.2019 11:03, Boris Brezillon wrote:
>> On Tue, 24 Dec 2019 10:49:36 +0100
>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>> On Tue, 24 Dec 2019 10:44:22 +0100
>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>> On Tue, 24 Dec 2019 10:16:49 +0100
>>>> Andrzej Hajda <a.hajda@samsung.com> wrote:
>>>>> On 23.12.2019 10:55, Marek Szyprowski wrote:
>>>>>> On 16.12.2019 16:25, Boris Brezillon wrote:
>>>>>>> On Mon, 16 Dec 2019 16:02:36 +0100
>>>>>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>>>>>> On 16.12.2019 15:55, Boris Brezillon wrote:
>>>>>>>>> On Mon, 16 Dec 2019 14:54:25 +0100
>>>>>>>>> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>>>>>>>> On 03.12.2019 15:15, Boris Brezillon wrote:
>>>>>>>>>>> So that each element in the chain can easily access its 
>>>>>>>>>>> predecessor.
>>>>>>>>>>> This will be needed to support bus format negotiation 
>>>>>>>>>>> between elements
>>>>>>>>>>> of the bridge chain.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>>>>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>>>>>>>> Reviewed-by: Laurent Pinchart 
>>>>>>>>>>> <laurent.pinchart@ideasonboard.com>
>>>>>>>>>> I've noticed that this patch got merged to linux-next as commit
>>>>>>>>>> 05193dc38197021894b17239fafbd2eb1afe5a45. Sadly it breaks 
>>>>>>>>>> booting of
>>>>>>>>>> Samsung Exynos5250-based Arndale board. Booting stops after 
>>>>>>>>>> following
>>>>>>>>>> messages:
>>>>>>>>>>
>>>>>>>>>> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping 
>>>>>>>>>> operations
>>>>>>>>>> exynos-drm exynos-drm: bound 14400000.fimd (ops 
>>>>>>>>>> fimd_component_ops)
>>>>>>>>>> exynos-drm exynos-drm: bound 14450000.mixer (ops 
>>>>>>>>>> mixer_component_ops)
>>>>>>>>>> exynos-drm exynos-drm: bound 14500000.dsi (ops 
>>>>>>>>>> exynos_dsi_component_ops)
>>>>>>>>>> exynos-drm exynos-drm: bound 14530000.hdmi (ops 
>>>>>>>>>> hdmi_component_ops)
>>>>>>>>>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>>>>>>>>>> [drm] No driver support for vblank timestamp query.
>>>>>>>>>> [drm] Cannot find any crtc or sizes
>>>>>>>>>> [drm] Cannot find any crtc or sizes
>>>>>>>>>> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on 
>>>>>>>>>> minor 0
>>>>>>>>>>
>>>>>>>>>> I will try to debug this and provide more information soon.
>>>>>>>>> Can you try with this diff applied?
>>>>>>>> This patch doesn't change anything.
>>>>>>> Okay. Can you do a list_for_each_entry() on both 
>>>>>>> encoder->bridge_chain
>>>>>>> and dsi->bridge_chain (dump bridge pointers in a pr_info()) 
>>>>>>> before and
>>>>>>> after the list_splice_init() call?
>>>>>> encoder->bridge_chain contains only one element. dsi->drive_chain 
>>>>>> is empty.
>>>>>>
>>>>>> Replacing that list_splice() with 
>>>>>> INIT_LIST_HEAD(&encoder->bridge_chain)
>>>>>> fixed the boot issue.
>>>> If INIT_LIST_HEAD() worked, I don't understand why replacing the
>>>> list_splice() call by a list_splice_init() (which doing a 
>>>> list_splice()
>>>> + INIT_LIST_HEAD()) didn't fix the problem. Are you sure the
>>>> list_splice_init() version doesn't work?
>>>>>> It looks that this is related with the way the
>>>>>> Exynos DSI handles bridges (in bridge and out brige?). Maybe Andrzej
>>>>>> will give a bit more detailed comment and spread some light on this.
>>>>>
>>>>> Hi Marek, Boris,
>>>>>
>>>>>
>>>>> I have not followed latest patches due to high work load, my bad. 
>>>>> Marek
>>>>> thanks from pointing
>>>>>
>>>>> About ExynosDSI bridge handling:
>>>>>
>>>>> The order of calling encoder, bridge (and consequently panel) ops
>>>>> enforced by DRM core (bridge->pre_enable, encoder->enable,
>>>>> bridge->enable) does not fit to ExynosDSI hardware initialization
>>>>> sequence, if I remember correctly it does not fit to whole MIPI DSI
>>>>> standard (I think similar situation is with eDP). As a result DSI
>>>>> drivers must use some ugly workarounds, rely on HW properly coping 
>>>>> with
>>>>> incorrect sequences, or, as in case of ExynosDSI driver, just avoid
>>>>> using encoder->bridge chaining and call bridge ops by itself when 
>>>>> suitable.
>>>> Yes, that's definitely hack-ish, and I proposed 2 solutions to address
>>>> that in previous versions of this patchset, unfortunately I didn't get
>>>> any feedback so I went for the less invasive option (keep the hack but
>>>> adapt it to the double-linked list changes), which still lead to
>>>> regressions :-/.
>>>>
>>>> Just a reminder of my 2 proposals:
>>>>
>>>> 1/ implement the bridge_ops->pre_enable/post_disable() hooks so you 
>>>> can
>>>>     split your enable/disable logic in 2 parts and make sure things 
>>>> are
>>>>     ready when the panel/next bridge tries to send DSI commands
>>>> 2/ move everything that's needed to send DSI commands out of the
>>>>     ->enable() path (maybe in runtime PM resume/suspend hooks) so you
>>>>     can call that in the DSI transfer path too
>>>>
>>>> As pointed out by Laurent, #1 doesn't work because some panel drivers
>>>> send DSI commands in their ->prepare() hook, and ->pre_enable() 
>>>> methods
>>>> are called in reverse order, meaning that the DRM panel bridge driver
>>>> would try to issue DSI commands before the DSI host controllers is 
>>>> ready
>>>> to send them. I still thing #2 is a good option.
>>>>> So proper patch converting to double-linked list should not try to
>>>>> splice ExynosDSI private bridge list with with encoder's, 
>>>>> encoder's list
>>>>> should be always empty, as Marek suggested.
>>>> That's exactly what I wanted to do: make the encoder's list empty 
>>>> after
>>>> attach() and restore it to its initial state before unregistering
>>>> the bridge, except I forgot that list_splice() doesn't call
>>>> INIT_LIST_HEAD(). It's still not clear to me why replacing the
>>>> list_splice() call by a list_splice_init() didn't work.
>>> Okay, I think I figured it out: drm_bridge_chain_xx() helpers use
>>> encoder->bridge_chain as their list head, and you'll never hit the 
>>> 'elem
>>> is list head' condition since we moved all elems from
>>> encoder->bridge_chain to exynos_dsi->bridge_chain. The only way this
>>> can work is if we stop using the helpers and implement our own list
>>> iterators.
>> Just to make it clear, calling INIT_LIST_HEAD(encoder->bridge_chain)
>> doesn't really fix the bug, it just prevents the hang (infinite loop)
>> and turn all drm_bridge_chain_xx() calls into NOPs.
>
> Right, I've just checked it and indeed the display chain outputs 
> nothing after such 'fix'. To get it finally working I've replaced 
> drm_bridge_chain_*() operations for exynos_dsi 'out_bridge' by a 
> direct calls. I will submit a patch in a few minutes. I hope that such 
> workaround can be used now to fix the regression until a better 
> solution is agreed.

I've posted a 'quick & working' fix for Exynos DRM DSI driver:

https://lkml.org/lkml/2019/12/27/121

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

