From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v11 0/6] Add support for Qualcomm A53 CPU clock
Date: Thu, 7 Dec 2017 18:02:36 +0200
Message-ID: <0b365abd-1683-6fcd-b013-7b517c2b9283@linaro.org>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171206210847.mhrsxgytl4ihwgyq@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171206210847.mhrsxgytl4ihwgyq@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/06/2017 11:08 PM, Rob Herring wrote:
> On Tue, Dec 05, 2017 at 05:46:55PM +0200, Georgi Djakov wrote:
>> This patchset adds support for the A53 CPU clock on MSM8916 platforms
>> and allows scaling of the CPU frequency on msm8916 based platforms.
>>
>> Changes since v10 (https://lkml.org/lkml/2017/12/1/577)
>> * Addressed Bjorn's comments on APCS clock driver.
>> * Picked Acks from Rob and Bjorn.
> 
> Errr, really?

Oops sorry, it was a Reviewed-by for the mailbox binding change and not
an Ack. Thank you for reviewing the constantly changing binding in this
patchset. I hope that it will not change anymore.

BR,
Georgi
