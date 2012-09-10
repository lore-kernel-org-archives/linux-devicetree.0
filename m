From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V2 1/2] hwmon: Add devicetree bindings to gpio-fan
Date: Mon, 10 Sep 2012 14:15:48 -0400
Message-ID: <20120910181548.GH15277@titan.lakedaemon.net>
References: <1347035675-23907-1-git-send-email-jm@lentin.co.uk>
 <1347285112-13542-1-git-send-email-jm@lentin.co.uk>
 <1347285112-13542-2-git-send-email-jm@lentin.co.uk>
 <20120910152814.GA6050@lunn.ch>
 <alpine.DEB.2.00.1209101656120.10589@marmot.wormnet.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1209101656120.10589-5X291BYdrx55rAo4AelP/Ydd74u8MsAO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 10, 2012 at 05:04:26PM +0100, Jamie Lentin wrote:
> On Mon, 10 Sep 2012, Andrew Lunn wrote:
> 
> >On Mon, Sep 10, 2012 at 02:51:51PM +0100, Jamie Lentin wrote:
> >>Allow a gpio-fan to be defined in devicetree, see binding documentation
> >>for details.
> >>
> >>Changes since V1:-
> >>* Don't hide return codes [Guenter Roeck]
> >>* Remove typecast noise [Guenter Roeck]
> >>* Use of_find_property instead of counting u32s [Guenter Roeck]
> >>* Don't count GPIOs twice [Andrew Lunn]
> >>* Use of_prop_next_u32 to get records in a more obvious fashion
> >>* Use CONFIG_OF_GPIO instead of CONFIG_OF
> >>* Apply __devinitdata to of_gpio_fan_match [Andrew Lunn]
> >>
> >>Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
> >>---
> >> .../devicetree/bindings/gpio/gpio-fan.txt          |   25 +++++
> >> drivers/hwmon/gpio-fan.c                           |  116 ++++++++++++++++++++
> >> 2 files changed, 141 insertions(+)
> >> create mode 100644 Documentation/devicetree/bindings/gpio/gpio-fan.txt
> >
> >Hi Jamie
> >
> >Thanks for addressing all the issues raised. However...
> >
> >Anything before the --- ends up in the changelog entry. Anything
> >afterwards does not.
> >
> >The changes you made to address review comments is not something for
> >the changelog, so Changes since V1:- should be after the --- .
> 
> Okay, whilst I was submitting the initial DT support it was
> suggested by Grant Likely they should be above the '---'. I think I
> prefer this also, but I'll go with whatever is more likely to get
> patches accepted :)
> 
> Can resend with the content jiggled if you want, but will put them
> after the '---' in future.

There's no need to resend if this is the only issue.  I'll just clean it
up when I pull it in.  In the future, though, please do as Andrew
suggested.

thx,

Jason.
