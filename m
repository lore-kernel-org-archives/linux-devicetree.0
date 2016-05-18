From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/2 V3] dt: add Atmel Captouch bindings
Date: Wed, 18 May 2016 14:59:14 -0700
Message-ID: <20160518215914.GA4081@dtor-ws>
References: <1463432094-146726-1-git-send-email-grundler@chromium.org>
 <20160518164404.GA31862@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160518164404.GA31862@rob-hp-laptop>
Sender: linux-input-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Grant Grundler <grundler@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-input <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Hung-yu Wu <hywu@google.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 18, 2016 at 11:44:04AM -0500, Rob Herring wrote:
> On Mon, May 16, 2016 at 01:54:53PM -0700, Grant Grundler wrote:
> > From: Daniel Hung-yu Wu <hywu@google.com>
> > 
> > Add binding for Atmel Capacitive Touch Button device.
> > 
> > Signed-off-by: Daniel Hung-yu Wu <hywu@google.com>
> > Signed-off-by: Grant Grundler <grundler@chromium.org>
> > ---
> >  .../devicetree/bindings/input/atmel,captouch.txt   | 36 ++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/atmel,captouch.txt
> 
> Acked-by: Rob Herring <robh@kernel.org>

Folded into the driver patch and applied.

Thanks.

-- 
Dmitry
