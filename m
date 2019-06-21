Return-Path: <SRS0=/5l8=UU=gmail.com=clabbe.montjoie@kernel.org>
Date: Fri, 21 Jun 2019 14:59:58 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH v2 10/29] docs: arm: convert docs to ReST and rename to
 *.rst
Message-ID: <20190621125958.GA4299@Red>
References: <cover.1560890800.git.mchehab+samsung@kernel.org>
 <7cd1fc25708bc50ee487ef1b301b2528ebe8bb02.1560890800.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cd1fc25708bc50ee487ef1b301b2528ebe8bb02.1560890800.git.mchehab+samsung@kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harry Wei <harryxiyou@gmail.com>, Alex Shi <alex.shi@linux.alibaba.com>, Russell King <linux@armlinux.org.uk>, Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jakub Kicinski <jakub.kicinski@netronome.com>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org, linux-crypto@vger.kernel.org, linux-input@vger.kernel.org, linux-serial@vger.kernel.org, netdev@vger.kernel.org, xdp-newbies@vger.kernel.org, bpf@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jun 18, 2019 at 05:53:28PM -0300, Mauro Carvalho Chehab wrote:
> Converts ARM the text files to ReST, preparing them to be an
> architecture book.
> 
> The conversion is actually:
>   - add blank lines and identation in order to identify paragraphs;
>   - fix tables markups;
>   - add some lists markups;
>   - mark literal blocks;
>   - adjust title markups.
> 
> At its new index.rst, let's add a :orphan: while this is not linked to
> the main index.rst file, in order to avoid build warnings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/arm/{sunxi/README => sunxi.rst} |  98 +++-
>  drivers/crypto/sunxi-ss/sun4i-ss-cipher.c     |   2 +-
>  drivers/crypto/sunxi-ss/sun4i-ss-core.c       |   2 +-
>  drivers/crypto/sunxi-ss/sun4i-ss-hash.c       |   2 +-
>  drivers/crypto/sunxi-ss/sun4i-ss.h            |   2 +-

For sun4i-s::
Reviewed-by Corentin Labbe <clabbe.montjoie@gmail.com>
