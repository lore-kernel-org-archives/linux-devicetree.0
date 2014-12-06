From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] fpga manager: framework core
Date: Sat, 6 Dec 2014 13:01:40 +0000
Message-ID: <CACxGe6tiLxbCThzjOqrQg44Ue3XJuuRgti5jZY=UrssSY8=xqg@mail.gmail.com>
References: <1414007405-32186-1-git-send-email-atull@opensource.altera.com>
 <1414007405-32186-3-git-send-email-atull@opensource.altera.com>
 <20141024105200.GA20775@amd> <B914D894-E486-4EF1-8F84-169E939C58B4@konsulko.com>
 <alpine.DEB.2.02.1410240906340.23446@atx-linux-37>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1410240906340.23446@atx-linux-37>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ira Snyder <iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini <rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, kyle.teske-acOepvfBmUk@public.gmane.org, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 24, 2014 at 3:54 PM, atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> On Fri, 24 Oct 2014, Pantelis Antoniou wrote:
>
>> Hi Pavel,
>>
>> > On Oct 24, 2014, at 1:52 PM, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org> wrote:
>> >
>> > Hi!
>> >
>> >> * /sys/class/fpga_manager/<fpga>/firmware
>> >>  Name of FPGA image file to load using firmware class.
>> >>  $ echo image.rbf > /sys/class/fpga_manager/<fpga>/firmware
>> >
>> > I .. still don't think this is good idea. What about namespaces?
>> > The path corresponds to path in which namespace?
>> >
>
> Hi Pavel,
>
> Sorry if my documentation is too brief here.  The context is the
> firmware class.  The 'image.rbf' is a image file that is located
> on the filesystem in the firmware search patch.
> See Documentation/firmware_class/README.
>
> Basically we need some way of loading a FPGA image to the FPGA.
> I don't think any one way is going to meet everybody's needs so
> I wanted to export enough functions from fpga-mgr.c that other
> interfaces can by built.  I think firmware will work just fine
> for some people and it is great in that it already exists in the
> kernel.
>
> If I missed your point, please let me know.
>
>>
>> FWIW the overlays patchset uses binary configfs attribute to make this work.
>>
>
> Hi Pantelis,
>
> Yes I think you've mentioned that before.  So that would be another
> way of giving a device tree overlay to configfs, right?  I should
> that to the documentation in the patch header.
>
>> >> +int fpga_mgr_write(struct fpga_manager *mgr, const char *buf, size_t count)
>> >> +{
>> >> +  int ret;
>> >> +
>> >> +  if (test_and_set_bit_lock(FPGA_MGR_BUSY, &mgr->flags))
>> >> +          return -EBUSY;
>> >> +
>> >> +  dev_info(mgr->dev, "writing buffer to %s\n", mgr->name);
>> >> +
>> >> +  ret = __fpga_mgr_write(mgr, buf, count);
>> >> +  clear_bit_unlock(FPGA_MGR_BUSY, &mgr->flags);
>> >> +
>> >> +  return ret;
>> >> +}
>> >> +EXPORT_SYMBOL_GPL(fpga_mgr_write);
>> >
>> > Is the EBUSY -- userspace please try again, but you don't know when to
>> > try again -- right interface? I mean, normally kernel would wait, so
>> > that userland does not have to poll?
>> >
>
> Yes, for fpga_mgr_write it may be more useful for this to be
> a blocking call.
>
>> >> +static ssize_t fpga_mgr_firmware_store(struct device *dev,
>> >> +                                 struct device_attribute *attr,
>> >> +                                 const char *buf, size_t count)
>> >> +{
>> >> +  struct fpga_manager *mgr = dev_get_drvdata(dev);
>> >> +  unsigned int len;
>> >> +  char image_name[NAME_MAX];
>> >> +  int ret;
>> >> +
>> >> +  /* lose terminating \n */
>> >> +  strcpy(image_name, buf);
>> >> +  len = strlen(image_name);
>> >> +  if (image_name[len - 1] == '\n')
>> >> +          image_name[len - 1] = 0;
>> >> +
>> >> +  ret = fpga_mgr_firmware_write(mgr, image_name);
>> >> +  if (ret)
>> >> +          return ret;
>> >> +
>> >> +  return count;
>> >> +}
>> >
>> > This shows why the interface is not right... Valid filename may
>> > contain \n, right? It may even end with \n.
>> >
>>
>> I could argue that a valid firmware file is one that's well formed and does not
>> contain those characters.
>>
>> I guess this is only for make echo file >foo work. You could specify that echo -n file >foo is
>> required.
>>
>
> I am accustomed to doing 'echo -n' for most of sysfs anyway.  Once in a
> while I am a bonehead and forget the '-n' and spend a few minutes
> wondering why this thing that worked last week suddenly rejects all
> commands.  I'm just trying to make my user interface a bit user-friendly.
>
> I will take out the '\n' stripping and update the documentation.  I didn't
> realize this would be controversial.

Don't. You're doing the right thing by scrubbing your input. Requiring
'echo -n' is just stupid when it is so easy to make work easily.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
