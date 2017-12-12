From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 4/4] [v4] pinctrl: qcom: qdf2xxx: add support for new
 ACPI HID QCOM8002
Date: Tue, 12 Dec 2017 13:07:16 +0200
Message-ID: <1513076836.25007.641.camel@linux.intel.com>
References: <1512170904-4749-1-git-send-email-timur@codeaurora.org>
 <1512170904-4749-5-git-send-email-timur@codeaurora.org>
 <CACRpkdYer_Q5R4XhWTX3=jwshcKZRSDY9=gOvSeUPsQHbUw6vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYer_Q5R4XhWTX3=jwshcKZRSDY9=gOvSeUPsQHbUw6vw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>
Cc: Archit Taneja <architt@codeaurora.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Andy Gross <andy.gross@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Varadarajan Narayanan <varada@codeaurora.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2017-12-12 at 11:42 +0100, Linus Walleij wrote:
> On Sat, Dec 2, 2017 at 12:28 AM, Timur Tabi <timur@codeaurora.org>
> wrote:

> > +               /* The number of GPIOs in the approved list */
> > +               ret = device_property_read_u16_array(&pdev->dev,
> > "gpios",
> > +                                                    NULL, 0);
> > +               if (ret < 0) {
> > +                       dev_err(&pdev->dev, "missing 'gpios'
> > property\n");
> > +                       return ret;
> > +               }
> 
> This is in direct conflict with the existing "gpios" binding in device
> tree.
> 
> Where is this name coming from? ACPI standards?

Not ACPI standards as of my knowledge. ACPI standard defines a common
scheme how to define properties, it doesn't tell anything about property
names or any mappings between names to values or names to "OS
subsystem").

As for GPIO we just follow *de facto* what DT has right now, i.e. "xxx-
gpio" or "xxx-gpios" pattern is used to map ACPI standard resource to a
GPIO name. That's how GPIO ACPI lib is being developed.

> If device tree and ACPI start defining things which are in direct
> conflict
> we can just shut down this device_property() business altogether,
> it will never work that way.

This is fully understandable. Also it works in other direction, i.e. if
DT will break the established thing it will break also ACPI and built-in 
device properties.

We are keeping an eye on this not to happen as much as we can in any
direction.

So, summarize above, I don't see any impediments (except maybe very
broken ARM64 firmware that is already on devices on market) to make it
properly from the beginning.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
