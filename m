From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [Question] refcount of DT node
Date: Thu, 14 Apr 2016 09:48:49 +0100
Message-ID: <20160414084849.GT19428@n2100.arm.linux.org.uk>
References: <CAK7LNATFUW2KXUpFas6C_SJ0C7Qb1DWU0njLg-FCYciK2U6Oag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNATFUW2KXUpFas6C_SJ0C7Qb1DWU0njLg-FCYciK2U6Oag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 14, 2016 at 04:47:57PM +0900, Masahiro Yamada wrote:
> Hi experts.
> 
> My understanding of refcount of DT node is poor.

The message from DT people is... don't worry about DT node refcounting.
Do whatever you want with it, they don't care whether you have correct
refcounting or not.

The background behind that is that I've tried to fix the refcounting,
and even had the coccinelle people generate some stuff to work on this
issue, but DT people's attitude towards it is "don't bother".

So yes, people may get it wrong, but it seems it's something that DT
people want ignored.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
