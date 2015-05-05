From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 1/6] ARM: l2c: Add DT support for Shared Override
Date: Tue, 5 May 2015 16:51:14 +0100
Message-ID: <20150505155113.GI22384@e104818-lin.cambridge.arm.com>
References: <1430753072-17145-1-git-send-email-geert+renesas@glider.be>
 <1430753072-17145-2-git-send-email-geert+renesas@glider.be>
 <20150505112145.GG22384@e104818-lin.cambridge.arm.com>
 <CAMuHMdWE3HjGk73gCN3P-bBVEGrMbgfJ=FqvcTtGecs15R=A_g@mail.gmail.com>
 <20150505142211.GH22384@e104818-lin.cambridge.arm.com>
 <CAMuHMdXpStgQpq6A7GDc2iXNgmBNWjP82E5TykzTUS=6hrWVRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXpStgQpq6A7GDc2iXNgmBNWjP82E5TykzTUS=6hrWVRw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, Linux-sh list <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Pawel Moll <pawel.moll@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tushar Behera <tushar.behera@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 05, 2015 at 04:55:02PM +0200, Geert Uytterhoeven wrote:
> On Tue, May 5, 2015 at 4:22 PM, Catalin Marinas <catalin.marinas@arm.com> wrote:
> > BTW, your patch mentions r2p0. My reading of the PL310 TRM shows this
> > bit as default from r0p0.
> 
> Arnd told me he had read the documentation for r0p0 and couldn't find it.
> The r3p2 manual lists the following changes between r1p0-r2p0:
>   - new behavior linked to the Shared attribute.

Bit 22 is present since r0p0 with the same description as in r2p0 and
later:

http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0246a/Ceggcfcj.html

I guess the new behaviour is about bit 13, Shared Attribute Invalidate
Enable:

http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0246c/Ceggcfcj.html

But that's outside the scope of this patch.

-- 
Catalin
