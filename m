From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [RFC PATCH v2 2/5] dt: qcom: msm8974: add qpnp-spmi device nodes
Date: Wed, 09 Jul 2014 18:28:19 +0300
Message-ID: <53BD5F93.6030205@mm-sol.com>
References: <1404393243-7324-1-git-send-email-svarbanov@mm-sol.com> <1404393243-7324-3-git-send-email-svarbanov@mm-sol.com> <20140709141026.GB2635@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140709141026.GB2635@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Josh Cartwright <joshc@codeaurora.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

On 07/09/2014 05:10 PM, Lee Jones wrote:
> On Thu, 03 Jul 2014, Stanimir Varbanov wrote:
> 
>> From: Ivan T. Ivanov <iivanov@mm-sol.com>
>>
>> The qpnp-spmi device nodes are childrens of spmi pmic arbiter.
>> msm8974 SoC using two pmic chips pm8941 and pm8841. Every chip
>> has two spmi-qpnp bus id's.
>>
>> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
>> ---
>>  arch/arm/boot/dts/qcom-msm8974.dtsi |   45 +++++++++++++++++++++++++++++++++++
>>  1 files changed, 45 insertions(+), 0 deletions(-)
> 
> Subject should start with 'ARM: ' for all of your arch/arm patches.

Sure, will correct the subject, thanks.

-- 
regards,
Stan
