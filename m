From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH 2/2] dt-bindings: regulator: add QCOM RPMh regulator
 bindings
Date: Tue, 27 Mar 2018 16:48:21 -0700
Message-ID: <63851bce-65c2-76a2-8b75-bc268a998457@codeaurora.org>
References: <cover.1521246069.git.collinsd@codeaurora.org>
 <b718873e5ad53a2e8df6a5103828a4c04881d564.1521246069.git.collinsd@codeaurora.org>
 <20180321024311.GW2186@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321024311.GW2186@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org
List-Id: devicetree@vger.kernel.org

Hello Mark,

On 03/20/2018 07:43 PM, Mark Brown wrote:
> On Fri, Mar 16, 2018 at 06:09:11PM -0700, David Collins wrote:
>> Introduce bindings for RPMh regulator devices found on some
>> Qualcomm Technlogies, Inc. SoCs.  These devices allow a given
> 
> Please use subject lines matching the style for the subsystem.  This
> makes it easier for people to identify relevant patches.

Looking through the DT binding patches sent to devicetree@vger.kernel.org,
it seemed like the preferred style is:
[PATCH] dt-bindings: subsystem: ...

I can change the subject line for this patch to be:
"[PATCH 2/2] regulator: dt-bindings: add QCOM RPMh regulator bindings"
if you prefer.


>> +=========================================
>> +Second Level Nodes - Regulators
>> +=========================================
>> +
>> +- regulator-name
> 
> This document appears to be reproducing the standard regulator bindings;
> there is no need to do that, just reference them.

Sure, I'll remove this.

Thanks,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
