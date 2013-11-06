From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 01/13] dma: ste_dma40: Expand DT binding to accept
 'high-priority channel' flag
Date: Wed, 6 Nov 2013 12:11:46 +0000
Message-ID: <20131106121146.GI30901@lee--X1>
References: <1383732985-18928-1-git-send-email-lee.jones@linaro.org>
 <1383732985-18928-2-git-send-email-lee.jones@linaro.org>
 <CACRpkdaVPy8yuhYKohL7ewnmT5y7QrQ7ig2qf4t49YZ-+noDvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaVPy8yuhYKohL7ewnmT5y7QrQ7ig2qf4t49YZ-+noDvQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>
List-Id: devicetree@vger.kernel.org

On Wed, 06 Nov 2013, Linus Walleij wrote:

> On Wed, Nov 6, 2013 at 11:16 AM, Lee Jones <lee.jones@linaro.org> wro=
te:
>=20
> > --- a/Documentation/devicetree/bindings/dma/ste-dma40.txt
> > +++ b/Documentation/devicetree/bindings/dma/ste-dma40.txt
> > @@ -50,6 +50,9 @@ Each dmas request consists of 4 cells:
> >          0x00000008: Use fixed channel:
> >                  Use automatic channel selection when unset
> >                  Use DMA request line number when set
> > +        0x00000010: Set channel as high priority:
> > +                Normal priority when unset
> > +                High priority when set
>=20
> We should probably switch these magic numbers to #defines
> but it's another subject so
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Happy to do that in a subsequent set.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
