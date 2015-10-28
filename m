From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v12 3/6] fpga: add simple-fpga-bus
Date: Wed, 28 Oct 2015 13:33:02 -0700
Message-ID: <CAAtXAHcQDEhUe7ArZhA8D75=ZsGZD8NsL_nqTNTzd4zVqswkQQ@mail.gmail.com>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com>
	<1445983755-24007-4-git-send-email-atull@opensource.altera.com>
	<20151028100714.GB7779@jcartwri.amer.corp.natinst.com>
	<CAAtXAHcaSZaKhYtVFbUEuO+boMh_PgUaOGVtjO_5MDkpcLcmWA@mail.gmail.com>
	<20151028161859.GJ8245@jcartwri.amer.corp.natinst.com>
	<CAAtXAHdry3_A9ow-w5KQg80ECyaAuSGVit9ygcM7Ffc9yiysMA@mail.gmail.com>
	<alpine.DEB.2.02.1510281151480.28209@linuxheads99>
	<20151028175916.GK8245@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20151028175916.GK8245@jcartwri.amer.corp.natinst.com>
Sender: linux-doc-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: atull <atull@opensource.altera.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

[..]
> I do not think it's a good fit for the socfpga, or for the lower level
> fpga drivers _in general_.  Nor do I think that the FPGA Bridge
> framework, as written, is a good fit for fpgas in general.

Could you elaborate a bit more on why you feel that way? For all
configurations that I could
create in my mind (even hierarchical) I could come up with a way to
model that using the
proposed architecture in a very natural way. I'm of course aware that
my imagination is limited ;-)

Cheers,

Moritz
