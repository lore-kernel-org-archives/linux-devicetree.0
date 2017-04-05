From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: cpu of_node links broken
Date: Wed, 05 Apr 2017 17:58:04 +1000
Message-ID: <1491379084.4166.82.camel@kernel.crashing.org>
References: <CAMgXwThQk=3V1HQ8YpoY57mpY0SrdyfAwS5szpsqwkS-r=FPAw@mail.gmail.com>
         <1491374467.4166.81.camel@kernel.crashing.org>
         <CAMgXwThRqAO0vG0QVC7LYO2Srf9inh+osw7+u21abRVhH0LDSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMgXwThRqAO0vG0QVC7LYO2Srf9inh+osw7+u21abRVhH0LDSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wesley Terpstra <wesley-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-04-04 at 23:49 -0700, Wesley Terpstra wrote:
> On Tue, Apr 4, 2017 at 11:41 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> > > [    0.010000] cpu cpu0: Error -2 creating of_node link
> > 
> > Interesting. I've never seen that error, I wonder if that's because
> > we fail to link the CPU to an OF node to begin with on our
> > platforms.
> 
> You can find quite a few dmesg traces on google that include the
> warning. It affects at least nios2, microblaze and riscv.
> 
> It's because the 'sd' pointer in the of_node's kobject is null, which
> causes sysfs_do_create_link_sd to return -ENOENT. AFAICT, it's null
> because the device tree nodes have not yet been linked into sysfs;
> that is what of_core_init() does.
> 
> > Devices might try to create symlinks to device-tree nodes,
> > thus all devices that have OF node linkages should be created
> > after of_core_init() has been called.
> 
> Your proposed patch fixes the warning for me on riscv.

Thanks. I'll smoke-test it on powerpc tomorrow (and figure out why we
don't hit the warning) and submit it formally to Greg.

Remind me if I forget, I'm rather swamped these days :)

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
