From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] eeprom: Add IDT 89HPESx EEPROM/CSR driver
Date: Fri, 13 Jan 2017 12:47:52 +0300
Message-ID: <20170113094752.GA9404@mobilestation>
References: <1480458434-22523-1-git-send-email-fancer.lancer@gmail.com>
 <1481638971-6247-1-git-send-email-fancer.lancer@gmail.com>
 <1481638971-6247-2-git-send-email-fancer.lancer@gmail.com>
 <20170111082119.GA26387@kroah.com>
 <20170112225417.GA21220@mobilestation>
 <20170113072235.GA12825@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170113072235.GA12825-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2017 at 08:22:35AM +0100, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Fri, Jan 13, 2017 at 01:54:17AM +0300, Serge Semin wrote:
> > On Wed, Jan 11, 2017 at 09:21:19AM +0100, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> > > > +	/* Return failure if root directory doesn't exist */
> > > > +	if (!csr_dbgdir) {
> > > > +		dev_dbg(dev, "No Debugfs root directory");
> > > > +		return -EINVAL;
> > > > +	}
> > > 
> > > If debugfs is not enabled, don't error out, just keep going, it should
> > > never stop kernel code from running properly.
> > > 
> > > Also, this test isn't really doing what you think it is doing...
> > > 
> > 
> > I see, it must be replaced with IS_ERR_OR_NULL() test.
> 
> No!  That's a pain, when the debugfs interface was created its goal was
> to make it _easy_ to use, not hard.  IS_ERR_OR_NULL() is hard, and
> messy, don't do that.
> 
> > But I don't think,
> > it would be good to get rid of dev_dbg() completely here. In case if
> > debugging is enabled, user would understand why csr-node isn't created within
> > DebugFS directory. I don't see the reasoning why one shouldn't know a source
> > of possible problems.
> > (See the next comment as continue of the discussion)
> 
> Why would a user care about debugfs?
> 
> > > > +	/* Create Debugfs directory for CSR file */
> > > > +	snprintf(fname, CSRNAME_LEN, "%d-%04hx", cli->adapter->nr, cli->addr);
> > > > +	pdev->csr_dir = debugfs_create_dir(fname, csr_dbgdir);
> > > > +	if (IS_ERR_OR_NULL(pdev->csr_dir)) {
> > > > +		dev_err(dev, "Failed to create CSR node directory");
> > > > +		return -EINVAL;
> > > 
> > > Again, don't do this, you really don't care if debugfs worked or not.
> > > 
> > 
> > Actually the driver doesn't stop the kernel code from running, if it finds out
> > any problem with DebugFS CSR-node creation. The function just logs the error
> > and return error status. Take a look the place the method is called:
> > 1489        /* Create debugfs files */
> > 1490        (void)idt_create_dbgfs_files(pdev);
> > The initialization code doesn't check the return value at all, so the driver
> > will proceed with further code.
> > Why did I make the function with return value? Because it's a good style to
> > always return a status of function code execution if it may fail, but only
> > caller will decide whether to check the return value or not.
> 
> There is only one type of error that a debugfs call can return, and that
> is if debugfs is not enabled in the build.  That's it, you don't need to
> care about any of that.
> 
> > Regarding the error printing. In case if the code gets to this check, one can
> > be sure the DebugFS works properly, so in case if the driver failed to create
> > the corresponding sub-directory or node, it is really error to have any failure
> > at this point, and a user should be notified. But still the driver won't stop
> > functioning, since the caller doesn't check the return value.
> > 
> > Hopefully you'll understand my point.
> 
> Please understand mine, debugfs is supposed to be easy to use, you are
> not testing things properly here, and when you are, it doesn't matter.
> Just call the functions, save the return results if you need to (for
> dentries and the like), and move on.  No error handling needed AT ALL!
> 
> Yes, it feels "odd" for kernel code, but remember, this is only for
> debugging.  Your code should not have any different codepaths for if the
> debugging logic worked or not.  It doesn't care at all.  So please, make
> it simple.
> 
> > > > +	dev_dbg(dev, "Debugfs-files created");
> > > 
> > > You do know about ftrace, right?  Please remove all of these
> > > "trace-like" debugging lines, they aren't needed for anyone.
> > > 
> > 
> > Ok, I'll remove all these prints, even though I do find these prints being
> > handy to have initialization process printed on debugging stage.
> 
> Then use ftrace, that is what it is there for, don't roll your own
> driver-specific-functionality please.
> 
> thanks,
> 
> greg k-h

Ok, I see your point and do as you say.

Thanks,
Serge

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
