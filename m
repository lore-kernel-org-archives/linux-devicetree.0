From: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Sun, 10 Nov 2013 07:51:46 +0200
Message-ID: <20131110055145.GA7947@chokladfabriken.org>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
Content-Disposition: inline
In-Reply-To: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, Kevin Mehall <contact@kevinmehall.net>, linux-kernel@vger.kernel.org, linux@lists.openrisc.net
List-Id: devicetree@vger.kernel.org

On Sat, Nov 09, 2013 at 09:37:31PM +0100, Geert Uytterhoeven wrote:
> Add a DTS and defconfig for the Terasic DE0-Nano Development and Education
> Board running ORPSoC.  This board contains an Altera Cyclone IV FPGA with
> support chips and I/O.
> 
> The DTS was derived from published versions by Kevin Mehall and Marek
> Czerski.

To give credit where credit is due, this was created by:
Gong Tao <gongtao0607@gmail.com>

> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Kevin Mehall <contact@kevinmehall.net>
> Cc: Marek Czerski <ma.czerski@gmail.com>
> ---
> Notable changes:
>   - Change flash0 to spansion,s25sl064p, due to kernel message
>     m25p80 spi32766.0: found s25sl064p, expected m25p10

This is due to Altera changing the EPCS chip on newer revisions
of that board, older versions are "relabeled" m25p10 and
newer once s25sl064p.
The change is fine though, you have to pick one.

Stefan
