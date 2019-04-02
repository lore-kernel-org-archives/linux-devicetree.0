From: James Morse <james.morse@arm.com>
Subject: Re: of_reserved_mem()/kexec interaction
Date: Tue, 2 Apr 2019 11:14:25 +0100
Message-ID: <f48b0010-a136-48a4-bfc7-7bbaf91b4da9@arm.com>
References: <DB6PR0402MB2727C7111A5BDBB07F05E29886550@DB6PR0402MB2727.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB6PR0402MB2727C7111A5BDBB07F05E29886550@DB6PR0402MB2727.eurprd04.prod.outlook.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Roy Pledge <roy.pledge@nxp.com>
Cc: Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Roy,

On 01/04/2019 20:09, Roy Pledge wrote:
> I'm trying to understand if memory reserved in the device tree via the
> "reserved-memory" facility is preserved during a kexec system call,
> i.e., is the memory at the same location with the contents undisturbed
> when the new kernel starts?

If the reservation is a static-allocation (so the address appears in the DT) then the new
kernel should know this is reserved too, and not touch it.

If its a dynamic-allocation, the address isn't in the DT, so the new kernel can't know. It
will dynamically allocate a new reservation, which may be in a different place. If the
data didn't matter at the first-boot, it probably doesn't matter over subsequent kexec either.

As an outlier: the gic has some funny requirements around this. It needs to dynamically
allocate a page during first-boot that is preserved over kexec. It does this using
efi_mem_reserve_persistent().


Thanks,

James
