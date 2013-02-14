From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] pinctrl: pinctrl-single: fix the binding documentation
Date: Thu, 14 Feb 2013 09:41:48 -0800
Message-ID: <20130214174147.GD7144@atomide.com>
References: <1360550763-5404-1-git-send-email-anilkumar.v@ti.com>
 <CACRpkdYGQ3S8-Zfmm8gSU4-R1pr7AZgadRJqSa2diigt4WWpjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYGQ3S8-Zfmm8gSU4-R1pr7AZgadRJqSa2diigt4WWpjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, "Kumar,
 Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [130212 04:16]:
> On Mon, Feb 11, 2013 at 3:46 AM, Kumar, Anil <anilkumar.v-l0cyMroinI0@public.gmane.org> wrote:
> 
> > As there are no use of #address-cells and #size-cells properties
> > in pinctrl-single driver DT node. Fix pinctrl-single binding documentation
> > to remove these properties.
> >
> > Signed-off-by: Kumar, Anil <anilkumar.v-l0cyMroinI0@public.gmane.org>
> > ---
> > Tested on da850 EVM.
> 
> I need Tony Lindgrens ACK on this before I apply it.

No thanks, this driver is supposed to be generic and I would
not be surprised if it eventually will be used on some 64-bit
system. See "5) Required nodes and properties" in file
Documentation/devicetree/booting-without-of.txt.

Regards,

Tony
