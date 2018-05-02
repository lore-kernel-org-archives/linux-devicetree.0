From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v8 12/12] ARM: shmobile: Convert file to use cntvoff
Date: Wed, 2 May 2018 08:36:39 +0200
Message-ID: <20180502063639.qa7bzqxzrejd4kh2@verge.net.au>
References: <20180501123131.7738-1-mylene.josserand@bootlin.com>
 <20180501123131.7738-13-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180501123131.7738-13-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>
Cc: linux@armlinux.org.uk, maxime.ripard@bootlin.com, wens@csie.org, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, geert@linux-m68k.org, magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, clabbe.montjoie@gmail.com, quentin.schulz@bootlin.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 01, 2018 at 02:31:31PM +0200, Mylène Josserand wrote:
> Now that a common function is available for CNTVOFF's
> initialization, let's convert shmobile-apmu code to use
> this function.
> 
> Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Simon Horman <horms+renesas@verge.net.au>
