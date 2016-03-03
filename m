From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] phy: rcar-gen3-usb2: add fallback binding
Date: Thu, 3 Mar 2016 09:13:06 +0100
Message-ID: <CAMuHMdW24p_nx19232LADRMHY8-976YX-S41zEGQhmoe+3_AxQ@mail.gmail.com>
References: <1456965518-13615-1-git-send-email-horms+renesas@verge.net.au>
	<1456965518-13615-3-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456965518-13615-3-git-send-email-horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 3, 2016 at 1:38 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
> In the case of Renesas R-Car hardware we know that there are generations of
> SoCs, e.g. Gen 2 and Gen 3. But beyond that its not clear what the
> relationship between IP blocks might be. For example, I believe that
> r8a7790 is older than r8a7791 but that doesn't imply that the latter is a
> descendant of the former or vice versa.
>
> We can, however, by examining the documentation and behaviour of the
> hardware at run-time observe that the current driver implementation appears
> to be compatible with the IP blocks on SoCs within a given generation.
>
> For the above reasons and convenience when enabling new SoCs a
> per-generation fallback compatibility string scheme being adopted for
> drivers for Renesas SoCs.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> v2
> * Use renesas,rcar-gen3-usb-phy rather than renesas,usb-phy-gen3 as

FWIW, "renesas,rcar-gen3-usb2-phy" ;-)

Gr{oetje,eeting}s,

                        Geert
