From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 11/20] dm: serial: Update binding for PL01x
	serial UART
Date: Mon, 19 Oct 2015 09:19:44 +0200
Message-ID: <CACRpkdYnKxP8r_vDqp+JbyoV7+CwWcALeaHZ7JuUPYmJfazv8w@mail.gmail.com>
References: <1436324032-17931-1-git-send-email-sjg@chromium.org>
 <1510062.S45KkZCs96@wuerfel>
 <CACRpkdakAVcBT8phhbFjE+mkfA0pTcHYiaL0dV4UNieH54fd+w@mail.gmail.com>
 <4255169.hST9sycFU2@wuerfel>
 <CAMuHMdWPEiwba-6wsSBN+9dyMcUVj1ECJF0g4u0DJ8jE0pw6aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAMuHMdWPEiwba-6wsSBN+9dyMcUVj1ECJF0g4u0DJ8jE0pw6aQ@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Joe Hershberger <joe.hershberger@ni.com>, Masahiro Yamada <yamada.m@jp.panasonic.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 16, 2015 at 9:41 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

>> Ah right. I don't think that naming is super critical though, as a lot
>> of properties in the DT just describe how things are at boot time.
>
> Hence those don't describe the hardware...
> Shouldn't they be in /chosen instead?

/chosen is used for system-wide things mostly, as alias.

I think this can go in the hardware node.

Simon can you please make a patch to
Documentation/devicetree/bindings/serial/pl011.txt in the kernel
and post to devicetree@vger.kernel.org *and*
linux-doc@vger.kernel.org and Jonathan Corbet <corbet@lwn.net>
so he can merge it if we get some ACKs on it.

Yours,
Linus Walleij
