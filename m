From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [Question] MFD driver that handles clocks/resets and populates
 child nodes
Date: Mon, 2 Apr 2018 14:04:14 +0200
Message-ID: <20180402120414.GA8159@lunn.ch>
References: <CAK7LNARFWDMgmWsCjUmVrm4ZeYOcKCbizijxmDXob618ABjNWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNARFWDMgmWsCjUmVrm4ZeYOcKCbizijxmDXob618ABjNWg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> The maintainer of DWC3, Felipe Balbi, requested to
> split the glue layer driver into small parts such as
> reset, regulator, phy, etc.

What exactly did Felipe ask for? Did he ask that the patch be split
up, one patch per reset, regulator, phy etc?

Are all these resources used just by the DWC3? Or is it a true MFD,
multiple functions?

	 Andrew
 
