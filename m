From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5250: turn on the LDO10 on SMDK5250
Date: Fri, 14 Mar 2014 18:18:35 +0100
Message-ID: <532339EB.5090304@samsung.com>
References: <1393845310-1898-1-git-send-email-yuvaraj.cd@samsung.com>
 <CAKuRcO+vudiKC1SRGMWgb3Ec0-JrVNeCxM5g5eTNR3OnQmmMTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <CAKuRcO+vudiKC1SRGMWgb3Ec0-JrVNeCxM5g5eTNR3OnQmmMTQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Yuvaraj Kumar <yuvaraj.cd@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Jingoo Han <jg1.han@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Mark Rutland <mark.rutland@arm.com>, sunil joshi <joshi@samsung.com>, "ks.giri@samsung.com" <ks.giri@samsung.com>, thomas.ab@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Yuvaraj,

On 14.03.2014 09:26, Yuvaraj Kumar wrote:
> Any comments on this?
>
> On Mon, Mar 3, 2014 at 4:45 PM, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com> wrote:
>> Commit 275dcd2 "ARM: dts: add max77686 pmic node for smdk5250" added
>> required LDO's for SMDK5250 boards.Currently LDO10 is turned off.As LDO10,
>> enable/disable the LDO22 which is required for VDDQ_MMC2_AP.So this patch
>> makes LDO10 turn's on always.

This does not seem right to me. Why a regulator used by MMC should be 
always enabled? Shouldn't it be specified as one of the MMC regulators 
in corresponding MMC controller node?

Best regards,
Tomasz
