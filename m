From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: All device tree bindings need maintainer ack or just the 'interesting'
 ones.
Date: Sat, 14 Sep 2013 13:07:30 +0100
Message-ID: <52345182.1080609@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi All,

I'm getting a lot of IIO related device tree bindings at the moment.
Most are pretty trivial e.g.

http://marc.info/?l=linux-iio&m=137881790217809&w=2

I know you are probably still working out how the device tree maintainership
is going to work in the long run, but in the meantime do you want me to hold
these on an Ack from one of the maintainers and/or to ensure that they are all posted
to devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org?

Really the question is do you want to be completely treated like any other subsystem,
where, if a driver touches it, in how ever trivial a fashion, the assumption is it
would be unwise to not attempt to get an Ack from the relevant maintainer.

There are plenty of more 'interesting' IIO binding questions out there and obviously
those need the input from the list and maintainers!

In the meantime, we'll send everything to devicetree-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

Jonathan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
