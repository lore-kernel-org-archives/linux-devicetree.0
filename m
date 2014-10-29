From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 0/4] MIPS: GIC device-tree support
Date: Wed, 29 Oct 2014 09:09:51 +0100
Message-ID: <15750371.2vAOfonLTV@wuerfel>
References: <1414541562-10076-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414541562-10076-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, Qais Yousef <qais.yousef@imgtec.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 October 2014 17:12:38 Andrew Bresticker wrote:
> This series add support for mapping and routing GIC interrupts as well
> as setting up the GIC timer through device-tree.  Patches 1 adds the
> "mti" vendor prefix, patch 2 adds the GIC binding document, and patches
> 3 and 4 add device-tree support for the GIC irqchip and clocksource drivers,
> respectively.
> 
> Based on next-20141028, which includes part 1 [0] and part 2 [1] of my
> GIC cleanup series.
> 

Looks all good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>
