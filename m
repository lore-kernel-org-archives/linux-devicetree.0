From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v5 00/14] Add support for MSM's mmio clock/reset controller
Date: Fri, 07 Feb 2014 11:38:42 -0800
Message-ID: <52F53642.3030606@gmail.com>
References: <1389811654-21397-1-git-send-email-sboyd@codeaurora.org>
 <52F45DEE.8020400@gmail.com> <1391749891.15777.31.camel@joe-AO722>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1391749891.15777.31.camel@joe-AO722>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joe Perches <joe@perches.com>
Cc: devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Saravana Kannan <skannan@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2/6/2014 9:11 PM, Joe Perches wrote:
> On Thu, 2014-02-06 at 20:15 -0800, Frank Rowand wrote:
>> On 1/15/2014 10:47 AM, Stephen Boyd wrote:
>>> The first breaks a reset-controller include ordering requirement. It got
>>> an ack so I think we're ok for it to go through the clock tree.
>>>
>>
>> < snip >
>>
>> checkpatch is whining about patches
>>
>>   4
>>   5
>>   6
>>   7
>>   8
>>
>> (Just for completeness if someone thinks I did not check all the patches,
>> it also whines about patch 11, but I think the whining should be ignored,
>> and it whines about patch 1 but I think that might be a checkpatch bug.)
> 
> Hi Frank.
> 
> For patch 1, what checkpatch bug might that be?

see below

> 
> I think all the checkpatch whinges in patch 11 are correct.

Agreed on patch 11, judgement call on whether to ignore the warnings.

> 
> I didn't check any of 4-8.

Hi Joe,

Thanks for jumping in.  I did not want to bother you until I dug a little
deeper into the warning to see if I was just misunderstanding something.

Sorry, it is patch 2, not patch 1 ("[PATCH v5 02/14] clk: Add set_rate_and_parent() op"):

   WARNING: Multiple spaces after return type
   #188: FILE: include/linux/clk-provider.h:154:
   +       int             (*set_rate_and_parent)(struct clk_hw *hw,

   total: 0 errors, 1 warnings, 152 lines checked

-Frank
