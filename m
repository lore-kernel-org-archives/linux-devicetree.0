From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Fri, 15 Nov 2013 11:47:12 +0100
Message-ID: <CAMuHMdV=u04Y2saVygB=FSPTDgqSf+0YNUb0q3=aVZ9oTORs+Q@mail.gmail.com>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
	<5285EE5A.1070202@southpole.se>
	<CAMuHMdWA-9ax=NG_d0tyfzY3+42Ka7_r+jTeF-m5oW0eV8t1=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <CAMuHMdWA-9ax=NG_d0tyfzY3+42Ka7_r+jTeF-m5oW0eV8t1=g@mail.gmail.com>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Jonas Bonn <jonas@southpole.se>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Mehall <contact@kevinmehall.net>, linux@lists.openrisc.net
List-Id: devicetree@vger.kernel.org

On Fri, Nov 15, 2013 at 11:22 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> The supplied schematics filename is de0-nano-c4-rev-c\(release_cd_rom\).pdf,
> and the drawings mention "Rev C".
> The block diagram on page 2 still says "EPCS16 (16 Mb), but on page 8 it
> mentions "EPCS64", which is what's on my board.

I found the Rev B schematics on the web. It lacks the EPCS drawing
on page 8.

According to
http://forums.parallax.com/showthread.php/132578-Getting-started-with-FPGAs/page7
there are also versions with a 64 Mbit Altera EPCS64.

So my guess is:
  Rev A: EPCS16
  Rev B: Altera EPCS64
  Rev C: Spansian EPCS64

Unless Andrew and I have Rev Fs, as there's no "C" on our boards.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
