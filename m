From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] mmc: pwrseq-simple: add disable-post-power-on option
Date: Fri, 30 Dec 2016 09:05:49 +0100
Message-ID: <CACRpkdad7JXzxYfuB_XYdo2vuZmEt5iWgq79Va5cWwTaJc6Y5Q@mail.gmail.com>
References: <1480659462-29536-1-git-send-email-matt@ranostay.consulting>
 <1480659462-29536-5-git-send-email-matt@ranostay.consulting>
 <CAPDyKFpCY+LHFkJVJGHaSDODVR7_Xr2ohpdOAn9Hd3qZbDTQ6w@mail.gmail.com>
 <B85DDAB6-D86B-4DD9-BF2C-BCB9FA09CD15@ranostay.consulting>
 <CAPDyKFp9t1SEwQZ=uTHegbpgxxevQEy4kC=wPkc8Bo16030MNg@mail.gmail.com>
 <CAJ_EiSQWN0KF1rJDwzOeoi--g1Z0XNYevYzCLG=NngcdgF6VUw@mail.gmail.com>
 <20161209180930.nsy2ys66q2thbxpx@rob-hp-laptop> <CAPDyKFp2L7x=dV6O5XrA53-OOXE0sf+P3tNH93XGyzNheX9vjQ@mail.gmail.com>
 <CAJ_EiST_kSDn=ypnnZJJJ-wmB7Avp+MT7uK00H+aDhQGc4Yddg@mail.gmail.com> <CAJ_EiSRAQefYj+B3AKLb1EWXQUGccV=Z4op0T5sAdo3-vDVOhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <CAJ_EiSRAQefYj+B3AKLb1EWXQUGccV=Z4op0T5sAdo3-vDVOhg@mail.gmail.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Matt Ranostay <matt@ranostay.consulting>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Liam Breck <liam@networkimprov.net>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 19, 2016 at 1:01 AM, Matt Ranostay <matt@ranostay.consulting> wrote:

> * SD8787 has a "powerdown" line, and CW1200 has a "powerup" line.. I
> know this is a simple logic inversion.

If this is a GPIO line, the GPIO subsystem can flag a line for
inverted logic. GPIO_ACTIVE_LOW from device tree for example.

Yours,
Linus Walleij
