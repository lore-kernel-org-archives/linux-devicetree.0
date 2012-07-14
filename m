From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] OMAP: Define TCA6424 max number of possible IRQs
Date: Sat, 14 Jul 2012 22:44:59 +0200
Message-ID: <CACRpkdaPCf7eo5V3pHvVE=JFuZp=otXjvQ1US1bHXQ7D1QbDeQ@mail.gmail.com>
References: <cover.1341925681.git.cmahapatra@ti.com>
 <f77496c24aa05320ad8cdc81759dd16d7bbb9d65.1341925681.git.cmahapatra@ti.com>
 <CACRpkdYZRzK4jTiQxra46KgSt8x1Vrq4GCFWyc62e303HVoZ+w@mail.gmail.com>
 <CAF0AtAs8euY79y-JmD8Bk4oX-8+gwPKsr_JJin+853EesrUTcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAF0AtAs8euY79y-JmD8Bk4oX-8+gwPKsr_JJin+853EesrUTcg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: "Mahapatra, Chandrabhanu" <cmahapatra-l0cyMroinI0@public.gmane.org>
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, leed.aguilar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 12, 2012 at 3:00 PM, Mahapatra, Chandrabhanu
<cmahapatra-l0cyMroinI0@public.gmane.org> wrote:

> OK, but if your taking this patch through GPIO tree the better if the 4th
> patch is taken through it. TCA6424 fails if both the patches are not
> present.

If the situation is such they should be squashed into one since the
point after the first before the second patch is not bisectable.

Yours,
Linus Walleij
