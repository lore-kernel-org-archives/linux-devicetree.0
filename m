From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: henninger: rename board to Porter
Date: Thu, 29 Jan 2015 09:30:57 +0900
Message-ID: <20150129003057.GB18731@verge.net.au>
References: <2481726.lh33apx2TG@wasted.cogentembedded.com>
 <CAMuHMdW3NmzGxGa9DOHpk4Evjg=+bduUPiMoRZT9Ko7+jNp-Nw@mail.gmail.com>
 <54C8E718.7060504@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <54C8E718.7060504@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Linux-sh list <linux-sh@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 28, 2015 at 04:41:44PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 1/25/2015 10:30 PM, Geert Uytterhoeven wrote:
> 
> >>Renesas has made some changes to the Henninger low cost board hardware and at
> >>the same time decided to  rename the board  to Porter.
> 
> >Which changes?
> 
>   I don't have a list ready, sorry. One thing I know is that HDMI chip is
> different (the same as on Koelsch now); we don't support it yet...

This sounds more like a new board than an update. I don't have any strong
opinions about this at this time but perhaps it would make more sense to
handle this as two steps: adding a new board and removing an old one.

> >They're not reflected in the new DTS?
> 
>    Not yet.
> 
> >>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> >>---
> >>This patch is against 'renesas-devel-20150123-v3.19-rc5' tag of Simon Horman's
> >>'renesas.git' repo.
> >>
> >>  arch/arm/boot/dts/Makefile                                     |  2 +-
> >>  .../arm/boot/dts/{r8a7791-henninger.dts => r8a7791-porter.dts} | 10 +++++-----
> >>  2 files changed, 6 insertions(+), 6 deletions(-)
> >>  rename arch/arm/boot/dts/{r8a7791-henninger.dts => r8a7791-porter.dts} (96%)
> 
> >You forgot to update Documentation/devicetree/bindings/arm/shmobile.txt
> 
>    No wonder -- I had no idea it is listed there...
> 
> >Gr{oetje,eeting}s,
> 
> >                         Geert
> 
> WBR, Sergei
> 
