From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/2 v2] ARM: dts: Add Aspeed SoC USB controllers to
 device-tree
Date: Wed, 28 Mar 2018 11:02:18 +1030
Message-ID: <CACPK8XcrcKQSX5Eq3Cq26j1W9kJJezF+AR3pDu6U-MyWS+2yhg@mail.gmail.com>
References: <1515738064.31850.100.camel@kernel.crashing.org>
 <1516031982.5522.3.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1516031982.5522.3.camel@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree <devicetree@vger.kernel.org>, Joel Stanley <joel.stanley@au1.ibm.com>, linux-aspeed@lists.ozlabs.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 16 January 2018 at 02:29, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2018-01-12 at 17:21 +1100, Benjamin Herrenschmidt wrote:
>> This adds the USB controllers to the DT template of the
>> AST24xx and AST25xx SoCs.
>>
>> This patch doesn't enable them by default on any board specific
>> .dts yet. This will be done when we have the necessary clock/reset
>> and pinmux support. In the meantime though, this will work if
>> u-boot configures things properly.
>>
>> For the AST2400 I only added pinmux definition for port 1
>> which is dual USB1/USB2. There are additional USB1 only ports
>> that might require more work but I don't have HW to test at
>> hand so I'm leaving that to whoever cares.
>>
>> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> ---
>>
>> v2: Previous patch was missing actually adding the nodes
>>     (which was an old patch in my tree I had forgotten to
>>     merge).
>>
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 27 +++++++++++++++++++++++++++
>>  arch/arm/boot/dts/aspeed-g5.dtsi | 40 ++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 67 insertions(+)

> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

This one also slipped through the cracks. I have applied it to the
aspeed tree with Andrew's review.

Cheers,

Joel
