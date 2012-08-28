From: Rajendra Nayak <rnayak@ti.com>
Subject: Re: [PATCH 2/2] arm/dts: Cleanup regulator naming and remove @0,1..
Date: Tue, 28 Aug 2012 11:51:52 +0530
Message-ID: <503C6380.4090107@ti.com>
References: <1343653940-16614-1-git-send-email-rnayak@ti.com> <1343653940-16614-3-git-send-email-rnayak@ti.com> <20120824202725.GA1303@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20120824202725.GA1303@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, b-cousson@ti.com
List-Id: devicetree@vger.kernel.org

Hi Tony,

> * Rajendra Nayak<rnayak@ti.com>  [120730 06:17]:
>> regulators do not have a 'reg' property, hence the regulator@0,
>> regulator@1 do not make sense. get rid of it.
>
> Looks like this needs to be refreshed to apply. Care to
> refresh against current devel-dt branch in case other
> places need the same change?

Looks like devel-dt is missing the PATCH 1/2 from this series,
which you have already pushed in the -rc for merge.
With that applied, this ones applies cleanly too.

regards,
Rajendra

>
> Regards,
>
> Tony

