From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/6] pinctrl-aspeed-g5: Never set SCU90[6]
Date: Mon, 7 Nov 2016 10:34:14 +0100
Message-ID: <CACRpkdbH8eubEHwHCsdJsmqVp3hkBW4vb5DCHvJxz+tyfFqbKQ@mail.gmail.com>
References: <1478097481-14895-1-git-send-email-andrew@aj.id.au>
 <1478097481-14895-2-git-send-email-andrew@aj.id.au>
 <CACPK8Xcbv5VjE9deETV6zC4cPSfeBSgP96QYqV_ebAgtB9Jwtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACPK8Xcbv5VjE9deETV6zC4cPSfeBSgP96QYqV_ebAgtB9Jwtw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 3, 2016 at 11:59 PM, Joel Stanley <joel@jms.id.au> wrote:

> In the future I think we should send fixes separately from the rest of
> the series, so it's clear to Linus where we expect patches to end up.
>
> Perhaps Linus can share his preference with us?

Just make it clear to me where the patch is headed, if it is
a fix or a new feature.

Also mixing stuff in big series is of course problematic because
all the CC:in on MFD patches and whatnot that I don't apply
makes the picture blurry, but sometimes it is anyways needed
for context so it is a soft requirement.

Yours,
Linus Walleij
