From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] ARM: vf610: use zero based naming for GPIO nodes
Date: Tue, 20 Jan 2015 16:42:49 +0800
Message-ID: <20150120084247.GZ2766@dragon>
References: <1421427975-16391-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1421427975-16391-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 16, 2015 at 06:06:15PM +0100, Stefan Agner wrote:
> On Vybrid, all peripherals are numbered starting with zero,
> including the GPIO and PORT module. However, the labels of the
> corresponding device tree nodes start with one, which is confusing.
> Fix that by renaming the labels of the gpio nodes in the device
> tree.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Yep, this makes sense since Vybrid Reference Manual is numbering GPIO
port from 0.

Applied, thanks.
