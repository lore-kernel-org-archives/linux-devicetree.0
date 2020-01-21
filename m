Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47581C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 15:18:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFD79217F4
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 15:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b/4l9zPv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbgAUPSw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 10:18:52 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:40649 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729043AbgAUPSv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 10:18:51 -0500
Received: by mail-wr1-f47.google.com with SMTP id c14so3632072wrn.7
        for <devicetree@vger.kernel.org>; Tue, 21 Jan 2020 07:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/xYnYXv44qU+de8yrNiPW2mt+dcCK6wBrR7Bk41e2T8=;
        b=b/4l9zPvMCvogemVt9ocA+4PMScXOeljRkTHZmgsATX16L5rTBJNS2/+1RSX6gNtNP
         3JaCF+YHribV0KYJpcX58wmUcKyom5PxpGqeI84idXrxsU9qaSjfivd03RoUfL8kdz7y
         1LttE1fVLmGS/fi0k7KR3mPZrjzLzieOo6I0ySMBp+oXVUvyBr3zUC1UHYl7NvsI5+HD
         3gPK4FRlpoFAtqoioXODeHMZfD3HsG8Y3fvulOXk+XZVVkL63VoE8Kh1DWR0M5MjpVue
         20kGd0KUvruADoLN11l2xEhkNeyeoLKTME5TYAcQqBCiFwTvdcujsr8RI6l7Fjpmrwd3
         52cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/xYnYXv44qU+de8yrNiPW2mt+dcCK6wBrR7Bk41e2T8=;
        b=icefgFnnE2q9wd6E3Wt6K5BtNs4f573zgfq2Qr/9c8xW2mpReco6SLHfQ0hjyv9vtt
         BwxQ5OCCBYUWzOh2UzpKluom2w5JOtxXrjKHiiUpPZXL5GCZn4FJr8xOyHF20G0qocQM
         XCdrNk/KlHgcQrAubjxjS7FkKB+JEJ3/BXGdPtRcgKhYZtlWccVpWyl45/Qhdp5vgLzD
         2WD6fAfWXhKkJmAd2xyaZrijYApFNkLkngGw3b1vZN/ycIlH0HUDMKPOFMWZ8LgL1z5O
         +0JJzfVpfACVuGO69yGMufOFW8QApXLTsoxwLXud0oDZFXlLj574z1ABw/FI7V0vXE39
         5/VQ==
X-Gm-Message-State: APjAAAUfLj2ougqH+8xtX6LGWmWWiHLTanwKeOM5r4xhNngPuDIsko/y
        Uj+Xkb0/QrCTAOkuDe3YaP9hkJWyOvk=
X-Google-Smtp-Source: APXvYqyKSBhltDD8Wqsx9QoDv24jqBCVJ19v8latgWamjgk83scE9DwyIigaXv79WE7dokAXgMHEzQ==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr5724666wrp.167.1579619926611;
        Tue, 21 Jan 2020 07:18:46 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id g18sm4040359wmh.48.2020.01.21.07.18.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jan 2020 07:18:45 -0800 (PST)
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
To:     Thierry Reding <thierry.reding@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
Date:   Tue, 21 Jan 2020 17:18:43 +0200
MIME-Version: 1.0
In-Reply-To: <20200121141027.GE899558@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 1/21/20 16:10, Thierry Reding wrote:
> On Tue, Jan 21, 2020 at 09:53:48AM +0300, Dmitry Osipenko wrote:
>> 20.01.2020 18:06, Thierry Reding пишет:
>>> On Fri, Jan 17, 2020 at 05:23:43PM +0200, Georgi Djakov wrote:
>>>> Hi Thierry,
>>>>
>>>> Thanks for the patch!
>>>>
>>>> On 1/14/20 20:15, Thierry Reding wrote:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> Document the interconnects property that is used to describe the paths
>>>>> from and to system memory from and to the BPMP.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>> Rob, Georgi,
>>>>>
>>>>> after the initial RFC that I did for adding interconnect properties on
>>>>> Tegra, I realized that the description wasn't complete. This is an
>>>>> attempt at a more accurate description, but unfortunately I'm not sure
>>>>> if it's even correct in terms of the interconnect bindings.
>>>>>
>>>>> The problem here is that on Tegra, each device has multiple paths to
>>>>> system memory, and I have no good idea on what to pick as the default.
>>>>> They are all basically the same path, but each provides extra controls
>>>>> to configure the "interconnect".
>>>>
>>>> Are these multiple paths between a device and system memory used simultaneously
>>>> for load-balancing, or who makes the decision about which path would be used?
>>>
>>> It varies. The vast majority of these paths are read/write pairs, which
>>> can be configured separately. There are also cases where multiple paths
>>> are used for load-balancing and I don't think there's any direct
>>> software control over which path will be used.
>>>
>>> A third class is where you have one device, but two read/write pairs,
>>> one which is tied to a microcontroller that's part of the device, and
>>> another read/write pair that is used for DMA to/from the device.
>>>
>>> Often in the latter case, the microcontroller memory client interfaces
>>> will be used by the microcontroller to read firmware and once the micro-
>>> controller has booted up, the DMA memory client interfaces will be used
>>> to read/write system memory with bulk data (like frame buffers, etc.).
>>>
>>>> Is this based on the client/stream ID that you mentioned previously?
>>>
>>> These are now all what's call memory client IDs, which identify the
>>> corresponding interface to the memory controller. Stream IDs are
>>> slightly higher-level and typically identify the "module" that uses
>>> the SMMU. Generally a stream ID is mapped to one or more memory client
>>> IDs.
>>>
>>>> Looking at the the binding below, it seems to me like there are different
>>>> master/slave pairs between MC and EMC and each link is used for
>>>> unidirectional traffic only. In terms of the interconnect API, both read
>>>> and write paths have the same direction.
>>
>> Yes, that definition should be incorrect.
>>
>>> I'm not sure I understand what you mean by this last sentence. Are you
>>> saying that each path in terms of the interconnect API is a always a
>>> bidirectional link?
>>
>> Please see more below.
>>
>>>> Is the EMC really an interconnect provider or is it just a slave port? Can
>>>> we scale both EMC and MC independently?
>>>
>>> The EMC is the only one where we can scale the frequency, but the MC has
>>> various knobs that can be used to fine-tune arbitration, set maximum
>>> latency, etc.
>>
>> Yes..
>>
>>
>> EMC controls the total amount of available memory bandwidth, things like
>> DRAM timing and EMC-DRAM channel's performance. EMC is facing MC from
>> one side and DRAM (EMEM) from the other.
>>

Right, so we can use the icc framework here to aggregate the requested bandwidth
from all clients and scale the frequency/voltage of EMC.

>>
>>
>> MC controls allocation of that total bandwidth between the memory
>> clients. It has knobs to prioritize clients, the knobs are per
>> read/write port. MC is facing memory clients from one side and EMC from
>> the other.
>>

Thanks for clarifying! So are these QoS knobs (priority, latency etc.) tuned
dynamically during runtime or is it more like a static configuration that is
done for example just once during system boot?

>>
>>> I vaguely recall Dmitry mentioning that the EMC in early generations of
>>> Tegra used to have controls for individual memory clients, but I don't
>>> see that in more recent generations.
>>
>> EMC doesn't have direct controls over memory clients on all Tegra SoCs,
>> but it may have some extra knobs for the MC arbitration config.
>>
>> The MC bandwidth allocation logic and hardware programming interface
>> differs among SoC generations, but the basic principle is the same.
>>
>>>>> Any ideas on how to resolve this? Let me know if the DT bindings and
>>>>> example don't make things clear enough.
>>
>> I'm also interested in the answer to this question.
>>
>> A quick thought.. maybe it could be some new ICC DT property which tells
>> that all paths are the "dma-mem":
>>
>> 	interconnects-all-dma-mem;
> 
> There could easily be cases where multiple interconnects are to system
> memory but there are additional ones which aren't, so the above wouldn't
> be able to represent such cases.

Yes, true.

>>>>>  .../firmware/nvidia,tegra186-bpmp.yaml        | 59 +++++++++++++++++++
>>>>>  1 file changed, 59 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>>>>> index dabf1c1aec2f..d40fcd836e90 100644
>>>>> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>>>>> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>>>>> @@ -43,6 +43,24 @@ properties:
>>>>>        - enum:
>>>>>            - nvidia,tegra186-bpmp
>>>>>  
>>>>> +  interconnects:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>> +    description: A list of phandle and specifier pairs that describe the
>>>>> +      interconnect paths to and from the BPMP.
>>>>> +
>>>>> +  interconnect-names:
>>>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>>>> +    description: One string for each pair of phandle and specifier in the
>>>>> +      "interconnects" property.
>>>>> +    # XXX We need at least one of these to be named dma-mem so that the core
>>>>> +    # will set the DMA mask based on the DMA parent, but all of these go to
>>>>> +    # system memory eventually.
>>>>> +    items:
>>>>> +      - const: dma-mem
>>>>> +      - const: dma-mem
>>>>> +      - const: dma-mem
>>>>> +      - const: dma-mem
>>
>> Names should be unique, otherwise it's not possible to retrieve ICC path
>> other than the first one.
> 
> Yeah, I know, that's why there's an XXX comment. =) I just wasn't sure
> what else to put there and thought this kinda made it clear that it was
> only half-baked.
> 
>>>>>    iommus:
>>>>>      $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>>      description: |
>>>>> @@ -152,8 +170,43 @@ additionalProperties: false
>>>>>  
>>>>>  examples:
>>>>>    - |
>>>>> +    #include <dt-bindings/clock/tegra186-clock.h>
>>>>>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>>      #include <dt-bindings/mailbox/tegra186-hsp.h>
>>>>> +    #include <dt-bindings/memory/tegra186-mc.h>
>>>>> +
>>>>> +    mc: memory-controller@2c00000 {
>>>>> +        compatible = "nvidia,tegra186-mc";
>>>>> +        reg = <0x02c00000 0xb0000>;
>>>>> +        interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +        status = "disabled";
>>>>> +
>>>>> +        #interconnect-cells = <1>;
>>>>> +        #address-cells = <2>;
>>>>> +        #size-cells = <2>;
>>>>> +
>>>>> +        ranges = <0x02c00000 0x0 0x02c00000 0x0 0xb0000>;
>>>>> +
>>>>> +        /*
>>>>> +         * Memory clients have access to all 40 bits that the memory
>>>>> +         * controller can address.
>>>>> +         */
>>>>> +        dma-ranges = <0x0 0x0 0x0 0x100 0x0>;
>>>>> +
>>>>> +        #memory-controller-cells = <0>;
>>>>> +
>>>>> +        emc: external-memory-controller@2c60000 {
>>>>> +            compatible = "nvidia,tegra186-emc";
>>>>> +            reg = <0x0 0x02c60000 0x0 0x50000>;
>>>>> +            interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +            clocks = <&bpmp TEGRA186_CLK_EMC>;
>>>>> +            clock-names = "emc";
>>>>> +
>>>>> +            #interconnect-cells = <0>;
>>>>> +
>>>>> +            nvidia,bpmp = <&bpmp>;
>>>>> +        };
>>>>> +    };
>>>>>  
>>>>>      hsp_top0: hsp@3c00000 {
>>>>>          compatible = "nvidia,tegra186-hsp";
>>>>> @@ -187,6 +240,12 @@ examples:
>>>>>  
>>>>>      bpmp {
>>>>>          compatible = "nvidia,tegra186-bpmp";
>>>>> +        interconnects = <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPR>,
>>>>> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
>>>>> +                        <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
>>>>> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
>>
>> I don't think this is a correct definition of the ICC paths because the
>> first node-MC_ID pair should define the source, second pair is the final
>> destination. Then the interconnect core builds (by itself) the path from
>> MC client to MC and finally to EMC based on the given source /
>> destination. Please see my v1 patchset for the example.
> 
> Okay, sounds like "source" in this case means the initiator of the
> transaction and destination is the target of the transaction. I had
> interpreted the "source" as the "source location" of the transaction (so
> for reads the source would be the system memory via the EMC, and for
> writes the source would be the memory client interface).

Yes, exactly. Maybe it would be more correct to call these pairs
initiator/target or master/slave.

> Yeah, I think that makes sense. It was also pointed out to me (offline)
> that the above doesn't work as intented for the use-case where I really
> need it. The primary reason why I need these "dma-mem" interconnect
> paths is so that the memory controller is specified as the "DMA parent"
> for these devices, which is important so that the DMA masks can be
> correctly set. Having the &emc reference in the first slot breaks that.
> Your suggestion makes sense when interpreting the terminology
> differently and it fixes the DMA parent issue (at least partially).
> 
>> It should look somewhat like this:
>>
>> interconnects =
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPR &emc TEGRA_ICC_EMEM>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc TEGRA_ICC_EMEM>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &emc TEGRA_ICC_EMEM>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc TEGRA_ICC_EMEM>;
>>
>> interconnect-names = "bpmpr", "bpmpw", "bpmpdmar", "bpmpdmaw";

This looks better to me.

> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
> going to be the same and it's arbitrarily defined, so it's effectively
> useless. But other than that it looks good.

Well, in most cases the target would be the EMEM, so that's fine. I have seen
that other vendors that may have an additional internal memory, especially
dedicated to some DSPs and in such cases the bandwidth needs are different for
the two paths (to internal memory and DDR).

> I suppose one could argue about the names a bit. Having the "bpmp"
> prefix for all of them feels a little redundant. They could also be
> [ "read", "write", "dma-read", "dma-write" ], which would make them
> a little more contextual, like we do with other clocks.
> 
> However, like I said before, at least one of these would need to be
> named "dma-mem" in order for the memory controller to be selected as
> the DMA parent. But, perhaps we just need to look at this some other
> way and specify an additional way of specifying the DMA parent for
> devices that doesn't rely on a "dma-mem" interconnect-names property.
> 
> Perhaps some new dma-parent property that takes a phandle (with perhaps
> an optional specifier) would work? I think that may tie in nicely with
> the memory controller mini-framework that I had proposed a while ago.
> 
> Rob, any thoughts on that?
> 
> Thierry
> 
>>>>> +        interconnect-names = "dma-mem", "dma-mem", "dma-mem", "dma-mem";
>>>>> +
>>>>>          iommus = <&smmu TEGRA186_SID_BPMP>;
>>>>>          mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
>>>>>          shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
>>>>>
>>

Thanks,
Georgi
