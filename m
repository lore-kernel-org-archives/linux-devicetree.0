From: Qais Yousef <qais.yousef@imgtec.com>
Subject: Re: [PATCH] Revert "of/irq: make of_irq_find_parent static"
Date: Thu, 3 Dec 2015 09:40:39 +0000
Message-ID: <56600E17.7060408@imgtec.com>
References: <1449072887-2734-1-git-send-email-qais.yousef@imgtec.com>
 <CAOiHx=m9BCsxQRcEs-ReKujaKo0BRs1V51wX7jzvhgjV0iZkJw@mail.gmail.com>
 <CAL_JsqLfFZJ6P6j3ZrjsNNYTqYxyPWMnRTh95NzR1vOm+XtAaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLfFZJ6P6j3ZrjsNNYTqYxyPWMnRTh95NzR1vOm+XtAaA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Jonas Gorski <jogo@openwrt.org>, Carlo Caione <carlo@caione.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On 12/02/2015 05:10 PM, Rob Herring wrote:
> +Carlo
>
> On Wed, Dec 2, 2015 at 10:32 AM, Jonas Gorski <jogo@openwrt.org> wrote:
>> Make the revert part of the series that needs it, so it won't get
>> moved again because of no external users.
> There's 2 cases[1] wanting it, so I'm planning to apply for 4.4 since
> we removed it in 4.4.
>
> Reverting is perhaps the wrong thing as it conflicts, also needs an
> EXPORT_SYMBOL, and needs to be moved for !OF_IRQ builds as pointed out
> below.

I don't need the EXPORT_SYMBOL() in my case since I'm using it from ARCH 
code.

> [1] http://www.spinics.net/lists/arm-kernel/msg464847.html

Looks like it's already sorted then. I'll pull in this patch and test it.

Thanks,
Qais
