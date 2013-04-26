From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 2/2] gpio: grgpio: Add irq support
Date: Fri, 26 Apr 2013 08:53:18 +0200
Message-ID: <CACRpkdY2hXEhWFAqFVUKCFtF0aJA3U4V1NOZhgMykyF1K0_yPg@mail.gmail.com>
References: <1366202211-6743-1-git-send-email-andreas@gaisler.com>
	<1366202211-6743-3-git-send-email-andreas@gaisler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1366202211-6743-3-git-send-email-andreas@gaisler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Larsson <andreas@gaisler.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, software@gaisler.com
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2013 at 2:36 PM, Andreas Larsson <andreas@gaisler.com> wrote:

> The drivers sets up an irq domain and hands out unique irqs to irq
> capable gpio lines regardless of how underlying irq maps to gpio
> lines. Any gpio line can map to any one or none of the irqs of the
> core, independently of each other.
>
> Signed-off-by: Andreas Larsson <andreas@gaisler.com>

Patch applied, looking good, thanks!

Yours,
Linus Walleij
