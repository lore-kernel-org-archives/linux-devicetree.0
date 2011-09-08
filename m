From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Appended devicetree with Torvalds' HEAD
Date: Thu, 8 Sep 2011 23:46:12 +0200
Message-ID: <CACRpkda873dUi-nVmY8YkAnfJ1=nz4Ecdk8GZpempfs0ACLVew@mail.gmail.com>
References: <CACRpkdb1iD2RkpmMkN1d5VNVr-M3KgrkE7Xg-Bxcr-xd2fcuPw@mail.gmail.com>
	<alpine.LFD.2.00.1109061347410.20358@xanadu.home>
	<CACRpkdZFT6+FNxupNT0xZN4ZvEx1rNF3=xiSo-0H4hOZwj4Ygg@mail.gmail.com>
	<CACRpkdZDxwkr4ybf6jWAAMpKd3MWfdi-p6uWR2tBx=h_=vkd1w@mail.gmail.com>
	<alpine.LFD.2.00.1109080927010.20358@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1109080927010.20358-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
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

On Thu, Sep 8, 2011 at 6:35 PM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wr=
ote:
> On Thu, 8 Sep 2011, Linus Walleij wrote:
>>
>> Is there a particular reason why we want to append the
>> device tree to the zImage rather than to vmlinux?
>
> So this ability to simply append the DTB to a zImage is just a
> convenience to accommodate legacy bootloaders. =A0It should _not_ become
> the primary way of providing a DTB to the kernel.

I understand this, however this one legacy bootloader for U300
does not support compressed images, just plain vmlinux.

I intended to use it for some cross-testing of the append patches
since they wouldn't work for me on other hardware.

I'll just drop that attempt, no big deal.

Thanks,
Linus Walleij
