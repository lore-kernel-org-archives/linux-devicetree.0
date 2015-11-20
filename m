From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v13 4/6] fpga: add fpga bridge framework
Date: Fri, 20 Nov 2015 09:08:16 -0600
Message-ID: <alpine.DEB.2.02.1511200908010.7014@linuxheads99>
References: <1446570664-10293-1-git-send-email-atull@opensource.altera.com> <1446570664-10293-5-git-send-email-atull@opensource.altera.com> <CAAtXAHekFyL=N96vZYp9rUJMUcBW31Jj=+7J1=aiGpH4Gg1OxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHekFyL=N96vZYp9rUJMUcBW31Jj=+7J1=aiGpH4Gg1OxQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, 19 Nov 2015, Moritz Fischer wrote:

> Hi Alan,
> 
> while trying to implement something that works for Zynq along these lines
> I stumbled upon some minor stuff.
> 
> On Tue, Nov 3, 2015 at 9:11 AM,  <atull@opensource.altera.com> wrote:
> 
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int fpga_bridge_register(struct device *dev, const char *name,
> > +                        struct fpga_bridge_ops *br_ops, void *priv)
> 
> const struct fpga_bridge_ops
> 
> > +int fpga_bridge_register(struct device *dev, const char *name,
> > +                        struct fpga_bridge_ops *br_ops, void *priv);
> const struct fpga_bridge_ops
> 
> Cheers,
> 
> Moritz
> 

Hi Moritz,

Thanks!

Alan
