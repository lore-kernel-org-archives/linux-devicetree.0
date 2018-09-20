From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: arc vendor prefix
Date: Thu, 20 Sep 2018 13:09:52 +0100
Message-ID: <20180920130952.7eb8e45c@alans-desktop>
References: <527da392-9629-792b-08cc-970ffc8173ee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <527da392-9629-792b-08cc-970ffc8173ee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Dodge <bdodge09@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 18 Sep 2018 21:05:20 -0400
Brian Dodge <bdodge09@gmail.com> wrote:

> Hi,
> 
> In the linux kernel commit 91ab076e3a2f092254fe5231bbfa92b37fd52e38 the 
> vendor prefix "arctic" was added to vendor-prefixes.txt.
> 
> The original change I authored used "arc" not "arctic", and the device 
> tree bindings were added assuming that prefix in commit 
> ce9d22573d85341c987f997461ac712e4dbe47b1
> 
> Perhaps odeju changed the name to arctic in the patch after I created it 
> and before it was approved.
> 
> This pairing isn't really compatible is it?  Either the prefix should be 
> reverted to "arc" or the bindings (and driver source) changed to use 
> "arctic", as in "arctic,arc2c0608" vs. "arc,arc2c0608"

ARC is a Synopsys registered trademark for the ARC processor line. I'm not
sure what the right answer is but I think it might be better to keep to
arctic to avoid confusion with arc based products.

Alan
