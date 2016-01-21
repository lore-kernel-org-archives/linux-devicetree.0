From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v15 5/6] fpga: fpga-area and fpga-bus: device tree control
 for FPGA
Date: Thu, 21 Jan 2016 15:44:34 +0100
Message-ID: <CAAtXAHeNXyro3=TOoHehFQMTFdwWD5oBxS3H5cvxiuZx+Zvehw@mail.gmail.com>
References: <1453317867-10422-1-git-send-email-atull@opensource.altera.com>
	<1453317867-10422-6-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1453317867-10422-6-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Hi Alan,

minor nits inline:

On Wed, Jan 20, 2016 at 8:24 PM,  <atull@opensource.altera.com> wrote:

> v15: Add altr,fpga-bus implementation
>      Change compatible string "fpga-area" -> "altr,fpga-area"

Doesn't look that way down there. Or am I reading the code wrong?

> +static const struct of_device_id fpga_area_of_match[] = {
> +       { .compatible = "fpga-area", },

I'm fine with keeping it as fpga-area, this isn't altera specific imho

Cheers,

Moritz
