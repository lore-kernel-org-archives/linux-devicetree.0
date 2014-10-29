From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH V3 2/4] of: Add binding document for MIPS GIC
Date: Wed, 29 Oct 2014 09:21:53 +0000
Message-ID: <5450B1B1.5070301@imgtec.com>
References: <1414541562-10076-1-git-send-email-abrestic@chromium.org> <1414541562-10076-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414541562-10076-3-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, Qais Yousef <qais.yousef@imgtec.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 29/10/14 00:12, Andrew Bresticker wrote:
>  - changed compatible string to include CPU version

> +Required properties:
> +- compatible : Should be "mti,<cpu>-gic".  Supported variants:
> +  - "mti,interaptiv-gic"

> +Required properties for timer sub-node:
> +- compatible : Should be "mti,<cpu>-gic-timer".  Supported variants:
> +  - "mti,interaptiv-gic-timer"

Erm, I'm a bit confused...
Why do you include the core name in the compatible string?

You seem to be suggesting that:

1) The GIC/timer drivers need to know what core they're running on.

Is that really true?

2) It isn't possible to probe the core type.

But the kernel already knows this, so what's wrong with using
current_cpu_type() like everything else that needs to know?

3) Every new core should require a new compatible string to be added
before the GIC will work. You don't even have a generic compatible
string that DT can specify after the core specific one as a fallback.

Please lets not do this unless it's actually necessary (which AFAICT it
really isn't).

Thanks
James
