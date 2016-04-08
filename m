From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 12/18] dt-bindings: Add PLX Technology OXNAS pinctrl
 and gpio bindings
Date: Fri, 8 Apr 2016 13:14:46 +0200
Message-ID: <CACRpkdbHdMG6PLxs-37kdyM55qye2igxdgHMxn3fUaoEaRdU+w@mail.gmail.com>
References: <1458838215-23314-1-git-send-email-narmstrong@baylibre.com>
	<1458838215-23314-13-git-send-email-narmstrong@baylibre.com>
	<20160325144834.GA27177@rob-hp-laptop>
	<CACRpkdbem5a_aLTHErp0ZvanwvVPbGnDiWxM5e7iX_FdHtXprQ@mail.gmail.com>
	<CAL_JsqLsKEb+dWLg9VD3p=kjgEV84_r8z89p0QgMJWKqjrGNpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLsKEb+dWLg9VD3p=kjgEV84_r8z89p0QgMJWKqjrGNpw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 3:36 PM, Rob Herring <robh@kernel.org> wrote:

> Looking at one example, it appears to be redundant already.
> nomadik-gpio-chips property already gives you the index. The index of
> the phandles is the bank numbering. PIC32 could do the same.

nomadik-gpio-chips is a property on the pin controller,
so it goes the wrong direction I think, the pin controller
knows these indexes but the GPIO chip does not know
what index it has.

Yours,
Linus Walleij
