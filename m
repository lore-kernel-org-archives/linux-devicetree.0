From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [Question] MFD driver that handles clocks/resets and populates
 child nodes
Date: Mon, 2 Apr 2018 22:21:01 +0900
Message-ID: <CAK7LNAQ6LKk3NtGLB8g07ocyvXidpTHsApeDuctvEHyyLvk2ew@mail.gmail.com>
References: <CAK7LNARFWDMgmWsCjUmVrm4ZeYOcKCbizijxmDXob618ABjNWg@mail.gmail.com>
 <20180402120414.GA8159@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180402120414.GA8159@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

2018-04-02 21:04 GMT+09:00 Andrew Lunn <andrew@lunn.ch>:
>> The maintainer of DWC3, Felipe Balbi, requested to
>> split the glue layer driver into small parts such as
>> reset, regulator, phy, etc.
>
> What exactly did Felipe ask for? Did he ask that the patch be split
> up, one patch per reset, regulator, phy etc?


Yeah.  That is what we understood from his comments.


These are the feed-backs from him.

https://lkml.org/lkml/2018/1/23/298
https://lkml.org/lkml/2018/1/24/352




> Are all these resources used just by the DWC3? Or is it a true MFD,
> multiple functions?

I do not think this is a real MFD.

This is a DWC3 glue layer, i.e.
a collection of misc registers that control
the DWC3 IP.


Just splitting it into small pieces
to use PHY, reset, regulator framework in Linux.

Of course, the price of this approach
is so cluttered Device Tree,
honestly I do not like it much.



>
>          Andrew
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
