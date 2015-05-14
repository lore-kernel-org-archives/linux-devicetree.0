From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v3] imx27: dt: only map 4 Kbyte for fec registers
Date: Thu, 14 May 2015 11:09:50 +0800
Message-ID: <20150514030948.GA6850@dragon>
References: <1431469106-27666-1-git-send-email-tremyfr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431469106-27666-1-git-send-email-tremyfr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Reynes <tremyfr@gmail.com>
Cc: kernel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 13, 2015 at 12:18:26AM +0200, Philippe Reynes wrote:
> According to the imx27 documentation, fec has a 4 Kbyte
> memory space map. Moreover, the actual 16 Kbyte mapping
> overlaps the SCC (Security Controller) memory register
> space. So, we reduce the memory register space to 4 Kbyte.
> 
> Signed-off-by: Philippe Reynes <tremyfr@gmail.com>

Updated the patch prefix as "ARM: dts: imx27: ", and applied.  Thanks.

Shawn
