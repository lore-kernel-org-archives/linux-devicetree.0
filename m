From: Florian Fainelli <florian.fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND PATCH 1/1] arm64: dts: NS2 secondary core enablement via
 PSCI
Date: Mon, 18 Apr 2016 17:10:18 -0700
Message-ID: <5715776A.1020303@broadcom.com>
References: <1461020988-20727-1-git-send-email-luke.starrett@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461020988-20727-1-git-send-email-luke.starrett-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luke Starrett <luke.starrett-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/04/16 16:09, Luke Starrett wrote:
> Declare PSCI-1.0 node and enable CPU_ON method via PSCI.  Spin-table
> memreserve removed and syscon based reset as PSCI-1.0 expects firmware
> reset implementation.
> 
> Signed-off-by: Luke Starrett <luke.starrett-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

LGTM, thanks!
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
