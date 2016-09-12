From: Bui Duc Phuc <bd-phuc@jinso.co.jp>
Subject: Re: [PATCH 7/8] clocksource: Kconfig: Modify CMT config support 64bit
Date: Mon, 12 Sep 2016 09:25:52 +0900
Message-ID: <6c81d16a-85de-f49f-af66-7d80f1aa3eb4@jinso.co.jp>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
 <1473421394-9745-8-git-send-email-bd-phuc@jinso.co.jp>
 <4193048.IXigyaYqrQ@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <4193048.IXigyaYqrQ@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com, horms@verge.net.au, kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com, ryusuke.sakato.bx@renesas.com, h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp, nv-dung@jinso.co.jp
List-Id: devicetree@vger.kernel.org

Hi Laurent

Thank you for your comments.
> I think you should instead add
>
> 	select SH_TIMER_CMT
>
> to the config ARCH_RENESAS section in arch/arm64/Kconfig.platforms
I will update in V2.

-- 
Regards,

Bui Duc Phuc
