From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 1/2] of: Add vendor prefix for QiaoDian Xianshi
Date: Thu, 1 Oct 2015 00:54:28 +0200
Message-ID: <20150930225428.GH3639@piout.net>
References: <1443649337-32307-1-git-send-email-alexandre.belloni@free-electrons.com>
 <CAL_JsqKXKDOf3JKDvhOS=sEEQ2buwzEWV6F-1iW+jV369aOUAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKXKDOf3JKDvhOS=sEEQ2buwzEWV6F-1iW+jV369aOUAg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 30/09/2015 at 17:16:10 -0500, Rob Herring wrote :
> On Wed, Sep 30, 2015 at 4:42 PM, Alexandre Belloni
> <alexandre.belloni@free-electrons.com> wrote:
> > Use "qiaodian" as the vendor prefix for QiaoDian Xianshi Corporation in
> > device tree compatible strings.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index ac5f0c34ae00..76579e2ef162 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -174,6 +174,7 @@ qca Qualcomm Atheros, Inc.
> >  qcom   Qualcomm Technologies, Inc
> >  qemu   QEMU, a generic and open source machine emulator and virtualizer
> >  qi     Qi Hardware
> > +qd     QiaoDian XianShi Corporation
> 
> Doesn't match the commit msg...
> 

Yeah, I was not sure which one I should use actually, is "qd"
sufficient? I couldn't find much information on the company, I chose to
use the prefix they use for their parts.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
