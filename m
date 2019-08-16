Return-Path: <robherring2@gmail.com>
Date: Fri, 16 Aug 2019 17:14:33 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: DT yaml bindings: handling of complicated compatible property
Message-ID: <20190816221433.GA25289@bogus>
References: <CAMRc=Mc_9=3xYWrrn=naQgFprgLA4wkNJQE1niSiYiACi5XFiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc_9=3xYWrrn=naQgFprgLA4wkNJQE1niSiYiACi5XFiw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 29, 2019 at 10:31:17AM +0200, Bartosz Golaszewski wrote:
> Hello,
> 
> I decided to attempt to convert the DT binding for AT24 EEPROM driver
> to yaml and am not sure on how to handle the compatible property with
> a lot of options.
> 
> In at24 we support 23 models and 8 vendors (184 vendor,model
> combinations) plus 5 exceptions (with model names not following the
> general convention).
> 
> Do I simply use the oneOf specifier and list all possible options? Or
> is there a better approach.

Normally, yes. But this one is a bit special. You can use 'pattern' to 
address the 184 cases with a regex and then the 5 exceptions under other 
oneOf entries.

Rob
