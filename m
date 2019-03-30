From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2] devantech-srf04.yaml: transform DT binding to YAML
Date: Sat, 30 Mar 2019 16:12:00 +0000
Message-ID: <20190330161200.6d0dec48@archlinux>
References: <20190326133938.oitfjxlx2kou26lm@arbad>
        <CAL_JsqKV1Qy05oX9wm+Fz1HAkAEe4gE3whCNvafPfxsg6hgp8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKV1Qy05oX9wm+Fz1HAkAEe4gE3whCNvafPfxsg6hgp8A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Andreas Klinger <ak@it-klinger.de>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Mar 2019 08:13:17 -0500
Rob Herring <robh+dt@kernel.org> wrote:

> On Tue, Mar 26, 2019 at 8:40 AM Andreas Klinger <ak@it-klinger.de> wrote:
> >
> > devantech-srf04.yaml: yaml devicetree binding for iio ultrasonic
> > proximity driver of devantech srf04
> >
> > use devantech-srf04.txt, transform binding into yaml and remove the
> > outdated DT documentation
> >
> > Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> > ---
> >  .../bindings/iio/proximity/devantech-srf04.txt     | 28 ----------
> >  .../bindings/iio/proximity/devantech-srf04.yaml    | 59 ++++++++++++++++++++++
> >  2 files changed, 59 insertions(+), 28 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Given I've been feeling guilty for ages about never reviewing Rob's original work on
this (it sat in my todo list for a large number of months before I dropped it because
it had already merged), I'm very happy to see that it ends up being this simple!
I guess we have a lot of these change over patches to go ;)

Applied to the togreg branch of iio.git and pushed out as testing. Does anyone check
these yet?

Thanks,

Jonathan
