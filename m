From: Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH 2/7] ARM: meson: serial: add MesonX SoC on-chip uart
 driver
Date: Thu, 28 Aug 2014 09:51:15 +0200
Message-ID: <20140828075115.GA2601@carlo-MacBookPro>
References: <1408272594-10814-1-git-send-email-carlo@caione.org>
 <1408272594-10814-3-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-serial-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1408272594-10814-3-git-send-email-carlo@caione.org>
Sender: linux-serial-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux@arm.linux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, jslaby@suse.cz, grant.likely@linaro.org, b.galvani@gmail.com, maxime.ripard@free-electrons.com
List-Id: devicetree@vger.kernel.org

On Sun, Aug 17, 2014 at 12:49:49PM +0200, Carlo Caione wrote:
> The SoC has four fully functional UARTs which use the same programming
> model. They are named UART_A, UART_B, UART_C and UART_AO (Always-On)
> which cannot be powered off.
> 
> Signed-off-by: Carlo Caione <carlo@caione.org>
> ---

<cut>

Hi,
Any feedback on this patch before submitting v2?

Thanks,

-- 
Carlo Caione
