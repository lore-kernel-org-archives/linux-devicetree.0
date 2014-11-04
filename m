From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH] mfd: qcom-spmi-pmic: Add support for more chips versions
Date: Tue, 04 Nov 2014 17:49:55 +0200
Message-ID: <1415116195.29957.16.camel@mm-sol.com>
References: <1415108003-16387-1-git-send-email-iivanov@mm-sol.com>
	  <5458EB64.3030203@mm-sol.com> <1415114567.29957.14.camel@mm-sol.com>
	 <5458F039.3030809@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <5458F039.3030809@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Tue, 2014-11-04 at 17:26 +0200, Stanimir Varbanov wrote:
> On 11/04/2014 05:22 PM, Ivan T. Ivanov wrote:
> > On Tue, 2014-11-04 at 17:06 +0200, Stanimir Varbanov wrote:

<snip>

> > > > +       snprintf(compatible, ARRAY_SIZE(compatible), "qcom,%s-v%d.%d",
> > > > +       name, major, minor);
> > > > +       prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> > > > +       if (prop) {
> > > > +       prop->name = kstrdup("compatible", GFP_KERNEL);
> > > > +       prop->value = kstrdup(compatible, GFP_KERNEL);
> > > > +       prop->length = strlen(prop->value);
> > > > +       of_update_property(root, prop);
> > > 
> > > of_update_property can fail, check the returned value.
> > 
> > Same thing as above, but probably allocated memory at least can be freed.
> 
> might be better idea to use devm_kzalloc and devm_kstrdup?
> 

compatible property is attached to device not to driver, so
memory should be there even after driver is unloaded, I think.

Regards,
Ivan
