From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Appended devicetree with Torvalds' HEAD
Date: Thu, 8 Sep 2011 11:52:56 +0200
Message-ID: <CACRpkdZDxwkr4ybf6jWAAMpKd3MWfdi-p6uWR2tBx=h_=vkd1w@mail.gmail.com>
References: <CACRpkdb1iD2RkpmMkN1d5VNVr-M3KgrkE7Xg-Bxcr-xd2fcuPw@mail.gmail.com>
	<alpine.LFD.2.00.1109061347410.20358@xanadu.home>
	<CACRpkdZFT6+FNxupNT0xZN4ZvEx1rNF3=xiSo-0H4hOZwj4Ygg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdZFT6+FNxupNT0xZN4ZvEx1rNF3=xiSo-0H4hOZwj4Ygg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 6, 2011 at 9:24 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Sep 6, 2011 at 7:52 PM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>> They sure do, (or so I hope).
>> My latest patchset is here:
>
> OK I have cloned your git and already made some minor adjustments,
> will return with more details when/if I get this going.

Hm it doesn't boot, if I configure out the DT support it
works fine. (On v3.1-rc4 and ux500) How typical :-/

I tried to regression-test it on a legacy system but then
I ran into a problem that may be serious: that platform does
not use a compressed zImage, it users the plain vmlinux
converted to binary with objcopy.

Is there a particular reason why we want to append the
device tree to the zImage rather than to vmlinux?

Yours,
Linus Walleij
