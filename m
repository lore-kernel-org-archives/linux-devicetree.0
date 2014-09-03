From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 1/2] Documentation: devicetree: mfd: twl4030-power: Use
 the standard 'ti,system-power-controller' to mark power control
Date: Wed, 3 Sep 2014 15:31:44 -0500
Message-ID: <CAGo_u6qkjb0N05XYGHrR6ag8eBCG=b+5NtSeA8E9SdgTw07A1A@mail.gmail.com>
References: <1409771208-21867-1-git-send-email-nm@ti.com>
	<1409771208-21867-2-git-send-email-nm@ti.com>
	<20140903195317.GA678@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20140903195317.GA678@earth.universe>
Sender: linux-omap-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-omap <linux-omap@vger.kernel.org>, dt list <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 3, 2014 at 2:53 PM, Sebastian Reichel <sre@kernel.org> wrote:
> On Wed, Sep 03, 2014 at 02:06:47PM -0500, Nishanth Menon wrote:

>>  Optional properties:
>> -- ti,use_poweroff: With this flag, the chip will initiates an ACTIVE-to-OFF or
>> -                SLEEP-to-OFF transition when the system poweroffs.
>> +
>> +- ti,system-power-controller OR ti,use_poweroff: This indicates that
>> +  TWL4030 is the power supply master of the system. With this flag, the
>> +  chip will initiates an ACTIVE-to-OFF or SLEEP-to-OFF transition when
>> +  the system poweroffs.
>
> I suggest the following wording:
>
> - ti,system-power-controller: This indicates that TWL4030 is the
>   power supply master of the system. With this flag, the chip will
>   initiates an ACTIVE-to-OFF or SLEEP-to-OFF transition when the
>   system poweroffs.
>
> - ti,use_poweroff: Deprecated name for ti,system-power-controller

Yes, this does indeed sound better. if no one has a different opinion
or further comments, will update this patch tomorrow.

-- 
---
Regards,
Nishanth Menon
