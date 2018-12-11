From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am654-base-board: Add MMC/SD
 support
Date: Tue, 11 Dec 2018 19:02:34 +0530
Message-ID: <f2f31347-3aa3-8dda-84a3-bd112aa3ff9d@ti.com>
References: <20181207084233.13700-1-faiz_abbas@ti.com>
 <20181207084233.13700-3-faiz_abbas@ti.com>
 <20181208155427.jmidz4vsw4k4qj36@akan>
 <c1dd9783-84dc-9dad-ea94-9a14a4ad814d@ti.com>
 <20181210120647.i3ply3p7umvedb3u@akan> <20181210234730.GH6707@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210234730.GH6707@atomide.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
Cc: Faiz Abbas <faiz_abbas@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, t-kristo@ti.com, kishon@ti.com, ulf.hansson@linaro.org, adrian.hunter@intel.com, michal.simek@xilinx.com, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Hi Tony,

On 11/12/18 5:17 AM, Tony Lindgren wrote:
> * Nishanth Menon <nm@ti.com> [181210 12:07]:
>> I really am curious how Arnd / Tony actually pull this one off.. If they
>> have continous cron job for checking if your patch is ready... I doubt
>> it..
> 
> The only way that works in a distributed manner is for the patch
> authors to resend after the dependencies have cleared.
> 
> As some people don't know this, at least I try to reply with
> something about tagging patch as read and assuming it will get
> resent after dependencies have cleard.
> 
> Otherwise the todo list just keeps growing eternally :)

Alright, if the preference is to resend patches after dependencies are
cleared, I think it will also be better to mark the initial review-only
version as "RFC" (as Nishanth requested).

Thanks,
Sekhar
