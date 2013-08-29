From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/3] ARM: bcm281xx: Add GPIO driver
Date: Thu, 29 Aug 2013 20:39:31 +0200
Message-ID: <CACRpkdYA82K7dOOi666mjapV81gcnQuo85jneyhLvct_XeP=yQ@mail.gmail.com>
References: <1377728173-30711-1-git-send-email-markus.mayer@linaro.org>
 <1377728173-30711-2-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1377728173-30711-2-git-send-email-markus.mayer@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Christian Daudt <csd@broadcom.com>, Tim Kryger <tim.kryger@linaro.org>, Markus Mayer <mmayer@broadcom.com>, Matt Porter <matt.porter@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2013 at 12:16 AM, Markus Mayer <markus.mayer@linaro.org> wrote:

> From: Markus Mayer <mmayer@broadcom.com>
>
> This patch adds the GPIO driver for the bcm281xx family of chips.

Be more elaborate. What is this? Where is it used, how many
lines does it support?

Plus the Subject: should be gpio: kona: add the kona driver
or something, not ARM: ... as it's hitting the GPIO
subsystem.

Yours,
Linus Walleij
