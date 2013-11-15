From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Fri, 15 Nov 2013 12:57:51 +0100
Message-ID: <CAMuHMdW4qTm5RbXAo1Vrp+TB0Rb4oxWVAU=78G3iFBSuVtcNyA@mail.gmail.com>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
	<5285EE5A.1070202@southpole.se>
	<CAMuHMdWA-9ax=NG_d0tyfzY3+42Ka7_r+jTeF-m5oW0eV8t1=g@mail.gmail.com>
	<5285FE1D.3020800@southpole.se>
	<CAKaYPCNqzYcSyTUjjb9H3naErjzqjLDBthE2xfQ98j-YOzQWwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <CAKaYPCNqzYcSyTUjjb9H3naErjzqjLDBthE2xfQ98j-YOzQWwg@mail.gmail.com>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Olof Kindgren <olof.kindgren@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kevin Mehall <contact@kevinmehall.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux <linux@lists.openrisc.net>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 15, 2013 at 12:39 PM, Olof Kindgren <olof.kindgren@gmail.com> wrote:
> More generally, can Linux use out-of-tree DTS files in an easy way? It's
> handy to have them in the kernel, but the best fit might actually be to put
> them in the corresponding orpsocv3 system directory. That would also make it
> easier to have separate device trees for differently configured FPGAs (they
> are reprogrammable after all).

If I'm not mistaken, this is ORPSoC v2?

Yes, it would be nice to have the DTS in ORPSoc itself.

Still, we would need overlays for the devices that are not defined in
ORPSoC, e.g. on-board (and off-board) devices on i2c and spi.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
