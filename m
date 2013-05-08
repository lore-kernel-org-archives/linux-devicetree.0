From: Valentin Longchamp <valentin.longchamp@keymile.com>
Subject: Re: [PATCH 1/3] clk: mvebu: add gate ctrl for Prestera kirkwood
 variants
Date: Wed, 08 May 2013 09:04:32 +0200
Message-ID: <5189F900.6020809@keymile.com>
References: <1367941941-19152-1-git-send-email-valentin.longchamp@keymile.com>
 <1367941941-19152-2-git-send-email-valentin.longchamp@keymile.com>
 <518927C0.6070600@free-electrons.com> <51892D8D.4060704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51892D8D.4060704@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, "andrew@lunn.ch" <andrew@lunn.ch>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 05/07/2013 06:36 PM, Sebastian Hesselbarth wrote:
> On 05/07/2013 06:11 PM, Gregory CLEMENT wrote:
>> On 05/07/2013 05:52 PM, Valentin Longchamp wrote:
>>> The kirkwood device found in the Prestera SoCs does not have all the
>>> peripherals of its the usual kirkwood SoCs. There are hence missing
>>> clocks in the SoCs.
>>>
>>> This patch registers another gate controller for the kirkwood that
>>> registers only the available clocks of this kirkwood variant.
>>
>> Hi Valentin,
>>
>> Overall the patch set looks OK, however I don't understand why you need
>> to declare a new gate controller. The list you delcared seemed to be
>> just a subset of the Kirkwood one, why can't you use this one?
>>
>> Note that I am not an expert for the kirkwood hardware, so maybe I
>> missed something.
> 
> I just checked my mails from late 2012 and there Valentin and I agreed,
> that not the missing bits in clock gating control registers was the root
> cause of km_kirkwood to hang. It was rather the phy gates (that do not/
> not yet exist on DT) that caused it to hang, i.e. when accessing SATA
> PHY registers.

Yeah you are right, I had forgotten about this test. I just had a look at the
board-km_kirkwood.c and I tried to figure out a way to make sure the clock gates
bits never get read/written, so never get initialized. But as you say, that's
not the real cause of the hang but

> 
> Valentin, I am not against an extra clock-gating-ctrl for Prestera but
> maybe having an kirkwood.dtsi fork without SATA and other peripherals
> will also help?

Since it's not the real problem having the extra clock-gating-ctrl would me more
consistent with the real Prestera HW, but maybe it's better to keep only one
that works for both as it's already the case, it's less code to maintain.

A better approach would be to work on the kirkwood.dtsi as you mention it. The
SATA node in kirkwood.dtsi is by default disabled, is this enough or should it
be moved to kirkwood-6281.dtsi for instance ?

> 
> And: Does DT-enabled km_kirkwood ever hang without the hack in it's
> board setup? There should be no PHY gates on DT boards..
> 

I have just tested it and it does not hang, so I will submit and patch that
simply removes this workaround since the PHY gates are not accessed anymore
(thanks to DT clock gates and that km_kirkwood does not enable the sata of node).

Valentin
