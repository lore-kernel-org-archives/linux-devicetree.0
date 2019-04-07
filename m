From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: iio: adc: Add AD7616 ADC documentation
Date: Sun, 7 Apr 2019 11:55:49 +0100
Message-ID: <20190407115549.56085920@archlinux>
References: <20190402131841.8430-1-beniamin.bia@analog.com>
 <20190402131841.8430-3-beniamin.bia@analog.com>
 <5ca841f0.1c69fb81.3c62c.c015@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <5ca841f0.1c69fb81.3c62c.c015@mx.google.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh@kernel.org>
Cc: devel@driverdev.osuosl.org, mark.rutland@arm.com, lars@metafoo.de, biabeniamin@outlook.com, Michael.Hennerich@analog.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, Beniamin Bia <beniamin.bia@analog.com>
List-Id: devicetree@vger.kernel.org

On Sat, 06 Apr 2019 01:06:39 -0500
Rob Herring <robh@kernel.org> wrote:

> On Tue, 2 Apr 2019 16:18:41 +0300, Beniamin Bia wrote:
> > Document support for AD7616 Analog to Digital Converter.
> > 
> > Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/adi,ad7606.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan
