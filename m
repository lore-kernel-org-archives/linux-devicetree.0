From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v3] pinctrl: msm: Add msm8960 definitions
Date: Wed, 9 Jul 2014 15:12:22 -0700
Message-ID: <CAJAp7Oj6SxUVAnW=Oy0zpb2Z8dnzdPcbS0qYiPY9HmYLUrFaYQ@mail.gmail.com>
References: <1404881971-10341-1-git-send-email-bjorn.andersson@sonymobile.com>
	<CACRpkdbuTp1RuejHTtpcLFcgFryiyu=q3qFXGLvY0eXKiZ=+ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbuTp1RuejHTtpcLFcgFryiyu=q3qFXGLvY0eXKiZ=+ng@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Mark Rutland <mark.rutland@arm.com>, Andreas Frber <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 9, 2014 at 4:47 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This v3 version applied.
>

Awesome, thanks!

> BTW: does this cover the 8660 too or does that chip need a separate
> subdriver? I'm told that the second digit in qualcomm numbers is
> "just" about the modem version, but I guess that can affect the pinout.
>

Unfortunately that would make things too simple, but there's a lot of
reuse between the two; one of those being that the TLMM block seems to
be functionally the same, so one more pinout table and we should have
that covered as well.

Regards,
Bjorn
