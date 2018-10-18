From: Kun Yi <kunyi@google.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add adm127x documentation
Date: Thu, 18 Oct 2018 13:39:32 -0700
Message-ID: <CAGMNF6UY1dS83h+zSauHqjETWM7rzpc3EmAEwNSCr0HW0J=cAg@mail.gmail.com>
References: <20181017222710.254994-1-kunyi@google.com> <20181018194758.GA21705@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018194758.GA21705@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 12:48 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 17 Oct 2018 15:27:09 -0700, Kun Yi wrote:
> > adm127x are hot-swap controllers that allow a circuit board to be removed from
> > or inserted into a live backplane. This patch adds the device tree
> > bindings documentation.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
> > ---
> >  .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks a lot for the Review!


-- 
Regards,
Kun
