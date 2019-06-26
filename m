From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: iio: frequency: Add ADF4372 PLL
 documentation
Date: Wed, 26 Jun 2019 20:44:19 +0100
Message-ID: <20190626204419.5b0f56f8@archlinux>
References: <1561389162-26291-1-git-send-email-stefan.popa@analog.com>
        <CAL_JsqKW5qKYOXD8N=uCdoUxuw9iT+Lw-NhJuUuUPWj0dzdv-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKW5qKYOXD8N=uCdoUxuw9iT+Lw-NhJuUuUPWj0dzdv-Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Stefan Popa <stefan.popa@analog.com>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Michael Hennerich <Michael.Hennerich@analog.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 26 Jun 2019 08:45:58 -0600
Rob Herring <robh+dt@kernel.org> wrote:

> On Mon, Jun 24, 2019 at 9:40 AM Stefan Popa <stefan.popa@analog.com> wrote:
> >
> > Document support for ADF4372 SPI Wideband Synthesizer.
> >
> > Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> > ---
> >  Documentation/devicetree/bindings/iio/frequency/adf4371.yaml | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan
