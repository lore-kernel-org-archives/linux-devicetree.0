From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: chemical: sps30: convert bindings
 to yaml
Date: Sat, 22 Jun 2019 09:48:50 +0100
Message-ID: <20190622094850.6d0bea9e@archlinux>
References: <20190620195011.30942-1-tduszyns@gmail.com>
        <20190620195011.30942-2-tduszyns@gmail.com>
        <CAL_JsqLmZPTYqSkmSo-KuqUr7FY1BqE3XX7+PhcA_0phS4X3jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLmZPTYqSkmSo-KuqUr7FY1BqE3XX7+PhcA_0phS4X3jQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Tomasz Duszynski <tduszyns@gmail.com>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 20 Jun 2019 15:21:47 -0600
Rob Herring <robh+dt@kernel.org> wrote:

> On Thu, Jun 20, 2019 at 1:52 PM Tomasz Duszynski <tduszyns@gmail.com> wrote:
> >
> > Convert existing device tree bindings to yaml.
> >
> > Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
> > ---
> >  .../bindings/iio/chemical/sensirion,sps30.txt | 12 ------
> >  .../iio/chemical/sensirion,sps30.yaml         | 39 +++++++++++++++++++
> >  2 files changed, 39 insertions(+), 12 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan
