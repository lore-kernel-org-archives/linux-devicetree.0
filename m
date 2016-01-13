From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Wed, 13 Jan 2016 11:18:11 +0100
Message-ID: <4304958.38AKuZJ4gb@wuerfel>
References: <568912EE.9030009@huawei.com> <4731036.9QlepWb5cE@wuerfel> <20160113101028.GV13633@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160113101028.GV13633@e106497-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: liviu.dudau@arm.com
Cc: Rongrong Zou <zourongrong@huawei.com>, Rongrong Zou <zourongrong@gmail.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Corey Minyard <minyard@acm.org>, gregkh@linuxfoundation.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linuxarm@huawei.com, benh@kernel.crashing.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 13 January 2016 10:10:28 liviu.dudau@arm.com wrote:
> 
> OK, but from DT point of view and given the parent's #address-cells = <2> and #size-cells = <1>
> should the reg not be something like reg = <0x1 0x0 0xe4 4> ?

No: 2+1 = 3, not 4.

	Arnd
