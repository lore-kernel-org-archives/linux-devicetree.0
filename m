From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 2/3] clk: bcm281xx: add initial clock framework support
Date: Sat, 14 Dec 2013 15:57:31 -0800
Message-ID: <20131214235731.26321.53050@quantum>
References: <529F4B0F.2020801@linaro.org> <529F4B4F.4020405@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <529F4B4F.4020405@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Alex Elder <alex.elder@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>
Cc: "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Alex Elder (2013-12-04 07:33:35)
> +       return true;
> +}
> +
> +/* A bit position must be less than the number of bits in a 32-bit
> register. */

Hi Alex,

The patch is corrupt at line 634 and several other places below.  Did
you edit it manually? I'm happy with the series after reviewing it but
it cannot be applied. Can you fix the issue and send me a pull request?

Thanks,
Mike
