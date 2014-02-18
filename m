From: Josh Cartwright <joshc@codeaurora.org>
Subject: Re: [PATCH v2 1/3] usb: chipidea: msm: Add device tree binding
 information
Date: Tue, 18 Feb 2014 13:07:30 -0600
Message-ID: <20140218190730.GG31116@joshc.qualcomm.com>
References: <1392729681-21022-1-git-send-email-iivanov@mm-sol.com>
 <1392729681-21022-2-git-send-email-iivanov@mm-sol.com>
 <20140218161303.GD31116@joshc.qualcomm.com>
 <1392744420.17130.24.camel@iivanov-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392744420.17130.24.camel@iivanov-dev>
Sender: linux-doc-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Brown <davidb@codeaurora.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 07:27:00PM +0200, Ivan T. Ivanov wrote:
> On Tue, 2014-02-18 at 10:13 -0600, Josh Cartwright wrote: 
> > On Tue, Feb 18, 2014 at 03:21:19PM +0200, Ivan T. Ivanov wrote:
> > >  .../devicetree/bindings/usb/msm-hsusb.txt          |   17 +++++++++++++++++
> > 
> > Is this really the appropriate place to document this?  It seems like
> > this binding doc should be merged with the i.MX ci13xxx binding in a
> > common ci13xxx doc.
> > 
>
> This driver is a "glue" layer driver which control Qualcomm 
> specific logic around Chipidea IP core. It is supposed to 
> hold "non standard" Chipidea properties, but I suppose that
> ci-hdrc-qcom.txt will be better name and will be similar to 
> i.MX chosen name.
>
> What do you think?

Sounds like an improvement to me.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
