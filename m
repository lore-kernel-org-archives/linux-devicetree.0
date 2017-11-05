From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] kbuild: handle dtb-y and CONFIG_OF_ALL_DTBS natively
 in Makefile.lib
Date: Sun, 5 Nov 2017 14:49:51 +0100
Message-ID: <CAK8P3a17uK02gvY=iQhnGq7OooV4JzxLpAV5V5eES3bEutm6aA@mail.gmail.com>
References: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
 <1509859853-27473-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1509859853-27473-3-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 5, 2017 at 6:30 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> If CONFIG_OF_ALL_DTBS is enabled, "make ARCH=arm64 dtbs" compiles each
> DTB twice; one from arch/arm64/boot/dts/*/Makefile and the other from
> the dtb-$(CONFIG_OF_ALL_DTBS) line in arch/arm64/boot/dts/Makefile.
> It could be a race problem when building DTBS in parallel.
>
> Another minor issue is CONFIG_OF_ALL_DTBS covers only *.dts in vendor
> sub-directories, so this broke when Broadcom added one more hierarchy
> in arch/arm64/boot/dts/broadcom/<soc>/.
>
> One idea to fix the issues in a clean way is to move DTB handling
> to Kbuild core scripts.  Makefile.dtbinst already recognizes dtb-y
> natively, so it should not hurt to do so.
>
> Add $(dtb-y) to extra-y, and $(dtb-) as well if CONFIG_OF_ALL_DTBS is
> enabled.  All clutter things in Makefiles go away.
>
> As a bonus clean-up, I also removed dts-dirs.  Just use subdir-y
> directly to traverse sub-directories.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Nice, that's much better than the hack I had.

Acked-by: Arnd Bergmann <arnd@arndb.de>
