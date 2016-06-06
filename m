From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 00/22] of: Introduce of_match_device()
Date: Mon, 6 Jun 2016 11:50:47 -0700
Message-ID: <5755C607.8050602@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/06/16 01:31, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This series of patches introduces a common implementation of a function
> that can be used in iterators (such as the bus_for_each_dev() or the
> driver_for_each_device() functions) and that compare's a device's device
> tree node with the passed in data. Numerous drivers and subsystems have
> their own variant of this function, so a lot of duplication can be
> removed by making use of the common implementation.
> 
> One thing that slightly bugs me about this is that it can't be used with
> users of class_for_each_device() or class_find_device() because they get
> passed a callback that takes a const void * rather than a void * for the
> device tree node. I had at some point investigated to turn the remainder
> of the iterators into taking const void *, but there are some drivers in
> the kernel that want to modify the data passed to them, so it isn't easy
> to switch.
> 
> An alternative would be to turn the const void * into void * for all the
> callbacks of this sort, so that we can use a single set throughout the
> tree, but I'm not sure how welcome that would be. I can give that a shot
> if people think it worth, though.
> 
> Greg, any thoughts on this?
> 
> I've also kept the list of recipients very short, to get early feedback
> and buy-in from Rob and Frank on the common implementation. I expect the
> naming to allow for some good bike-shedding.

Common implementation looks fine to me.

My shot at bike-shedding is to make the function name reflect the argument
names of bus_find_device() and driver_find_device().  That would suggest
of_node_match_data().  Or if one wanted to be more concise, of_node_match()
or of_match_node().

But of_match_node() is already in wide use (for something else entirely).

And drivers/regulator/core.c is the one existing version of of_node_match():

  static int of_node_match(struct device *dev, const void *data)
  {
          return dev->of_node == data;
  }

This is an example of the 'const void *data' vs 'void *data' that you
mentioned, because this of_node_match() is used for class_find_device().
of_node_match() could be used since only one current usage of the
name would have to be changed to some other name.

So that brings me back to of_node_match_data() being my preference
because of_node_match() is entirely too similar to of_match_node(),
which seems like it would lead to confusion when I am reading code.
Then maybe a variant on that name with a 'const void *data' argument.
Like the longer than I would like of_node_match_const_data().

< snip >

-Frank
