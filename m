From: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Subject: Re: [PATCH-v2 1/5] mfd: 88pm800: Fix tabbing issue
Date: Tue, 25 Aug 2015 14:20:21 +0530
Message-ID: <55DC2C4D.1040304@linaro.org>
References: <1440442594-3102-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1440442594-3102-3-git-send-email-vaibhav.hiremath@linaro.org>
 <20150825075246.GF19409@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150825075246.GF19409@x1>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Tuesday 25 August 2015 01:22 PM, Lee Jones wrote:
> On Tue, 25 Aug 2015, Vaibhav Hiremath wrote:
>
>> Driver had coding style issues where spaces were used instead
>> of tabs. This patch fixes them all.
>>
>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
>> ---
>>   drivers/mfd/88pm800.c | 125 ++++++++++++++++++++++++--------------------------
>>   1 file changed, 61 insertions(+), 64 deletions(-)
>
> Same comment as before.
>
> How similar is this file to the other one?

I believe you are referring to include/linux/mfd/88pm80x.h

>
> Can you reduce the size by having shared register defines?
>

Not sure whether I understand your comment here,
They are common defines.

PM860 only defines are named as

PM860_XXXX

Similarly,
PM805 only defines are named as

PM805_XXXX


and PM800_xxx should be common.

Thanks,
Vaibhav
