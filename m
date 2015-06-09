From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 1/2] of/unittest: Show broken behaviour in the platform
 bus
Date: Tue, 09 Jun 2015 12:05:37 +0100
Message-ID: <20150609110537.CC767C40580@trevor.secretlab.ca>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
	<1433686811-12303-2-git-send-email-grant.likely@linaro.org>
	<CAL_JsqK0rq6+WeK4hVMYQnKUd2K7co3vi=DpF8pjH6tbt0B5vQ@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK0rq6+WeK4hVMYQnKUd2K7co3vi=DpF8pjH6tbt0B5vQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 8 Jun 2015 15:16:39 -0500
, Rob Herring <robh@kernel.org>
 wrote:
> On Sun, Jun 7, 2015 at 9:20 AM, Grant Likely <grant.likely@linaro.org> wrote:
> > Add a single resource to the test bus device to exercise the platform
> > bus code a little more. This isn't strictly a devicetree test, but it is
> > a corner case that the devicetree runs into. Until we've got platform
> > device unittests, it can live here. It doesn't need to be an explicit
> > text because the kernel will oops when it is wrong.
> 
> Isn't the unittest oops'ing a problem?

Yes, but an oops while running unittests automatically means unittests
have failed. :-)

> > Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> > Cc: Wolfram Sang <wsa@the-dreams.de>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > Signed-off-by: Grant Likely <grant.likely@linaro.org>
> > ---
> >  drivers/of/unittest.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> > index 18016341d5a9..0a27b38c3041 100644
> > --- a/drivers/of/unittest.c
> > +++ b/drivers/of/unittest.c
> > @@ -753,6 +753,11 @@ static void __init of_unittest_match_node(void)
> >         }
> >  }
> >
> > +static struct resource test_bus_res = {
> > +       .start = 0xfffffff8,
> > +       .end = 0xfffffff9,
> > +       .flags = IORESOURCE_MEM,
> > +};
> >  static const struct platform_device_info test_bus_info = {
> >         .name = "unittest-bus",
> >  };
> > @@ -795,6 +800,7 @@ static void __init of_unittest_platform_populate(void)
> >         if (rc)
> >                 return;
> >         test_bus->dev.of_node = np;
> > +       platform_device_add_resources(test_bus, &test_bus_res, 1);
> 
> A comment here as to the purpose of this would be useful.

I'll add this:
	/*
	 * Add a dummy resource to the test bus node after it is
	 * registered to catch problems with un-inserted resources. The
	 * DT code doesn't insert the resources, and it has caused the
	 * kernel to oops in the past. This makes sure the same bug
	 * doesn't crop up again.
	 */

g.
