From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH v2 0/5] Reset Controller Nodes for TI Keystone platforms
Date: Thu, 19 Jan 2017 09:46:47 -0800
Message-ID: <82d51237-106e-73f0-dc88-8085bdfb80fe@oracle.com>
References: <20170112014843.19569-1-s-anna@ti.com>
 <e5b84f7c-fb55-25f2-8079-47b4a7ecde1a@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e5b84f7c-fb55-25f2-8079-47b4a7ecde1a@oracle.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suman Anna <s-anna@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Andrew Davis <afd@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 1/11/17 6:28 PM, santosh.shilimkar@oracle.com wrote:
> On 1/11/17 5:48 PM, Suman Anna wrote:
>> Hi Santosh,
>>
>> This is a slightly updated patch series for the reset controller nodes
>> for
>> TI Keystone2 SoCs. The only change is to rename the reset controller
>> nodes
>> from "psc-reset-controller" to just "reset-controller" following Rob
>> Herring's
>> comment on the Documentation update patch [1]. There are no changes to
>> the first
>> 2 patches. I have already posted a v2 for the Documentation update as
>> well.
>> Please pick this up instead of the v1 series [2].
>>
> I haven't picked up V1 so no worries. Even V2 I won't apply for another
> week to give some more time if there are any more comments on the
> bindings.
>
> Thanks for following up.

Series applied !!
