From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 02/11] devicetree: bindings: Document Qualcomm cpus and enable-method
Date: Tue, 5 Nov 2013 12:12:14 -0600
Message-ID: <C287AB4F-B8E5-4D48-9C49-62C7EFAE154A@codeaurora.org>
References: <1383343739-23080-1-git-send-email-sboyd@codeaurora.org> <1383343739-23080-3-git-send-email-sboyd@codeaurora.org> <CAL_JsqLObXEWJJ=SuifTjpPz9qTW0n43fyQNA-vjLNeLy-7-XA@mail.gmail.com> <20131104173606.GL21983@codeaurora.org> <378446F7-DC51-448D-AF99-93F98CEAFB03@codeaurora.org> <52792C60.2030405@codeaurora.org> <1A27B0E2-FB92-488D-A0B3-65E677525720@codeaurora.org> <52792EF6.2040005@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <52792EF6.2040005@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robherring2@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Brown <davidb@codeaurora.org>, Rohit Vaswani <rvaswani@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Nov 5, 2013, at 11:46 AM, Stephen Boyd wrote:

> On 11/05/13 09:43, Kumar Gala wrote:
>> On Nov 5, 2013, at 11:35 AM, Stephen Boyd wrote:
>> 
>>> On 11/05/13 09:12, Kumar Gala wrote:
>>>> I think this should be more specific than just 'qcom,mmio' or 'qcom,warm-boot'.  It should be 'qcom,kpss-acc-v1' or 'qcom-gcc-8660'.
>>>> 
>>> Do you have any reasons why? I don't see why we need to keep adding more
>>> and more enable-methods every time the subsystem surrounding the CPU
>>> changes. The method is the same, write some registers to power up the
>>> CPU for the first time (cold boot) or ping the CPU to wake it up
>>> (warmboot). The only difference is where those registers live and a
>>> slight variation in the sequence that we perform.
>> By that argument every device could just be compatible with 'mmio' and be done with it ;)
>> 
>> As the registers you write vary, the compatible should vary.
> 
> The compatible does vary. The enable-method is not a compatible property.
> 
> -- 

I've always felt that the enable-method is equivalent of a compatible property.

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
