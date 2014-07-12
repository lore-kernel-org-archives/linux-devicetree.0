From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH 0/4] New Qualcomm PMIC pin controller drivers
Date: Sat, 12 Jul 2014 16:51:47 -0700
Message-ID: <CAJAp7OgR7xc=LSf9tj+XQY1Nk=dQxCxTZ6HBEdf0NsriDZF85g@mail.gmail.com>
References: <1404745893-6379-1-git-send-email-iivanov@mm-sol.com>
	<CACRpkdYcoA-nifxojO5tZUy6dL6P2PTSGW0mVLUfqG20rOg-Nw@mail.gmail.com>
	<1404904380.16296.17.camel@iivanov-dev>
	<CACRpkdb25foEcNroqLyZbX93FxqAZ7=2pGo6GPWP8YdrjUS8gg@mail.gmail.com>
	<CAJAp7Og0Cr3oY=XpT4NzKUWykxkRTq1ZRDyamW6tgohfBs3dmg@mail.gmail.com>
	<1404999558.16296.31.camel@iivanov-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1404999558.16296.31.camel@iivanov-dev>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <Bjorn.Andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 10, 2014 at 6:39 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:
> On Wed, 2014-07-09 at 07:02 -0700, Bjorn Andersson wrote:
[..]
>> Correct Ivan; we do however share the same issues related to how to do
>> interrupt handling,
>
> Yep, but do we actually need to do interrupt handling in driver?
> Interrupts are handled by parent device. GPIO client drivers could
> use interrupt-controller registered by core driver?
>

Among other things we have the volume and camera keys hooked to these
pins, using the gpio-keys driver; so that needs to be able to convert
a gpio to an irq.
But I don't believe we should turn this driver into an
interrupt-controller; as that wouldn't add any value...

Regards,
Bjorn
