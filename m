From: Bui Duc Phuc <bd-phuc@jinso.co.jp>
Subject: Re: [PATCH 1/8] devicetree: binding: R-car Gen3 CMT0 and CMT1
 bindings
Date: Tue, 13 Sep 2016 00:12:08 +0900
Message-ID: <7916c4bd-94a1-0d87-e2dc-2fd852976cfc@jinso.co.jp>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
 <1473421394-9745-2-git-send-email-bd-phuc@jinso.co.jp>
 <CAMuHMdVAuyWUid6GEJXNoyw4bH3h=QWmo7eMLyiCayc5UQaoFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVAuyWUid6GEJXNoyw4bH3h=QWmo7eMLyiCayc5UQaoFA@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>, =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>, Cao Minh Hiep <cm-hiep@jinso.co.jp>, =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv->
List-Id: devicetree@vger.kernel.org

Dear Geert,

> I think the plan was to get rid of the renesas,cmt-48-* bindings, as they do
> not allow to differentiate between CMT0 and CMT1, which have different feature
> sets.
>
> Cfr. Magnus' series "clocksource: sh_cmt: DT binding rework V4"
> (https://lkml.org/lkml/2016/3/14/433).
>
> Magnus: What's the status of your series?
Thank for your comments. I will update in V2.
I am still waiting for Magnus's comments, but from my point of 
view,Magnus's patches seem
support 32 bit counter only, they are not suitable for 48bit counter.
According to hardware manual, there has to be registers ( CMCSRH, 
CMCNTH,CMCORH) set for 48 bit counter,
but I do not see the registers ( CMCSRH, CMCNTH,CMCORH) in Magnus's patches.


-- 
Regards,

Bui Duc Phuc

