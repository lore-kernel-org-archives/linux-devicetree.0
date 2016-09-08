From: Ding Tianhong <dingtianhong@huawei.com>
Subject: Re: [PATCH v4 1/4] arm64: arch_timer: Add device tree binding for
 A-008585 erratum
Date: Thu, 8 Sep 2016 20:31:36 +0800
Message-ID: <57D15A28.8040807@huawei.com>
References: <1467877572-10817-1-git-send-email-oss@buserror.net>
 <e69db8b1-5fe2-ed0a-b073-de3efdd854d2@suse.com> <57D14F9A.2050007@huawei.com>
 <57D15497.9030606@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <57D15497.9030606@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, Matthias Brugger <mbrugger@suse.com>, Scott Wood <oss@buserror.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

On 2016/9/8 20:07, Marc Zyngier wrote:
> On 08/09/16 12:46, Ding Tianhong wrote:
>> Ping
> 
> Oh please! Maybe you could look at the couple of points I've raised in
> this thread and help addressing them, given that you have a vested
> interest in seeing these patches being merged? Pinging people this way
> is not very productive.
> 
> Thanks,
> 

Ok, I miss that patch, I will review your command and feedback, thanks.

Ding

> 	M.
> 
>>
>> On 2016/8/25 19:04, Matthias Brugger wrote:
>>> Hi all,
>>>
>>> On 07/07/16 09:46, Scott Wood wrote:
>>>> This erratum describes a bug in logic outside the core, so MIDR can't be
>>>> used to identify its presence, and reading an SoC-specific revision
>>>> register from common arch timer code would be awkward.  So, describe it
>>>> in the device tree.
>>>>
>>>> Signed-off-by: Scott Wood <oss@buserror.net>
>>>> Acked-by: Rob Herring <robh@kernel.org>
>>>> ---
>>>
>>> As of today I wasn't able to find this series in linux-next. Was this series somehow forgotten? Scott maybe you can resend the patches adding the clocksource maintainer.
>>>
>>> Regards,
>>> Matthias
>>>
>>> _______________________________________________
>>> linux-arm-kernel mailing list
>>> linux-arm-kernel@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>>
>>>
>>
>>
> 
> 
