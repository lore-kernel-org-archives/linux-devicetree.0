From: Qais Yousef <qais.yousef@imgtec.com>
Subject: Re: [PATCH V3 2/4] of: Add binding document for MIPS GIC
Date: Wed, 29 Oct 2014 11:09:45 +0000
Message-ID: <5450CAF9.3040902@imgtec.com>
References: <1414541562-10076-1-git-send-email-abrestic@chromium.org> <1414541562-10076-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414541562-10076-3-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/29/2014 12:12 AM, Andrew Bresticker wrote:
> +- reg : Base address and length of the GIC registers.
>

Also except for sead3, the base address should be properly reported by 
the hardware. The size is fixed (for a specific version of GIC at least 
- which is also reported by the hardware). So it would be nice to make 
this optional.

Qais
