From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v9 3/7] mailbox: qcom: Move the apcs struct into a
 separate header
Date: Fri, 27 Oct 2017 17:20:58 +0300
Message-ID: <5bad4c4b-362b-ba9f-3072-1cced7a004dd@linaro.org>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-4-georgi.djakov@linaro.org>
 <20171026042811.GL1575@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171026042811.GL1575@tuxbook>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, sboyd@codeaurora.org
Cc: jassisinghbrar@gmail.com, robh+dt@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

Thanks for reviewing!

On 10/26/2017 07:28 AM, Bjorn Andersson wrote:
> On Thu 21 Sep 09:49 PDT 2017, Georgi Djakov wrote:
> 
>> Move the structure shared by the APCS IPC device and its subdevices
>> into a separate header file.
>>
> 
> As you're creating the apcs regmap with devm_regmap_init_mmio() you can
> just call dev_get_regmap(dev->parent) in your child to get the handle.

Ok, thanks!

> 
> But I would prefer that you just add the clock code to the existing
> driver.

This will require an ack from Stephen, and i got the impression that he
prefers a separate clk driver [1].

Stephen, are you ok with registering the clocks from the apcs mailbox
driver?

[1] https://lkml.org/lkml/2017/6/26/750
