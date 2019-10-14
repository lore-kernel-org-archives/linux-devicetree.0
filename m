From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1 3/3] docs: driver-model: Add documentation for sync_state
Date: Mon, 14 Oct 2019 16:35:12 -0700
Message-ID: <CAGETcx9ke3+nGS+dBDOE9EhFhd=w6o5N+P5F7R-xNSi5fRLz_w@mail.gmail.com>
References: <20191011191521.179614-1-saravanak@google.com> <20191011191521.179614-4-saravanak@google.com>
 <20191014232828.DA62E217F9@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014232828.DA62E217F9@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>, Rob Herring <robh+dt@kernel.org>, Android Kernel Team <kernel-team@android.com>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 14, 2019 at 4:28 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Saravana Kannan (2019-10-11 12:15:21)
> > The sync_state() driver callback was added recently, but the
> > documentation was missing.  Adding it now.
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> >  .../driver-api/driver-model/driver.rst        | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >
> > diff --git a/Documentation/driver-api/driver-model/driver.rst b/Documentation/driver-api/driver-model/driver.rst
> > index 11d281506a04..baa6a85c8287 100644
> > --- a/Documentation/driver-api/driver-model/driver.rst
> > +++ b/Documentation/driver-api/driver-model/driver.rst
> > @@ -169,6 +169,49 @@ A driver's probe() may return a negative errno value to indicate that
> >  the driver did not bind to this device, in which case it should have
> >  released all resources it allocated::
> >
> > +       void (*sync_state)(struct device *dev);
>
> This is only in -next as far as I can tell. Will this be combined with a
> resend of the patch series that introduces this hook?

Based on what Greg said in the other email, I think he's going to pick
this up for driver-core-next.

-Saravana
