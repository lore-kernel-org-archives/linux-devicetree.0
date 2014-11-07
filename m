From: Alban <albeu@free.fr>
Subject: Re: [PATCH] OF: Add support for built in FDT blob
Date: Fri, 7 Nov 2014 13:59:31 +0100
Message-ID: <20141107135931.376caf98@tock>
References: <1415358849-25879-1-git-send-email-albeu@free.fr>
	<20141107120933.GA5487@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141107120933.GA5487@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

On Fri, 7 Nov 2014 12:09:33 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> Hi,
> 
> On Fri, Nov 07, 2014 at 11:14:09AM +0000, Alban Bedel wrote:
> > Allow embedding an FDT blob in the kernel image, this is mostly
> > useful to run new kernels on boards with old bootloaders.
> 
> I am very much not keen on embedding a DTB within a kernel. It's far
> nicer for the two to remain separate blobs, with a small shim to set
> up the DTB address.
> 
> On ARM we have appended DTB for this purpose, which is at least better
> than embedding the DT inside of the kernel.

I looked at that but that seemed quiet complicated to implement, not to
mention that it needed quiet a lot of arch specific code. On the other
hand having the DTB built in like this was trivial and would be portable
to every architecture, so that seemed like the best way to me.

> What architecture and bootloader are you using that necessitate this?

MIPS with an antic u-boot version patched by the board vendor to use
some non standard image format. Updating the boot loader is currently
not an option because of the lack of documentation for the board/SoC.

Alban
