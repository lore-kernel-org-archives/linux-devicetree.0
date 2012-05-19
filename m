From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2 5/5] MIPS: Octeon: Use device tree to register serial ports.
Date: Sat, 19 May 2012 00:08:27 -0600
Message-ID: <20120519060827.0E8F53E046E@localhost>
References: <1335489630-27017-1-git-send-email-ddaney.cavm@gmail.com> <1335489630-27017-6-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1335489630-27017-6-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On Thu, 26 Apr 2012 18:20:30 -0700, David Daney <ddaney.cavm@gmail.com> wrote:
> From: David Daney <david.daney@cavium.com>
> 
> Switch to using the device tree to register serial ports.
> 
> Add all the ports with compatible = "cavium,octeon-3860-uart".  Octeon serial
> ports have their own device type, required port flags, and I/O
> functions, so using of_serial.c is not indicated.
> 
> We need to do this as late_initcall, as the 8250 driver must be
> initialized before we add any ports.  8250 initialization is done at
> device_initcall time.
> 
> The OCTEON_IRQ_UART{0,1,2} symbols are removed as they are now unused
> and interfere with irq_domain used by the device tree code.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>

Acked-by: Grant Likely <grant.likely@secretlab.ca>
