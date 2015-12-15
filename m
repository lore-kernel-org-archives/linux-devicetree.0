From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 17/19] ARM: dts: armada: replace
 isil,irq2-can-wakeup-machine with wakeup-source property
Date: Tue, 15 Dec 2015 16:39:09 +0000
Message-ID: <5670422D.7020404@arm.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-18-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445422216-29375-18-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org



On 21/10/15 11:10, Sudeep Holla wrote:
> Though the driver will continue to check for and support the legacy
> "isil,irq2-can-wakeup-machine" boolean property to wakeup source,
> "wakeup-source" is the new standard binding.
>
> This patch replaces the legacy "isil,irq2-can-wakeup-machine" with the
> unified "wakeup-source" property in order to avoid any futher copy-paste
> duplication.
>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@free-electrons.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>

Ping, do you prefer taking via your tree or should I send to armsoc
directly ?

-- 
Regards,
Sudeep
