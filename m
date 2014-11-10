From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for more chips versions
Date: Mon, 10 Nov 2014 09:46:32 +0200
Message-ID: <1415605592.22935.3.camel@mm-sol.com>
References: <1415108003-16387-1-git-send-email-iivanov@mm-sol.com>
		 <CAJAp7OgU64=KCuDhYEZTYppVeBz6wKvTDsof5vDRznfdZgAfZw@mail.gmail.com>
		 <1415212271.14949.1.camel@mm-sol.com>
		 <CAJAp7OgXHGWQj7MWh51LTUdmZpgZc=6m=o-Az=z8QxR7yfrw7g@mail.gmail.com>
	 <1415260480.13103.3.camel@mm-sol.com> <545D5EEA.8020800@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <545D5EEA.8020800@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Gilad Avidov <gavidov@codeaurora.org>
Cc: Bjorn Andersson <bjorn@kryo.se>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Hi Gilad,

On Fri, 2014-11-07 at 17:08 -0700, Gilad Avidov wrote:
> On 11/6/2014 12:54 AM, Ivan T. Ivanov wrote:
> > On Wed, 2014-11-05 at 17:36 -0800, Bjorn Andersson wrote:
> > > On Wed, Nov 5, 2014 at 10:31 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:
> > > > On Wed, 2014-11-05 at 10:11 -0800, Bjorn Andersson wrote:
> > > > > On Tue, Nov 4, 2014 at 5:33 AM, Ivan T. Ivanov <iivanov@mm-sol.com>
> > > > > wrote:
> > > > > [..]
> > > > > > @@ -28,11 +144,27 @@ static int pmic_spmi_probe(struct spmi_device
> > > > > > *sdev)
> > > > > >   {
> > > > > >          struct device_node *root = sdev->dev.of_node;
> > > > > >          struct regmap *regmap;
> > > > > > +       struct property *prop;
> > > > > > +       int major, minor, ret;
> > > > > > +       char *name, compatible[32];
> > > > > > 
> > > > > >          regmap = devm_regmap_init_spmi_ext(sdev,
> > > > > > &spmi_regmap_config);
> Hi Ivan, I have a general question about this driver/layer.
> Since the driver is using regmap, why does it need to be
> qcom-*spmi*-pmic ? could we drop the spmi part?
> regmap's point is abstraction of  the bus technology, and indeed some
> PMICs use i2c.

This is driver for SPMI device, so no. The child device/drivers are
different question, but I don't want to start that discussion again.

Regards,
Ivan
