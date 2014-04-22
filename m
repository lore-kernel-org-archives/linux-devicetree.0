From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v3 1/3] usb: chipidea: msm: Add device tree binding
 information
Date: Tue, 22 Apr 2014 18:20:41 +0300
Message-ID: <1398180041.4724.173.camel@iivanov-dev>
References: <1398159797-26917-1-git-send-email-iivanov@mm-sol.com>
	 <1398159797-26917-2-git-send-email-iivanov@mm-sol.com>
	 <535685CD.9080207@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <535685CD.9080207@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Peter Chen <Peter.Chen@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-04-22 at 16:07 +0100, Srinivas Kandagatla wrote:
> 
> On 22/04/14 10:43, Ivan T. Ivanov wrote:
> > +- interrupts:   interrupt-specifier for the controller interrupt.
> > +- usb-phy:      phandle for the PHY device
> > +- dr_mode:      Sould be "peripheral"
> s/Sould/Should/
> > +

Thanks. will fix it.

Ivan
