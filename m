From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/2] drivers/core/of: Add symlink to device-tree from
 devices with an OF node
Date: Wed, 18 Feb 2015 09:16:12 +1100
Message-ID: <1424211372.21410.104.camel@kernel.crashing.org>
References: <1424059156.21410.38.camel@kernel.crashing.org>
	 <CAL_JsqKWJmt9e5hts1F6Yv_FqodJ6pkmqmxBqBp=Y33w+dPj9w@mail.gmail.com>
	 <20150217150919.GA18008@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150217150919.GA18008@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-02-17 at 07:09 -0800, Greg Kroah-Hartman wrote:
> > 
> > Doesn't this need sysfs documentation?
> 
> Yes it does.

Ok, will do.

> > > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > 
> > I don't mind applying, but this is Greg's code.
> > 
> > Rob
> > 
> > > ---
> > >  drivers/base/core.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > index 97e2baf..61ef574 100644
> > > --- a/drivers/base/core.c
> > > +++ b/drivers/base/core.c
> > > @@ -469,6 +469,7 @@ static int device_add_attrs(struct device *dev)
> > >  {
> > >         struct class *class = dev->class;
> > >         const struct device_type *type = dev->type;
> > > +       struct device_node *of_node;
> > >         int error;
> > >
> > >         if (class) {
> > > @@ -493,6 +494,13 @@ static int device_add_attrs(struct device *dev)
> > >                         goto err_remove_dev_groups;
> > >         }
> > >
> > > +       of_node = dev_of_node(dev);
> > > +       if (of_node) {
> > > +               error = sysfs_create_link(&dev->kobj, &of_node->kobj, "of_node");
> > > +               if (error)
> > > +                       dev_warn(dev, "Error %d creating of_node link\n", error);
> > > +       }
> 
> You don't clean up the link when the device is removed?

Hrm, I suppose I do :-) 

> And why do it here and not in device_add_class_symlinks() like all other
> devices do?

Well, device_add_class_symlinks() had "class" in the name so I
(incorrectly) assumed that was for class related stuff, but I see
that the parent pointer is there too. Also originally my patch was
adding an attribute and got turned into a symlink later. I'll move
it.

Cheers,
Ben.

> thanks,
> 
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
