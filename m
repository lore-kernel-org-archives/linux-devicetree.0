From: Rob Herring <robh@kernel.org>
Subject: Re: arc vendor prefix
Date: Tue, 25 Sep 2018 10:23:08 -0500
Message-ID: <20180925152308.GA21227@bogus>
References: <527da392-9629-792b-08cc-970ffc8173ee@gmail.com>
 <20180920130952.7eb8e45c@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180920130952.7eb8e45c@alans-desktop>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc: Brian Dodge <bdodge09@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 20, 2018 at 01:09:52PM +0100, Alan Cox wrote:
> On Tue, 18 Sep 2018 21:05:20 -0400
> Brian Dodge <bdodge09@gmail.com> wrote:
> 
> > Hi,
> > 
> > In the linux kernel commit 91ab076e3a2f092254fe5231bbfa92b37fd52e38 the 
> > vendor prefix "arctic" was added to vendor-prefixes.txt.
> > 
> > The original change I authored used "arc" not "arctic", and the device 
> > tree bindings were added assuming that prefix in commit 
> > ce9d22573d85341c987f997461ac712e4dbe47b1
> > 
> > Perhaps odeju changed the name to arctic in the patch after I created it 
> > and before it was approved.
> > 
> > This pairing isn't really compatible is it?  Either the prefix should be 
> > reverted to "arc" or the bindings (and driver source) changed to use 
> > "arctic", as in "arctic,arc2c0608" vs. "arc,arc2c0608"
> 
> ARC is a Synopsys registered trademark for the ARC processor line. I'm not
> sure what the right answer is but I think it might be better to keep to
> arctic to avoid confusion with arc based products.

Agreed.

Rob
