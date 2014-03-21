From: Alexander Holler <holler@ahsoftware.de>
Subject: Re: [PATCH v2] gpio: davinci: fix gpio selection for OF
Date: Fri, 21 Mar 2014 09:59:37 +0100
Message-ID: <532BFF79.6070906@ahsoftware.de>
References: <5316FFCE.1060603@ti.com>	<1394018461-757-1-git-send-email-holler@ahsoftware.de>	<CACRpkdaF=jc9Z1XZCtH8VPuih01t--qyV-sgH1R_ix0VM4RzVA@mail.gmail.com>	<5322D529.4070904@ahsoftware.de>	<CACRpkdaghneo1MvNCfxjTED+sJepHgeZCgmKsRteG9qrBNWAfQ@mail.gmail.com>	<5326F8C5.5090406@ti.com>	<CACRpkdYZMzw31NkA4uSq+ZowzOnZgZthXhZri-eJY2Ozb8aNRQ@mail.gmail.com>	<532805AE.9000806@ti.com>	<532815A8.9090807@ahsoftware.de> <CACRpkdZwhP-wMDeNTEq6ELPsYC48xmppzGYTRLSzUewbqhrMvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZwhP-wMDeNTEq6ELPsYC48xmppzGYTRLSzUewbqhrMvg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sekhar Nori <nsekhar@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am 21.03.2014 09:28, schrieb Linus Walleij:
> On Tue, Mar 18, 2014 at 10:45 AM, Alexander Holler <holler@ahsoftware.de> wrote:
>
>> But I don't need any rush here, I'm just unable to understand why the -rc
>> phase isn't used for bug fixing as I believe that's what this phase is for.
>
> Right now it is mostly a practical issue to me, as I applied the patch to
> the devel (for-next) branch, then committed new development on top of
> it.
>
> If I send it for fixes now the same patch will come in two ways as I
> really do not like to rebase my tree at this point.
>
> So I'd prefer to keep this for next and then have it tagged for stable as
> v3.14 is released, if that is OK?

Sure.

> It's as simple as sending a mail to Greg once it's upstream.

I already though about how to tag every patch I send as Cc: stable, 
because almost any fix I send either goes through some -next or even 
-next-next or already is for some stable kernel.
(I usually don't even look at -rc kernels, just for some special things 
I'm waiting for, like this of-gpio for davinci.)

Regards,

Alexander Holler
