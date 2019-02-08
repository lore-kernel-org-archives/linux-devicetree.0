From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 3/5] misc: fastrpc: Add support for context Invoke
 method
Date: Fri, 8 Feb 2019 15:11:20 +0100
Message-ID: <20190208141120.GA9516@kroah.com>
References: <20190208132306.12571-1-srinivas.kandagatla@linaro.org>
 <20190208132306.12571-4-srinivas.kandagatla@linaro.org>
 <20190208135514.GA23406@kroah.com>
 <b60a0c35-6e5a-4166-9dd8-3891fce1cd0b@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b60a0c35-6e5a-4166-9dd8-3891fce1cd0b@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: arnd@arndb.de, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, bkumar@qti.qualcomm.com, linux-arm-msm@vger.kernel.org, Thierry Escande <thierry.escande@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 08, 2019 at 02:01:33PM +0000, Srinivas Kandagatla wrote:
> Thanks for the review,
> 
> On 08/02/2019 13:55, Greg KH wrote:
> > > +
> > > +		/* Make sure reserved field is set to 0 */
> > > +		if (args->reserved) {
> > > +			kfree(args);
> > > +			return -EINVAL;
> > Am I wrong in that you are only checking the first reserved field in
> > this array of args?  Don't you have a whole bunch of them here (nscalars
> > of them)?  Don't you need to check them all and not just the first one?
> My Bad, there should be a loop here!
> I will fix this in next version!

No, you don't need to loop it here, check it in the call that evaluates
the individual args, which will catch the issue when people send
"internal" commands.

Which reminds me, what happens if a sequence has problems half way
through the list of args?  Do you "roll back" to the beginning, or just
abort?  What happens to the internal device state then?

thanks,

greg k-h
