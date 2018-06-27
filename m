From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 1/4] dt-bindings: power: Add Actions Semi S900 SPS
Date: Wed, 27 Jun 2018 17:05:14 +0200
Message-ID: <71176a0c-dd23-2ca6-7698-9612e4ed6392@suse.de>
References: <20180411164036.8046-1-manivannan.sadhasivam@linaro.org>
 <20180411164036.8046-2-manivannan.sadhasivam@linaro.org>
 <a261bae6-d2fa-a550-7232-7647ce0ac0e2@suse.de>
 <20180626164117.GA5241@Mani-XPS-13-9360>
 <20180627145713.uao2gr5kknk2cypk@holly.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627145713.uao2gr5kknk2cypk@holly.lan>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, robh+dt@kernel.org, liuwei@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, amit.kucheria@linaro.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, manivannanece23@gmail.com, Jeff Chen <jeff.chen@actions-semi.com>, "Thomas C. Liau" <thomas.liau@actions-semi.com>
List-Id: devicetree@vger.kernel.org

Am 27.06.2018 um 16:57 schrieb Daniel Thompson:
> On Tue, Jun 26, 2018 at 10:11:17PM +0530, Manivannan Sadhasivam wrote:
>>> Question: Should it still be GPL-2.0+ or the new GPL-2.0-or-later?
>>
>> I think GPL-2.0+ is fine.
> 
> So... when I saw this I did wonder why one would knowly choose to use a
> deprecated license identifier (https://spdx.org/licenses/ ).
> 
> However running `git diff v4.17..v4.18-rc1` through some filters does
> indicate that GPL-2.0+ is the more popular choice by 256 to 0! Doesn't
> mean you couldn't break the mould though ;-).

The kernel.org documentation does not mention the new ones yet.

I checked under LICENSES/ - preferred/GPL-2.0.txt actually lists both
identifiers, and checkpatch.pl did not complain about either.

So for my personal patches I'll be going with the new identifier, unless
I hear of reasons not to.

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
