From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] arm: dts: imx6q: update cpufreq volt/freq table
Date: Tue, 16 Dec 2014 14:35:06 +0800
Message-ID: <20141216063504.GC2411@dragon>
References: <1417767829-11314-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417767829-11314-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 05, 2014 at 04:23:48PM +0800, Anson Huang wrote:
> According to latest i.MX6Q datasheet Rev. 3, 02/2014,
> the latest cpufreq volt/freq table is as below:
> 
> LDO enabled/bypassed(min value):
> 996MHz: VDDARM: 1.225V, VDDSOC: 1.150V;
> 792MHz: VDDARM: 1.150V, VDDSOC: 1.150V;
> 396MHz: VDDARM: 0.925V, VDDSOC: 1.150V;
> 
> the 792MHz setpoint's VDDARM min voltage is updated
> from 1.125V to 1.150V, adding 25mV to cover board IR
> drop, 1.175V is the right voltage we should use.
> 
> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied both.

Please use uppercase "ARM: " as patch prefix in the future.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
