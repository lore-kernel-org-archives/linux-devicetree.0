From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V1 3/3] OMAP: Define TCA6424 max number of possible IRQs
Date: Sun, 29 Jul 2012 17:49:29 +0200
Message-ID: <CACRpkdaV+ZSwydNdCh6i_psryXGRcv=8sOaynvACbMGdp03Tjg@mail.gmail.com>
References: <cover.1341925681.git.cmahapatra@ti.com>
 <cover.1343026861.git.cmahapatra@ti.com>
 <03736c1b42a7e28fc0b47aabd5c0f019edb1baf2.1343026861.git.cmahapatra@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <03736c1b42a7e28fc0b47aabd5c0f019edb1baf2.1343026861.git.cmahapatra-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Chandrabhanu Mahapatra <cmahapatra-l0cyMroinI0@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 28, 2012 at 8:10 AM, Chandrabhanu Mahapatra
<cmahapatra-l0cyMroinI0@public.gmane.org> wrote:

> From: Leed Aguilar <leed.aguilar-l0cyMroinI0@public.gmane.org>
>
> TCA6424 being a 24 bit I2C and SMBus I/O expander has 24 available GPIO lines
> that can be used as IRQs lines. So, the support for 24 more IRQ lines has been
> added to the kernel.
>
> Signed-off-by: Leed Aguilar <leed.aguilar-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Chandrabhanu Mahapatra <cmahapatra-l0cyMroinI0@public.gmane.org>

Tony, this seems to touch only OMAP code, can you judge on it
and take it into your tree of desired?

Alternatively I can merge it to GPIO but then I need your ACK.

Yours,
Linus Walleij
