From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 6/6] misc: fastrpc: Add support for compat ioctls
Date: Wed, 12 Dec 2018 14:41:37 +0100
Message-ID: <20181212134137.GA4358@kroah.com>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
 <20181207163513.16412-7-srinivas.kandagatla@linaro.org>
 <20181212105932.GA1990@kroah.com>
 <864aaef3-8d60-3beb-ce20-a9f41f78a32f@linaro.org>
 <20181212115037.GA31075@kroah.com>
 <9867e420-de78-abc3-ab9d-deea3cf2491e@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9867e420-de78-abc3-ab9d-deea3cf2491e@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: robh+dt@kernel.org, arnd@arndb.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 12, 2018 at 12:26:26PM +0000, Srinivas Kandagatla wrote:
> 
> 
> > > > 
> > > > What prevents you from doing that and requiring compat support?
> > > > 
> > > I removed most of the compat IOCTLS except this one.
> > > The reason is that this ioctl takes arguments which can vary in number for
> > > each call.
> > 
> > Then do not do that :)
> > 
> > Remember, you get to design the api, fix the structure size to work
> > properly everywhere.
> > 
> > > So args are passed as pointer to structure, rather than fixed
> > > size. I could not find better way to rearrange this to give a fixed size
> > > data structure. In theory number of arguments can vary from 0-255 for both
> > > in & out.
> > > 
> > > current data structure looks like this:
> > > 
> > > struct fastrpc_invoke_args {
> > > 	__s32 fd;
> > > 	size_t length;
> > > 	void *ptr;
> > > };
> > 
> > Make length and ptr both __u64 and you should be fine, right?  If you do
> > that, might as well make fd __u64 as well to align things better.
> > 
> 
> That is fine for the args structure, but below "args" pointer in "struct
> fastrpc_invoke" is still not fixed size, unless we change that to __u64
> pointing to array of struct fastrpc_invoke_args. I have seen such usages in
> i915_drm.h.
> Is that the preferred?

Yes, force all pointers to be __u64 and you should be fine.

thanks,

greg k-h
