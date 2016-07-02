From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 00/21] Support qcom's HSIC USB and rewrite USB2 HS phy support
Date: Fri, 1 Jul 2016 23:03:38 -0700
Message-ID: <CALAqxLW--yFb2YwX3+x7PB-g_5D0gb6j8CiJwnCC+meb7xqbig@mail.gmail.com>
References: <20160626072838.28082-1-stephen.boyd@linaro.org>
 <CALAqxLUHfsJBTQS=p5oThnOdiAZwu48puRhREx+2G9+KajDA9g@mail.gmail.com> <146710289677.3879.15364764209076318827@sboyd-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <146710289677.3879.15364764209076318827@sboyd-linaro>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Peter Chen <peter.chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <andy.gross@linaro.org>, "Ivan T. Ivanov" <iivanov.xz@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 28, 2016 at 1:34 AM, Stephen Boyd <stephen.boyd@linaro.org> wrote:
> Quoting John Stultz (2016-06-27 20:09:30)
>>
>> I haven't yet been able to test with this, as I need some other fixes
>> it seems too to deal with some of the iommu changes in my flo-WIP tree
>> (it can't find of_dma_configure), but will let you know how things
>> work once I have all that sorted.
>
> Cool, thanks for testing.

So after working out some merge issues w/ my flo-WIP branch for the
nexus7, I was still having trouble, so I backed out to just your
(updated) branch.

But even there, I'm not able to get the usb gadget up. I see:

[    1.869717] msm_hsusb 12500000.usb: failed to get phandle in
/soc/usb@12500000 node
[    1.882347] 12500000.usb supply vbus not found, using dummy regulator

So I'm not sure if the dts changes were quite right. I've got all the
ULPI configs enabled. Any ideas?

thanks
-john
