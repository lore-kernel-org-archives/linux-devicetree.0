From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH V4 4/4] dt-bindings: iio: adc: ad7192: Add binding
 documentation for AD7192
Date: Sun, 8 Sep 2019 11:29:07 +0100
Message-ID: <20190908112907.6d9b8370@archlinux>
References: <20190902130831.23057-1-mircea.caprioru@analog.com>
        <20190902130831.23057-4-mircea.caprioru@analog.com>
        <20190903172937.GA15494@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903172937.GA15494@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mircea Caprioru <mircea.caprioru@analog.com>, Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 3 Sep 2019 18:29:37 +0100
Rob Herring <robh@kernel.org> wrote:

> On Mon, 2 Sep 2019 16:08:31 +0300, Mircea Caprioru wrote:
> > This patch add device tree binding documentation for AD7192 adc in YAML
> > format.
> > 
> > Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
It seems that I messed up before and didn't actually revert the v3 patch.

I'll roll a small fix patch to bring the tree inline with this and send out to the
list.

Sorry about this. One of many things that went wrong in that last pull request!

Jonathan

> > ---
> > Changelog V2:
> > - no changes here
> > 
> > Changelog V3:
> > - no changes here
> > 
> > Changelog V4:
> > - remove the const value from avdd and dvdd supply
> > 
> >  .../bindings/iio/adc/adi,ad7192.yaml          | 119 ++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
