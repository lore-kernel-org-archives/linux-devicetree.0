From: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/2] RISC-V: sifive_l2_cache: Add L2 cache controller
 driver for SiFive SoCs
Date: Fri, 26 Apr 2019 11:04:46 +0530
Message-ID: <CAJ2_jOGi3uTX2GhbFC-m7hHkSFAAS_-F7J-L_=3OYKpeexaaQA@mail.gmail.com>
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
 <1556171696-7741-3-git-send-email-yash.shah@sifive.com> <20190425101757.GB8469@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425101757.GB8469@e107155-lin>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, mark.rutland@arm.com, robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 25, 2019 at 3:48 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Thu, Apr 25, 2019 at 11:24:56AM +0530, Yash Shah wrote:
> > The driver currently supports only SiFive FU540-C000 platform.
> >
> > The initial version of L2 cache controller driver includes:
> > - Initial configuration reporting at boot up.
> > - Support for ECC related functionality.
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>
> [....]
>
> > +static const struct file_operations l2_fops = {
> > +     .owner = THIS_MODULE,
> > +     .open = simple_open,
> > +     .write = l2_write
> > +};
> > +
> > +static void setup_sifive_debug(void)
> > +{
> > +     sifive_test = debugfs_create_dir("sifive_l2_cache", NULL);
> > +     if (!sifive_test)
>
> Drop the conditional check above, Greg K H removed lots of them recently.
> In his words: When calling debugfs functions, there is no need to ever
> check the return value.  The function can work or not, but the code
> logic should never do something different based on this.
>
> He may not like to see this :)

Sure, thanks for pointing it out. Will drop all the conditional check
in debugfs functions.

>
> > +             return;
> > +
> > +     if (!debugfs_create_file("sifive_debug_inject_error", 0200,
> > +                              sifive_test, NULL, &l2_fops))
>
> Ditto.
>
> > +             debugfs_remove_recursive(sifive_test);
> > +}
>
> --
> Regards,
> Sudeep

Thanks for your comments.

- Yash
