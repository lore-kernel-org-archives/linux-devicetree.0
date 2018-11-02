From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: connector: Add self-powered property
Date: Fri, 2 Nov 2018 08:44:50 -0500
Message-ID: <CABGGiszdDau0ohsXb_SROAJU6AFcvx=7ucTAEXzC0dWzbZ3rAw@mail.gmail.com>
References: <20181001194501.58338-1-badhri@google.com> <20181102132758.GA6543@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102132758.GA6543@kuha.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heikki.krogerus@linux.intel.com
Cc: badhri@google.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, cw00.choi@samsung.com, a.hajda@samsung.com, jun.li@nxp.com, Guenter Roeck <linux@roeck-us.net>, jackp@codeaurora.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 2, 2018 at 8:28 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Oct 01, 2018 at 12:44:59PM -0700, Badhri Jagan Sridharan wrote:
> > >From USB_PD_R3_0
> > 7.1.5 Response to Hard Resets
> > Device operation during and after a Hard Reset is defined as follows:
> > Self-powered devices Should Not disconnect from USB during a Hard Reset
> > (see Section 9.1.2).
> > Bus powered devices will disconnect from USB during a Hard Reset due to the
> > loss of their power source.
> >
> > Therefore it is necessary to know whether the port belongs to
> > a device which is self powered or bus powered. This change
> > adds "self-powered" flag to the connector class which present indicates
> > that the port belongs to a device that is self powered. Else it is
> > bus powered usb device.
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
>
> Rob, I can see you acked one of the patches modifying tcpm.c in this
> series, but did you mean to put the tag to this patch instead?

Hum, indeed. Looks like a scripting fail in my reply. The R-by was for this one.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
