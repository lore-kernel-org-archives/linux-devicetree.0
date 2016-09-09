From: Bui Duc Phuc <bd-phuc@jinso.co.jp>
Subject: Re: [PATCH 7/8] clocksource: Kconfig: Modify CMT config support 64bit
Date: Fri, 9 Sep 2016 12:06:13 +0900
Message-ID: <fc2f5eb3-7002-5e96-49d4-09577c0c607e@jinso.co.jp>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
 <1473421394-9745-8-git-send-email-bd-phuc@jinso.co.jp>
 <9b18bc0e-3447-6ab2-3c28-54e54a19dc6f@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <9b18bc0e-3447-6ab2-3c28-54e54a19dc6f@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com, horms@verge.net.au, kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com, ryusuke.sakato.bx@renesas.com, h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp, nv-dung@jinso.co.jp
List-Id: devicetree@vger.kernel.org

Hi Sergei

  Thanks for your comment.

>> +    bool "Renesas CMT timer driver" if ( ARM64 || COMPILE_TEST )
>
>    Parens not needed and the spaces after/before them even less so.
>
OK
I will update in V2

Thanks & best regards.
Bui Duc Phuc
