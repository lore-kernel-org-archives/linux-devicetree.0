From: Ding Tianhong <dingtianhong@huawei.com>
Subject: Re: [PATCH v4 1/4] arm64: arch_timer: Add device tree binding for
 A-008585 erratum
Date: Thu, 8 Sep 2016 19:46:34 +0800
Message-ID: <57D14F9A.2050007@huawei.com>
References: <1467877572-10817-1-git-send-email-oss@buserror.net>
 <e69db8b1-5fe2-ed0a-b073-de3efdd854d2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e69db8b1-5fe2-ed0a-b073-de3efdd854d2@suse.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <mbrugger@suse.com>, Scott Wood <oss@buserror.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: devicetree@vger.kernel.org, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

Ping

On 2016/8/25 19:04, Matthias Brugger wrote:
> Hi all,
> 
> On 07/07/16 09:46, Scott Wood wrote:
>> This erratum describes a bug in logic outside the core, so MIDR can't be
>> used to identify its presence, and reading an SoC-specific revision
>> register from common arch timer code would be awkward.  So, describe it
>> in the device tree.
>>
>> Signed-off-by: Scott Wood <oss@buserror.net>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
> 
> As of today I wasn't able to find this series in linux-next. Was this series somehow forgotten? Scott maybe you can resend the patches adding the clocksource maintainer.
> 
> Regards,
> Matthias
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> 
