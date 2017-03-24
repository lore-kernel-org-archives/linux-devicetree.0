From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/9] arm64: mm: install SError abort handler
Date: Fri, 24 Mar 2017 10:53:48 -0700
Message-ID: <710c4142-ae20-9715-3e51-910a2073a64e@gmail.com>
References: <20170324144632.5896-1-opendmb@gmail.com>
 <20170324144632.5896-4-opendmb@gmail.com>
 <20170324151654.GD29588@leverpostej> <58D54DE8.9020707@gmail.com>
 <20170324173515.GB10746@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170324173515.GB10746@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Doug Berger <opendmb@gmail.com>
Cc: wangkefeng.wang@huawei.com, catalin.marinas@arm.com, linus.walleij@linaro.org, will.deacon@arm.com, mingo@kernel.org, panand@redhat.com, f.fainelli@gmail.com, jonathanh@nvidia.com, bgolaszewski@baylibre.com, bcm-kernel-feedback-list@broadcom.com, shijie.huang@arm.com, treding@nvidia.com, devicetree@vger.kernel.org, vladimir.murzin@arm.com, cmetcalf@mellanox.com, suzuki.poulose@arm.com, andre.przywara@arm.com, robh+dt@kernel.org, gregory.0xf0@gmail.com, sandeepa.s.prabhu@gmail.com, horms+renesas@verge.net.au, linux-arm-kernel@lists.infradead.org, mirza.krak@gmail.com, linux-kernel@vger.kernel.org, james.morse@arm.com, olof@lixom.net, computersforpeace@gmail.com
List-Id: devicetree@vger.kernel.org

On 03/24/2017 10:35 AM, Mark Rutland wrote:
> On Fri, Mar 24, 2017 at 09:48:40AM -0700, Doug Berger wrote:
>> On 03/24/2017 08:16 AM, Mark Rutland wrote:
>>> On Fri, Mar 24, 2017 at 07:46:26AM -0700, Doug Berger wrote:
> 
>> If you would consider an alternative implementation where we scrap
>> the SError handler (i.e. maintain the ugliness in our downstream
>> kernel) in favor of a more gentle user mode crash on SError that
>> allows the kernel the opportunity to service the interrupt for
>> diagnostic purposes I could try to repackage that.
> 
> If this is just for diagnostic purposes, I believe you can register a
> panic notifier, which can then read from the bus. The panic will occur,
> but you'll have the opportunity to log some information to dmesg.

And crash the kernel? That sounds awful, FWIW the ARM/Linux kernel is
able to recover just fine from user-space accessing e.g: invalid
physical addresses in the GISB register space, bringing the same level
of functionality to ARM64/Linux sounds reasonable to me.
-- 
Florian
