From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 0/2] pinctrl: Support for IMG Pistachio
Date: Wed, 1 Apr 2015 12:03:26 +0200
Message-ID: <20150401100326.GA20157@linux-mips.org>
References: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
 <CACRpkdbCOHNPs5Y58h--X6pOVvYyxTrgcFhFyk5dWE+JLo=rhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbCOHNPs5Y58h--X6pOVvYyxTrgcFhFyk5dWE+JLo=rhg@mail.gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 06, 2015 at 12:29:55PM +0100, Linus Walleij wrote:
> Date:   Fri, 6 Mar 2015 12:29:55 +0100
> From: Linus Walleij <linus.walleij@linaro.org>
> To: Andrew Bresticker <abrestic@chromium.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle
>  <ralf@linux-mips.org>, "devicetree@vger.kernel.org"
>  <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org"
>  <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>,
>  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel
>  Garcia <ezequiel.garcia@imgtec.com>, James Hartley
>  <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
> Subject: Re: [PATCH 0/2] pinctrl: Support for IMG Pistachio
> Content-Type: text/plain; charset=UTF-8
> 
> On Tue, Feb 24, 2015 at 3:15 AM, Andrew Bresticker
> <abrestic@chromium.org> wrote:
> 
> >  I'd like this to go through the MIPS tree with
> > Linus'/Alex's ACKs if possible.
> 
> Why? It will only help creating merge conflicts.
> There seem to be no compile-related dependencies, just Kconfig
> symbols, so patches using this can go in orthogonally.

It would mean all the bits for Pistachio support go through a single tree
which simplifies testing and possibly fixing significantly.  The
conflict potencial for this series is fairly low, I think.

  Ralf
