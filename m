From: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH] arm: dts: pxa3xx: provide correct clk-names property for
 nand controller node
Date: Wed, 19 Sep 2018 18:20:38 +0200
Message-ID: <f3e704f5-a5ac-ea4a-65f2-9dc11a67c9f2@zonque.org>
References: <20180624174205.20648-1-daniel@zonque.org>
 <87po0emxhg.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87po0emxhg.fsf@belgarion.home>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, haojian.zhuang@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Robert,

On 25/6/2018 10:18 PM, Robert Jarzmik wrote:
> Daniel Mack <daniel@zonque.org> writes:
> 
>> The NAND driver looks for a clock named "core" and falls back to a pdev
>> clock that has a wrong rate if not set.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Applied to pxa/dt with a small "line swap", ie. clock-names is one line below
> "clocks" line.

This patch got applied twice in mainline, as ce4313f318de and as 
267a113cec97. Not sure what went wrong here, but the same property npow 
occurs twice in the node, which leads to an error during dtb complication.

Could you queue a revert for ce4313f318de?


Thanks,
Daniel
