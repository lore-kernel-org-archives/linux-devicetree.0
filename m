From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V1 1/3] GPIO: PCA953X: Increase size of invert variable to
 support 24 bit
Date: Sun, 5 Aug 2012 01:38:16 +0200
Message-ID: <CACRpkdZaxoAm-gDUFMbSaumozoWH2m7vcfsc7zD4Uzt9cdabEA@mail.gmail.com>
References: <cover.1341925681.git.cmahapatra@ti.com>
 <cover.1343026861.git.cmahapatra@ti.com>
 <a7d63a5023b354c3f0ac8b1aa181b57f03db199c.1343026861.git.cmahapatra@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <a7d63a5023b354c3f0ac8b1aa181b57f03db199c.1343026861.git.cmahapatra-l0cyMroinI0@public.gmane.org>
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
To: Chandrabhanu Mahapatra <cmahapatra-l0cyMroinI0@public.gmane.org>
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, leed.aguilar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 28, 2012 at 8:07 AM, Chandrabhanu Mahapatra
<cmahapatra-l0cyMroinI0@public.gmane.org> wrote:

> TCA6424 is a low voltage 24 bit I2C and SMBus I/O expander of pca953x family
> similar to its 16 bit predecessor TCA6416. It comes with three 8-bit active
> Input, Output, Polarity Inversion and Configuration registers each. The polarity
> of Input ports can be reversed by setting the appropiate bit in Polarity
> Inversion registers.
>
> The variables corresponding to Input, Output and Configuration registers have
> already been updated to support 24 bit values. This patch thus updates the
> invert variable of PCA953X platform data to support 24 bit.
>
> Signed-off-by: Chandrabhanu Mahapatra <cmahapatra-l0cyMroinI0@public.gmane.org>

Why did you re-send this?

The patch is already in the upstream kernel. Please rebase your tree to v3.6-rc1
or so.

Yours,
Linus Walleij
