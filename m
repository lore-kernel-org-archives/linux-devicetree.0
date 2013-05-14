From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: dove: add PMU functions to pinctrl
Date: Tue, 14 May 2013 14:59:01 +0200
Message-ID: <CACRpkdZVBiTJCPaSmPGTPs+aaRf2VQt+Zz=odL47ysg4a1c0RQ@mail.gmail.com>
References: <1367883368-27889-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1367883368-27889-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 7, 2013 at 1:36 AM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:

> Dove power management unit can mux some special functions to mpp0-15.
> This patch adds support to set/get the current PMU function mapped
> to the corresponding mpp pins. The device tree documentation is also
> updated accordingly.
>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Patch applied with Jason's ACK.

Thanks!
LInus Walleij
