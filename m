From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [issue] Appended device trees does not work for ST-E
Date: Fri, 7 Oct 2011 09:02:44 +0200
Message-ID: <CACRpkdZ_nc5B7Sy9r58U1b9dPy5Ua0NxXRq7YYkZnJEk6df7bA@mail.gmail.com>
References: <CAPQUh1TeeJTXVB7=PQZS2XBi-iW=EvkP5bZ95J-fxiE5B-nOgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPQUh1TeeJTXVB7=PQZS2XBi-iW=EvkP5bZ95J-fxiE5B-nOgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mounir Bsaibes <mounir.bsaibes-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Deepak Saxena <deepak.saxena-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 6, 2011 at 6:35 PM, Mounir Bsaibes
<mounir.bsaibes-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> issue:
> "Appended device trees does not work for us. Still don't know why."

I have fixed it now, sorry for all the fuzz, appended device
trees *are* working for us, as of friday last week.

Short story: we're so stupid. (As usual.)

Long story, I *think* core problem was this:

In kernel 3.0 you could enable CONFIG_USE_OF
and PROC_DEVICETREE to get a dummy device tree in
/proc/device-tree, so you could enable it just to get the code
compiled in.

As of 3.1 rc:s if you enable CONFIG_USE_OF, the core
DT code will start looking for a compatible node, so you
need a .dt_compat entry in your MACHINE_START
structure, and it has to reference a matching compat node
in the device tree. Else it will print an error an hang.

Which is fully logical, if you enable device tree, you should
use it.

The problem was further complicated that the warning
about the missing compat node only appears in
early_printk() context since the console is not up at this
point, if you don't have that, the machine will hang without
any prints and you need to figure out what happens.

We enabled early printk:s but since early_printk() is
problematic with multi-machine configurations we didn't
see them.

So we were basically hit by the ambigous prossibility to
configure in earlyprints on machines with the UART in
different places, which has been discussed by Will Deacon
et al elsewhere.

Maybe we should document in Kconfig:s
CONFIG_USE_OF option that if you enable this
for ARM your machine it won't boot unless it finds a
compatible device tree, I don't know.

Yours,
Linus Walleij
