From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 0/8] mfd: Add OF device table to I2C drivers that are
 missing it
Date: Thu, 4 May 2017 12:50:16 +0100
Message-ID: <20170504115016.ayrgbqdshdvnop6k@dell>
References: <20170504052107.18995-1-javier@dowhile0.org>
 <20170504080931.GA1487@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170504080931.GA1487@katana>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Javier Martinez Canillas <javier@dowhile0.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: devicetree@vger.kernel.org

On Thu, 04 May 2017, Wolfram Sang wrote:
> thanks for the series.
> 
> > Most patches can be applied independently, with the exception of patches
> > 2 to 4 that should be applied in the same tree to keep bisect-ability. I
> > suggest these to go through the MFD subsystem tree.
> 
> From my POV, patches 2-5 should be applied to the same tree. Since all
> I2C related patches have my tag, I assume they will be picked up by MFD.
> Lee, let me know if you prefer differently.

I can pick them up, no problem.  Can the ARM patches be taking
independently?  I'm guessing they can since they are separate from one
another.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
