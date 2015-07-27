From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: etraxfs: add support for ARTPEC-3
Date: Mon, 27 Jul 2015 15:03:02 +0200
Message-ID: <CACRpkdZcdsgQ43iOrXk410aFfuvtoyoTpB1BxF-LwDg3uc+Q8w@mail.gmail.com>
References: <1437570319-25297-1-git-send-email-rabin@rab.in>
	<1437570319-25297-3-git-send-email-rabin@rab.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1437570319-25297-3-git-send-email-rabin@rab.in>
Sender: linux-gpio-owner@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 22, 2015 at 3:05 PM, Rabin Vincent <rabin@rab.in> wrote:

> Add support for the GIO block in the ARTPEC-3 SoC.  The basic
> functionality is essentialy the same as the version in the ETRAX FS,
> except for a different set of ports, including a read-only port.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rabin Vincent <rabin@rab.in>

Uncontroversial DT bindings, so patch applied.

Yours,
Linus Walleij
