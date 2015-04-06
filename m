From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH repost] ARM: shmobile: r8a7790: Remove MSIOF address from
 device tree
Date: Mon, 6 Apr 2015 09:24:16 +0900
Message-ID: <20150406002411.GC1841@verge.net.au>
References: <1428166471-2897-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdW40S4rU-wkrJDHDw_ThFdChEa+HEyXYHJ3AAH1TwUiVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW40S4rU-wkrJDHDw_ThFdChEa+HEyXYHJ3AAH1TwUiVw@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 05, 2015 at 10:46:33AM +0200, Geert Uytterhoeven wrote:
> On Sat, Apr 4, 2015 at 6:54 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> >
> > MSIOF Base Address H'E6xx can be accessed by CPU and DMAC.
> > MSIOF Base Address H'E7xx for DMAC was removed from H/W manual.
> >
> > Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up for v4.2.
