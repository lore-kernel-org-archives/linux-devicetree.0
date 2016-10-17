From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v20 02/10] doc: fpga-mgr: add fpga image info to api
Date: Mon, 17 Oct 2016 23:00:19 +0200
Message-ID: <CAAtXAHcpwmW_7f2F9vk49hAHpOTs4rk9fFvLzn5zNdPZCy_O7A@mail.gmail.com>
References: <20161017160941.4205-1-atull@opensource.altera.com> <20161017160941.4205-3-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161017160941.4205-3-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jon Masters <jcm@redhat.com>, Michal Simek <michal.simek@xilinx.com>, Jonathan Corbet <corbet@lwn.net>, Cyril Chemparathy <cyril.chemparathy@xilinx.com>, Matthew Gerlach <mgerlach@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Devicetree List <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alan Tull <delicious.quinoa@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Alan,

couple of nits inline and some comments on ordering the patches ;-)

On Mon, Oct 17, 2016 at 6:09 PM, Alan Tull <atull@opensource.altera.com> wrote:
> This patch adds a minor change in the FPGA Mangager API

s/Mangager/Manager/

> to hold information that is specific to an FPGA image
> file.  This change is expected to bring little, if any,
> pain.
>
> An FPGA image file will have particulars that affect how the
> image is programmed to the FPGA.  One example is that
> current 'flags' currently has one bit which shows whether the
> FPGA image was built for full reconfiguration or partial
> reconfiguration.  Another example is timeout values for
> enabling or disabling the bridges in the FPGA.  As the
> complexity of the FPGA design increases, the bridges in the
> FPGA may take longer times to enable or disable.

According for the current ordering bridges are not yet defined if we
merge patches in this order?
Not terrible imho, but I thought I'd point it out. Would swapping the
order make sense?

I also think [5/10] should be squashed together with this commit to
make it an atomic change.

Apart from my comments above feel free to add my Acked-by

Thanks for keeping this going,

Moritz
