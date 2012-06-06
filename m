From: Christian Glindkamp <christian.glindkamp@taskit.de>
Subject: Re: [PATCH 1/4] ARM: at91: at91 based machines specify their own irq
 handler at run time
Date: Wed, 6 Jun 2012 11:47:48 +0200
Message-ID: <20120606094748.GA26504@taskit.de>
References: <1338907664-24646-1-git-send-email-ludovic.desroches@atmel.com>
 <1338907664-24646-2-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1338907664-24646-2-git-send-email-ludovic.desroches@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ludovic.desroches@atmel.com
Cc: will.deacon@arm.com, devicetree-discuss@lists.ozlabs.org, nicolas.ferre@atmel.com, grant.likely@secretlab.ca, tglx@linutronix.de, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2012-06-05 16:47, ludovic.desroches@atmel.com wrote:
> From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> SOC_AT91SAM9 selects MULTI_IRQ_HANDLER in order to let machines specify their
> own IRQ handler at run time.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  arch/arm/mach-at91/board-cpu9krea.c           |    1 +
>  arch/arm/mach-at91/board-sam9g20ek.c          |    1 +
>  arch/arm/mach-at91/board-sam9261ek.c          |    1 +
>  arch/arm/mach-at91/board-stamp9g20.c          |    1 +
>  arch/arm/mach-at91/board-usb-a926x.c          |    1 +

At least these board files contain more than one MACHINE_START, but
you only update the last one. Same for the third patch.

I have not looked at the rest of the patch.
