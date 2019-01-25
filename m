From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] arm64: dts: hikey: Revert "Enable HS200 mode on eMMC"
Date: Fri, 25 Jan 2019 09:41:48 -0800
Message-ID: <CALAqxLW9B6zZi=iQK02QEcAq=xzBiZ-xO-18t2izsKgJstzfmQ@mail.gmail.com>
References: <1548273966-5889-1-git-send-email-john.stultz@linaro.org> <107a6e2e-ddd8-cbc1-5680-1b5899665327@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <107a6e2e-ddd8-cbc1-5680-1b5899665327@arm.com>
Sender: stable-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Ryan Grachek <ryan@edited.us>, Alistair Strachan <astrachan@google.com>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, "stable #4 . 17+" <stable@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 24, 2019 at 3:18 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Hi John,
>
> On 23/01/2019 20:06, John Stultz wrote:
> > From: Alistair Strachan <astrachan@google.com>
> >
> > This reverts commit abd7d0972a192ee653efc7b151a6af69db58f2bb. This
> > change was already partially reverted by John Stultz in commit
> > 9c6d26df1fae ("arm64: dts: hikey: Fix eMMC corruption regression").
> >
> > This change appears to cause controller resets and block read failures
> > which prevents successful booting on some hikey boards.
>
> FWIW, you might want to have a play with the pinctrl settings - I've
> seen various flakiness with HS200 eMMCs on Rockchip boards which could
> be solved by bumping up the drive strength.
>

Hm. Thanks for the tip. I'll have to dig around to see if that can
help. In the meantime though, I think the revert is the right
solution, as this is currently blocking some boards from booting
mainline.  We can then look to re-enable HS200 mode if we can sort out
the issues we saw with boards using hynix mmc chips.

thanks
-john
