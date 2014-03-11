From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 2/3] soc: keystone: add QMSS driver
Date: Tue, 11 Mar 2014 22:44:14 +0800
Message-ID: <531F213E.50807@ti.com>
References: <1393629520-12713-1-git-send-email-santosh.shilimkar@ti.com>	<1393629520-12713-3-git-send-email-santosh.shilimkar@ti.com>
 <CAL_Jsq+O660oV9FtthG3gTkVOhL0ku-UHSrkt-ROauu1iNpbaA@mail.gmail.com>
 <531E2C55.70702@ti.com> <5EE98053-31B8-4679-AAE2-4F026C61D1D4@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5EE98053-31B8-4679-AAE2-4F026C61D1D4@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sandeep Nair <sandeep_n@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 11 March 2014 10:04 PM, Kumar Gala wrote:
> 
> On Mar 10, 2014, at 4:19 PM, Santosh Shilimkar <santosh.shilimkar@ti.com> wrote:
> 
>>>> +  -- reg-names         : Names for the above register regions. The name to be
>>>> +                         used is as follows:
>>>> +                         - "config" : Queue configuration region.
>>>> +                         - "status" : Queue status RAM.
>>>> +                         - "region" : Descriptor memory setup region.
>>>> +                         - "push"   : Queue Management/Queue Proxy region.
>>>> +                         - "pop"    : Queue Management/Queue Proxy region.
>>>> +                         - "peek"   : Queue Peek region.
>>>
>>> reg-names should be optional. Also you have the order different from
>>> reg. Be consistent as to what is the correct order.
>>>
>> We thought of using reg-names to remove the ordering to index
>> the regs. So if we make the reg-names optional, then indexing
>> by order will be used. We can do that.
> 
> We keep having this conversation, why does reg-names need to be optional for new bindings?
> 
I guess the question is for Rob.

Regards,
Santosh
