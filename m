From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] devres: Add devm_of_iomap()
Date: Fri, 22 Jun 2018 14:09:41 +0900
Message-ID: <20180622050941.GA28638@kroah.com>
References: <acf43685e55ff104ed3bf59d91264fdeec029cf2.camel@kernel.crashing.org>
 <5a28adfe74dcea35d704d98e54b2bbb72bcd6b8f.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5a28adfe74dcea35d704d98e54b2bbb72bcd6b8f.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 22, 2018 at 02:13:15PM +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2018-06-14 at 13:31 +1000, Benjamin Herrenschmidt wrote:
> > There are still quite a few cases where a device might want
> > to get to a different node of the device-tree, obtain the
> > resources and map them.
> > 
> > This is generally open coded in drivers which is quite error prone
> > 
> > We have of_iomap() and of_io_request_and_map() but they both
> > have shortcomings, such as not returning the size of the
> > resource found (which can be useful) and not being "managed".
> > 
> > This adds a devm_of_iomap() that provides all of these and
> > should probably replace uses of the above in most drivers.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > ---
> 
> Greg, which tree should this go through ? Rob, ack pls ? :-)
> 
> I have dependencies on this coming up... I can put it in the FSI tree
> if you want, it will be part of my next pull request.

Usually new devres patches just go through whatever tree needs it, so no
objection from me for you to take these in your next pull request.

thanks,

greg k-h
