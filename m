From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] watchdog: davinci: rename platform driver to davinci-wdt
Date: Wed, 27 Nov 2013 19:30:46 +0530
Message-ID: <5295FB0E.4070406@ti.com>
References: <1385559113-4354-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385559113-4354-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, wim@iguana.be, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Pawel.Moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, grant.likely@linaro.org, grygorii.strashko@ti.com
List-Id: devicetree@vger.kernel.org

On Wednesday 27 November 2013 07:01 PM, Ivan Khoronzhuk wrote:
> As we switch to use the watchdog core which permits more than one
> active watchdog in the system, rename platform driver to
> "davinci-wdt" to be identifiable.
> 
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>

Looks good to me. Since bulk of this patch touches mach-davinci, I would
like to take this through my tree to avoid conflicts with other
mach-davinci patches I accept.

Thanks,
Sekhar
