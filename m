From: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH 08/16] drivers/fsi: Add crc4 helpers
Date: Thu, 8 Dec 2016 10:33:08 +1100
Message-ID: <81146f25-05fa-70f9-e8ff-49c17aede8f2@ozlabs.org>
References: <1481076574-54711-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1481076574-54711-2-git-send-email-christopher.lee.bostic@gmail.com>
 <20161207090219.GA14742@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161207090219.GA14742@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>, Chris Bostic <christopher.lee.bostic@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, sre@kernel.org, mturquette@baylibre.com, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au, linux-kernel@vger.kernel.org, andrew@aj.id.au, alistair@popple.id.au, benh@kernel.crashing.org, Chris Bostic <cbostic@us.ibm.com>
List-Id: devicetree@vger.kernel.org

Hi Greg,

> Why not just create lib/crc4.c with these functions, like the other crc
> functions in the kernel?

Two (bad) reasons:

 - The crc4 implementation here is pretty specific to the FSI
   usage (only supporting 4-bit-sized chunks), to keep the math & lookup
   table simple

 - I'm lazy

So yes, we should spend the effort now to make this generic enough for
a lib/crc4.c. Would we want to support different values for the
polynomial?

Chris: do you want me to to that, or will you?

Cheers,


Jeremy
