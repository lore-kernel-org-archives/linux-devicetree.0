From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 11/11] devtree: add binding documentation for sp804
Date: Thu, 21 Mar 2013 19:36:35 +0000
Message-ID: <20130321193635.GT4977@n2100.arm.linux.org.uk>
References: <1363820051-24428-1-git-send-email-robherring2@gmail.com>
 <1363820051-24428-12-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1363820051-24428-12-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, pawel.moll@arm.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, john.stultz@linaro.org, haojian.zhuang@linaro.org, tglx@linutronix.de, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2013 at 05:54:11PM -0500, Rob Herring wrote:
> +Optional properties:
> +- arm,sp804-has-irq = <#>: In the case of only 1 timer irq line connected, this
> +	specifies if the irq connection is for timer 1 or timer 2. A value of 1
> +	or 2 should be used.

This fails to mention that it has any bearing on the clocks.
